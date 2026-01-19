local M = {}

local verify_plugin = require("scripts").verify_nvim_plugin

---@param scheme string Lualine theme name
local function set_lualine(scheme)
  local ok, llc = verify_plugin("lualine-config")
  if not ok then return end
  llc.set_theme(scheme)
end

local gruvboxlight = function()
  vim.o.background = "light"
  require("gruvbox").setup({
    undercurl = false,
    underline = false,
    bold = false,
    italic = {
      strings = false,
      comments = false,
      operators = false,
      folds = false,
    },
    strikethrough = false,
    invert_selection = false,
    invert_signs = false,
    invert_tabline = false,
    invert_intend_guides = false,
    inverse = true,    -- invert background for search, diffs, statuslines and errors
    contrast = "hard", -- can be "hard", "soft" or empty string
    palette_overrides = {},
    overrides = {},
    dim_inactive = false,
    transparent_mode = false,
  })
  vim.cmd("colorscheme gruvbox")
  set_lualine("gruvbox_light")
end

local gruvboxdark = function()
  vim.opt.termguicolors = true
  vim.o.background = "dark"
  vim.g.gruvbox_italics = 0
  vim.g.gruvbox_bold = 0
  require("gruvbox").setup({
    undercurl = false,
    underline = false,
    bold = false,
    italic = {
      strings = false,
      comments = false,
      operators = false,
      folds = false,
    },
    strikethrough = false,
    invert_selection = false,
    invert_signs = false,
    invert_tabline = false,
    invert_intend_guides = false,
    inverse = true,    -- invert background for search, diffs, statuslines and errors
    contrast = "hard", -- can be "hard", "soft" or empty string
    palette_overrides = {},
    overrides = {},
    dim_inactive = false,
    transparent_mode = false,
  })
  vim.cmd("colorscheme gruvbox")
  set_lualine("gruvbox_dark")
end

local colorscheme_table = {
  ["gruvbox dark"] = gruvboxdark,
  ["gruvbox light"] = gruvboxlight,
}

local colorscheme_select = {}
for k, _ in pairs(colorscheme_table) do
  table.insert(colorscheme_select, k)
end

M.select_colorscheme = function()
  require 'fzf-lua'.fzf_exec(colorscheme_select, {
    actions = {
      ['default'] = function(selected)
        colorscheme_table[selected[1]]()
      end
    }
  })
end

gruvboxdark()
return M
