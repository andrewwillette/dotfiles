local opt = vim.opt

local main_auto_group = vim.api.nvim_create_augroup("main_au_grp", { clear = true })

local keymappings = require("keymappings")
-- vim.api.nvim_create_autocmd("BufEnter",
--   {
--     callback = function()
--       opt.tabstop = 4
--       opt.shiftwidth = 4
--       opt.expandtab = false
--       keymappings.testCallbackGo()
--     end,
--     pattern = "*.go",
--     group = main_auto_group
--   })

-- vim.api.nvim_create_autocmd("BufEnter",
--   {
--     callback = function()
--       keymappings.testCallbackRust()
--     end,
--     pattern = "*.rs",
--     group = main_auto_group
--   })
vim.api.nvim_create_autocmd("BufEnter",
  {
    callback = function()
      opt.expandtab = true
      opt.tabstop = 4
      opt.shiftwidth = 4
    end,
    pattern = "*.lua",
    group = main_auto_group
  })

vim.api.nvim_create_autocmd("BufRead",
  {
    callback = function()
      opt.expandtab = true
      opt.tabstop = 2
      opt.shiftwidth = 2
      -- hack to get treesitter working in markdown again, idk why needed
      vim.cmd("TSBufToggle highlight")
    end,
    pattern = { "*.norg", "*.md" },
    group = main_auto_group
  })

vim.api.nvim_create_autocmd("BufEnter",
  {
    callback = function()
      vim.bo.filetype = "lua"
    end,
    pattern = "*.nse",
    group = main_auto_group
  })
vim.api.nvim_create_autocmd({ "BufEnter", "BufRead" },
  {
    callback = function()
      vim.bo.filetype = "yaml"
    end,
    pattern = { "Gearsfile", "Bogiefile" },
    group = main_auto_group
  })
vim.api.nvim_create_autocmd({ "BufEnter", "BufRead", "BufReadPre" },
  {
    callback = function()
      vim.bo.filetype = "sql"
    end,
    pattern = "*.cql",
    group = main_auto_group
  })
vim.api.nvim_create_autocmd("BufEnter",
  {
    callback = function()
      vim.bo.filetype = "json"
    end,
    pattern = "*.avsc",
    group = main_auto_group
  })
vim.api.nvim_create_autocmd("BufEnter",
  {
    callback = function()
      vim.bo.filetype = "scala"
    end,
    pattern = "*.sbt",
    group = main_auto_group
  })
-- use tabs for filetype=template
vim.api.nvim_create_autocmd("FileType",
  {
    callback = function()
      opt.tabstop = 4
      opt.shiftwidth = 4
      opt.expandtab = false
    end,
    pattern = "template",
    group = main_auto_group
  })
vim.api.nvim_create_autocmd("FileType",
  {
    callback = function()
      opt.tabstop = 4
      opt.shiftwidth = 4
      opt.expandtab = true
    end,
    pattern = { "css", "json" },
    group = main_auto_group
  })
vim.api.nvim_create_autocmd("BufEnter",
  {
    callback = function()
      opt.tabstop = 4
      opt.shiftwidth = 4
      opt.expandtab = true
    end,
    pattern = "*.tmpl",
    group = main_auto_group
  })

vim.api.nvim_create_augroup("TxtReadMode", { clear = true })

vim.api.nvim_create_autocmd("FileType", {
  group = "TxtReadMode",
  pattern = "text",
  callback = function()
    -- Space to page down
    vim.keymap.set("n", "<Space>", "<C-f>", { buffer = true, noremap = true, silent = true })
    -- Shift+Space to page up (optional, some terminals may not register it)
    vim.keymap.set("n", "<S-Space>", "<C-b>", { buffer = true, noremap = true, silent = true })
    -- Optional: Backspace to page up
    vim.keymap.set("n", "<BS>", "<C-b>", { buffer = true, noremap = true, silent = true })

    -- Optional: Enable text wrap and linebreak for nicer reading
    vim.opt_local.wrap = true
    vim.opt_local.linebreak = true
    vim.opt_local.number = false
    vim.opt_local.relativenumber = false
  end,
})
