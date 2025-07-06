local util = require 'lspconfig.util'
require 'lspconfig'.bashls.setup {
  cmd = { "bash-language-server", "start" },
  capabilities = require("keymappings").lsp_capabilities,
  on_attach = require("keymappings").lsp_on_attach,
  cmd_env = {
    GLOB_PATTERN = "*@(.sh|.inc|.bash|.command)"
  },
  filetypes = { "sh", "zsh" },
  root_dir = util.find_git_ancestor,
  single_file_support = true

}
