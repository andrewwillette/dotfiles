require 'lspconfig'.solargraph.setup {
  capabilities = require("keymappings").lsp_capabilities,
  on_attach = require("keymappings").lsp_on_attach,
  settings = {
    solargraph = {
      autoformat = true,
      completion = true,
      diagnostic = true,
      folding = true,
      references = true,
      rename = true,
      symbols = true,
      max_files = 7000
    }
  }
}
