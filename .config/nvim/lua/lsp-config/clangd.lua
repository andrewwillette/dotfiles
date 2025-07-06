local capabilities = require("keymappings").lsp_capabilities
require 'lspconfig'.clangd.setup {
  -- single_file_support = true,
  capabilities = capabilities,
  on_attach = require("keymappings").lsp_on_attach
}
