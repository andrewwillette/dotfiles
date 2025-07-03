local lsplogs = require("lsplogs")

lsplogs.setup({
  log_file = vim.fn.stdpath("data") .. "/custom_lsp_logs.log",
})
