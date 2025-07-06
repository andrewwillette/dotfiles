require 'lspconfig'.pyright.setup {
  capabilities = require("keymappings").lsp_capabilities,
  on_attach = require("keymappings").lsp_on_attach,
  cmd = { "pyright-langserver", "--stdio" },
}
