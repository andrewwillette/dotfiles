lsp_capabilities = require('cmp_nvim_lsp').default_capabilities(vim.lsp.protocol.make_client_capabilities())

local M = require("keymappings")
local set_normal_mode_keymap = function(lhs, rhs_func, opts)
  vim.keymap.set("n", lhs, function() rhs_func() end, opts)
end
local willettescripts = require("willette-scripts")

-- keymaps to be configured when attaching LSP server
function lsp_on_attach(client, bufnr)
  set_normal_mode_keymap(M.keymaps["lsp show details on item"], vim.lsp.buf.hover, {})
  vim.api.nvim_buf_set_option(0, 'formatexpr', 'v:lua.vim.lsp.formatexpr()')
  local ok, fzflua = willettescripts.verify_nvim_plugin("fzf-lua")
  if ok and fzflua then
    vim.keymap.set(
      "n", "<Leader>a",
      fzflua.lsp_code_actions,
      {})
    set_normal_mode_keymap(M.keymaps["lsp go to definition"], fzflua.lsp_definitions, {})
    set_normal_mode_keymap(M.keymaps["lsp get references"], fzflua.lsp_references, {})
    set_normal_mode_keymap(M.keymaps["lsp get implementations"], fzflua.lsp_implementations, {})
    vim.keymap.set(
      "n", M.keymaps["lsp document symbols"],
      function()
        fzflua.lsp_document_symbols({})
      end,
      {})
    set_normal_mode_keymap(M.keymaps["lsp type definitions"], fzflua.lsp_typedefs, {})
  end
  set_normal_mode_keymap(M.keymaps["lsp rename variable"], vim.lsp.buf.rename, {})
  set_normal_mode_keymap(M.keymaps["lsp diagnostic go to previous"], vim.diagnostic.goto_prev, {})
  set_normal_mode_keymap(M.keymaps["lsp diagnostic go to next"], vim.diagnostic.goto_next, {})
  local lsp_group = vim.api.nvim_create_augroup("lsp_group", { clear = true })

  vim.api.nvim_create_autocmd("BufWritePre", {
    callback = function()
      local wd = vim.fn.getcwd()
      local tab_repo = "gp.nvim" -- Define the specific repository that uses tabs

      -- Check if the working directory matches the specific pattern
      local format_with_spaces = not string.find(wd, tab_repo)

      if format_with_spaces then
        vim.lsp.buf.format({
          formatting_options = { tabSize = 2, trimTrailingWhitespace = true, insertSpaces = true }
        })
      else
        vim.lsp.buf.format({
          formatting_options = { tabSize = 4, trimTrailingWhitespace = true, insertSpaces = false }
        })
      end
    end,
    pattern = { "*.go", "*.scala", "*.lua", "*.rs" },
    group = lsp_group
  })

  local filetype = vim.api.nvim_get_option_value('ft', {})
  if filetype == 'c' then
    vim.opt.expandtab = true
    vim.opt.tabstop = 2
    vim.opt.shiftwidth = 2
  end

  vim.lsp.completion.enable(true, client.id, bufnr, {
    autotrigger = true,
    convert = function(item)
      return { abbr = item.label:gsub("%b()", "") }
    end,
  })
  vim.keymap.set("i", "<C-space>", vim.lsp.completion.get, { desc = "trigger autocompletion" })
end

vim.lsp.config.gopls = {
  filetypes = { "go" },
  capabilities = lsp_capabilities,
  on_attach = lsp_on_attach,
  cmd = { "gopls" },
}

local home = os.getenv('HOME')
local sumneko_root_path = home .. "/git/lua-language-server"
local sumneko_binary = home .. "/git/lua-language-server/bin/lua-language-server"

vim.lsp.config.luals = {
  filetypes = { "lua" },
  capabilities = lsp_capabilities,
  on_attach = lsp_on_attach,
  cmd = { sumneko_binary, "-E", sumneko_root_path .. "/main.lua" },
  -- root_dir = require("lspconfig").util.root_pattern("init.lua", ".git"),
  -- single_file_support = true,
  settings = {
    Lua = {
      runtime = {
        version = "LuaJIT",
      },
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

vim.lsp.config.bashls = {
  cmd = { "bash-language-server", "start" },
  capabilities = lsp_capabilities,
  on_attach = lsp_on_attach,
  cmd_env = {
    GLOB_PATTERN = "*@(.sh|.inc|.bash|.command)"
  },
  filetypes = { "sh", "zsh" },
  single_file_support = true
}
vim.lsp.config.rust_analyzer = {
  capabilities = lsp_capabilities,
  on_attach = lsp_on_attach,
  settings = {
    ['rust-analyzer'] = {
      diagnostics = {
        enable = true,
      }
    }
  }
}

vim.lsp.config.clangd = {
  filetypes = { "c", "cpp", "objc", "objcpp" },
  capabilities = lsp_capabilities,
  on_attach = lsp_on_attach,
  cmd = { "clangd" },
}

vim.lsp.enable({ "gopls", "luals", "bashls", "rust_analyzer", "clangd" })
