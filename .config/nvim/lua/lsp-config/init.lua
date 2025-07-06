require('lspconfig')

vim.lsp.config.gopls = {
  filetypes = { "go" },
  capabilities = require("keymappings").lsp_capabilities,
  on_attach = require("keymappings").lsp_on_attach,
  cmd = { "gopls" },
}

local home = os.getenv('HOME')
local sumneko_root_path = home .. "/git/lua-language-server"
local sumneko_binary = home .. "/git/lua-language-server/bin/lua-language-server"
local combined = vim.api.nvim_get_runtime_file("", true)
combined[#combined + 1] = vim.env.VIMRUNTIME

vim.lsp.config.luals = {
  filetypes = { "lua" },
  capabilities = require("keymappings").lsp_capabilities,
  on_attach = require("keymappings").lsp_on_attach,
  cmd = { sumneko_binary, "-E", sumneko_root_path .. "/main.lua" },
  -- root_dir = require("lspconfig").util.root_pattern("init.lua", ".git"),
  -- single_file_support = true,
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

vim.lsp.config.bashls = {
  cmd = { "bash-language-server", "start" },
  capabilities = require("keymappings").lsp_capabilities,
  on_attach = require("keymappings").lsp_on_attach,
  cmd_env = {
    GLOB_PATTERN = "*@(.sh|.inc|.bash|.command)"
  },
  filetypes = { "sh", "zsh" },
  single_file_support = true
}

vim.lsp.enable({ "gopls", "luals", "bashls" })
