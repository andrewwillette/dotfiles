local neotest_ns = vim.api.nvim_create_namespace("neotest")
vim.diagnostic.config({
  virtual_text = {
    format = function(diagnostic)
      local message =
      diagnostic.message:gsub("\n", " "):gsub("\t", " "):gsub("%s+", " "):gsub("^%s+", "")
      return message
    end,
  },
}, neotest_ns)

local compiler = "clang"
-- local user = os.getenv("USER")
-- if user == "rjm995" then
--   compiler = "gcc"
-- end
require("neotest").setup({
  log_level = vim.log.levels.INFO,
  adapters = {
    require("neotest-go")({
      experimental = {
        test_table = true,
      },
      c_compiler = compiler,
      args = { "-count=1", "-timeout=90s", "-v" },
    }),
    require("neotest-rust") {
      args = { "--no-capture" },
    },
    require("neotest-plenary"),
  },
})
