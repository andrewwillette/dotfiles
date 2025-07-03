local opt = vim.opt
vim.g.mapleader = ' '
vim.wo.relativenumber = true
vim.wo.number = true

if vim.version()["minor"] >= 9 then
  opt.splitkeep = "screen"
end
opt.grepprg = "rg --hidden --glob=!.git/\\* --vimgrep"
opt.list = true
opt.listchars:append({ tab = "» ", trail = "·", precedes = "<", })
opt.tabstop = 4
opt.expandtab = true
opt.shiftwidth = 4
opt.belloff = "all"
opt.mouse = "a"
opt.updatetime = 300
-- Time in milliseconds to wait for a mapped sequence to complete.
opt.timeoutlen = 500
-- opt.cmdheight = 2
opt.hidden = true
opt.ignorecase = true
opt.encoding = "UTF-8"
opt.wrap = false
vim.wo.cursorline = true
vim.wo.cursorcolumn = true
vim.g.foldmethod = "manual"
vim.wo.foldexpr = "nvim_treesitter#foldexpr()"
vim.wo.foldlevel = 99
opt.gdefault = true
vim.opt_global.shortmess:remove("F")

opt.splitbelow = true
opt.splitright = true
-- let $NVIM_TUI_ENABLE_CURSOR_SHAPE = 0
opt.guicursor = ""


-- lsp warnings don't cause shift in display
opt.signcolumn = "number"

-- global statusline
opt.laststatus = 3

vim.g.rustfmt_autosave = 1
-- local notify = vim.notify
-- vim.notify = function(msg, ...)
--   -- ccls setting encoding to utf-32, throwing warnings
--   if msg:match("warning: multiple different client offset_encodings") then
--     return
--   end

--   notify(msg, ...)
-- end

vim.diagnostic.config({
  virtual_text = true
})

require("lazy-config")
require("lualine-config")
require("treesitter-config")
require("treesitterContext-config")
require("nvim-tree-config")
require("git-config")
require("willette-scripts.colorschemes")
require("projectnvim-config")
require("mason-config")

require("lsp-config")

require("dap-debugger-config")
require("nvim-cmp-config")
require("luasnip-config")
require("gitsigns-config")
require("aucmds-config")
require("marks-nvim-config")
require("fzf-lua-config")
require("keymappings")
require("testing-config")
require("browser-bookmarks-config")
require("gp-config")
require("notes-config")
