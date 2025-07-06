local lspconfig = require("lspconfig")

lspconfig.ts_ls.setup({
  capabilities = require("keymappings").lsp_capabilities,
  on_attach = require("keymappings").lsp_on_attach
})
