local opt = vim.opt

local mainAutoGroup = vim.api.nvim_create_augroup("mainAuGrp", { clear = true })

local keymappings = require("keymappings")
vim.api.nvim_create_autocmd("BufEnter",
  { callback = function()
    opt.tabstop = 4
    opt.shiftwidth = 4
    opt.expandtab = false
    keymappings.testCallbackGo()
  end, pattern = "*.go", group = mainAutoGroup })

vim.api.nvim_create_autocmd("BufEnter",
  { callback = function()
    keymappings.testCallbackRust()
  end, pattern = "*.rs", group = mainAutoGroup })
vim.api.nvim_create_autocmd("BufEnter",
  { callback = function()
    opt.expandtab = true
    opt.tabstop = 4
    opt.shiftwidth = 4
  end, pattern = "*.lua", group = mainAutoGroup })

vim.api.nvim_create_autocmd("BufRead",
  { callback = function()
    opt.expandtab = true
    opt.tabstop = 2
    opt.shiftwidth = 2
    -- hack to get treesitter working in markdown again, idk why needed
    vim.cmd("TSBufToggle highlight")
  end, pattern = { "*.norg", "*.md" }, group = mainAutoGroup })

vim.api.nvim_create_autocmd("BufEnter",
  { callback = function()
    vim.bo.filetype = "lua"
  end, pattern = "*.nse", group = mainAutoGroup })
vim.api.nvim_create_autocmd({ "BufEnter", "BufRead" },
  { callback = function()
    vim.bo.filetype = "yaml"
  end, pattern = { "Gearsfile", "Bogiefile" }, group = mainAutoGroup })
vim.api.nvim_create_autocmd({ "BufEnter", "BufRead", "BufReadPre" },
  { callback = function()
    vim.bo.filetype = "sql"
  end, pattern = "*.cql", group = mainAutoGroup })
vim.api.nvim_create_autocmd("BufEnter",
  { callback = function()
    vim.bo.filetype = "json"
  end, pattern = "*.avsc", group = mainAutoGroup })
vim.api.nvim_create_autocmd("BufEnter",
  { callback = function()
    vim.bo.filetype = "scala"
  end, pattern = "*.sbt", group = mainAutoGroup })
-- use tabs for filetype=template
vim.api.nvim_create_autocmd("FileType",
  { callback = function()
    opt.tabstop = 4
    opt.shiftwidth = 4
    opt.expandtab = false
  end, pattern = "template", group = mainAutoGroup })
vim.api.nvim_create_autocmd("FileType",
  { callback = function()
    opt.tabstop = 4
    opt.shiftwidth = 4
    opt.expandtab = true
  end, pattern = { "css", "json" }, group = mainAutoGroup })
