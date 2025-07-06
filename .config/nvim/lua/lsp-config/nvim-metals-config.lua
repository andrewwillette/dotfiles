local capabilities = require("keymappings").lsp_capabilities

require 'lspconfig'.metals.setup {
  capabilities = capabilities,
  on_attach = require("keymappings").lsp_on_attach,
  filetypes = { "scala", "sbt" },
  -- root_dir = util.root_pattern("build.sbt", "build.sc", "build.gradle", "pom.xml"),
  compilerOptions = {
    snippetAutoIndent = false
  },
  isHttpEnabled = true,
  statusBarProvider = "show-message"
}
-- local metals_config = require("metals").bare_config()
-- local api = vim.api
-- local nvim_metals_group = api.nvim_create_augroup("nvim-metals", { clear = true })
-- api.nvim_create_autocmd("FileType", {
--   -- NOTE: You may or may not want java included here. You will need it if you
--   -- want basic Java support but it may also conflict if you are using
--   -- something like nvim-jdtls which also works on a java filetype autocmd.
--   pattern = { "scala", "sbt", "java" },
--   callback = function()
--     require("metals").initialize_or_attach(metals_config)
--   end,
--   group = nvim_metals_group,
-- })
