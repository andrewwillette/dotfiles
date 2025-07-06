local USER = vim.fn.expand('$USER')
local home = os.getenv('HOME')
local sumneko_root_path = home .. "/git/lua-language-server"
local sumneko_binary = home .. "/git/lua-language-server/bin/lua-language-server"
local combined = vim.api.nvim_get_runtime_file("", true)
combined[#combined + 1] = vim.env.VIMRUNTIME
require 'lspconfig'.lua_ls.setup {
  on_attach = require("keymappings").lsp_on_attach,
  on_init = function(client)
    if client.workspace_folders then
      local path = client.workspace_folders[1].name
      if vim.loop.fs_stat(path .. '/.luarc.json') or vim.loop.fs_stat(path .. '/.luarc.jsonc') then
        return
      end
    end

    client.config.settings.Lua = vim.tbl_deep_extend('force', client.config.settings.Lua, {
      runtime = {
        version = 'LuaJIT'
      },
      -- Make the server aware of Neovim runtime files
      workspace = {
        checkThirdParty = false,
        library = {
          vim.env.VIMRUNTIME
          -- Depending on the usage, you might want to add additional paths here.
          -- "${3rd}/luv/library"
          -- "${3rd}/busted/library",
        }
        -- or pull in all of 'runtimepath'. NOTE: this is a lot slower
        -- library = vim.api.nvim_get_runtime_file("", true),

        -- library = combined
      }
    })
  end,

  cmd = { sumneko_binary, "-E", sumneko_root_path .. "/main.lua" },
  settings = {
    Lua = {
      diagnostics = {
        globals = {
          "vim",
          "hs",
          -- Busted
          "describe",
          "it",
          "before_each",
          "after_each",
          "teardown",
          "pending",
          "clear",
        },
        disable = { 'lowercase-global' },
      },
    }
  }
}
-- vim.print(vim.api.nvim_get_runtime_file("", true))
-- vim.print(vim.env.VIMRUNTIME)
-- -- combine nvim_get_runtime_file and VIMRUNTIME
-- local combined =
