-- local neotest_ns = vim.api.nvim_create_namespace("neotest")
-- vim.diagnostic.config({
--   virtual_text = {
--     format = function(diagnostic)
--       local message =
--       diagnostic.message:gsub("\n", " "):gsub("\t", " "):gsub("%s+", " "):gsub("^%s+", "")
--       return message
--     end,
--   },
-- }, neotest_ns)

-- local compiler = "clang"
-- local user = os.getenv("USER")
-- if user == "rjm995" then
--   compiler = "gcc"
-- end
require("neotest").setup({
  log_level = vim.log.levels.DEBUG,
  adapters = {
    require("neotest-go")({
      experimental = {
        test_table = true,
      },
      -- c_compiler = compiler,
      args = { "-count=1", "-timeout=90s", "-v" },
    }),
    require("neotest-rust") {
      args = { "--no-capture" },
    },
    require("neotest-plenary"),
  },
})

local neotest = require("neotest")
local km = require("keymappings")

local testCallbackRust = function()
  vim.keymap.set("n", km.keymaps["test nearest"], function()
      vim.api.nvim_echo({ { "calling testcallbackrust test nearest!", "Normal" } }, false, {})
      neotest.run.run({ args = "-- --nocapture" })
      neotest.output_panel.open()
    end,
    { noremap = true, silent = false })
  vim.keymap.set("n", km.keymaps["test file"], function()
      vim.cmd("TestFile -- --nocapture")
    end,
    { noremap = true, silent = false })
end

local testCallbackGo = function()
  vim.keymap.set("n", km.keymaps["test nearest"], function()
      vim.api.nvim_echo({ { "calling testcallbackgo test nearest!", "Normal" } }, false, {})
      neotest.run.run({ args = "-v -count=1" })
      neotest.output_panel.open()
    end,
    { noremap = true, silent = false })

  vim.keymap.set("n", km.keymaps["test file"], function()
      neotest.run.run(vim.fn.expand("%"))
      neotest.output_panel.open()
    end,
    { noremap = true, silent = false })

  vim.keymap.set("n", km.keymaps["run last test, test last"], function()
      neotest.run.run_last()
      neotest.output_panel.open()
    end,
    { noremap = true, silent = false })
end

vim.keymap.set(
  "n", km.keymaps["toggle test output panel"],
  function()
    neotest.output_panel.toggle()
  end,
  { noremap = true, silent = true })

vim.keymap.set("n", km.keymaps["test nearest"], function()
    vim.cmd("TestNearest -v -count=1")
    -- below doesn't find tests, for unknown reasons
    -- neotest.run.run()
    -- neotest.output_panel.open()
  end,
  { noremap = true, silent = false })
vim.keymap.set("n", km.keymaps["test file"], function()
    neotest.run.run(vim.fn.expand("%"))
    neotest.output_panel.open()
  end,
  { noremap = true, silent = false })

vim.keymap.set("n", km.keymaps["run last test, test last"], function()
    neotest.run.run_last()
    neotest.output_panel.open()
  end,
  { noremap = true, silent = false })

local verifynvimplugin = require("willette-scripts").verifynvimplugin

if verifynvimplugin("plenary") then
  vim.keymap.set("n", km.keymaps["execute plenary test on file"], "<Plug>PlenaryTestFile",
    { noremap = false, silent = false })
end
