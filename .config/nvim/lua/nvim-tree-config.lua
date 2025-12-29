local ok, nvim_tree = require("willette-scripts").verify_nvim_plugin("nvim-tree")
if not ok or nvim_tree == nil then return end
nvim_tree.setup {
  sync_root_with_cwd  = true,
  respect_buf_cwd     = true,
  update_focused_file = {
    enable = true,
    update_root = true,
    update_cwd = true
  },
  disable_netrw       = true,
  hijack_netrw        = true,
  open_on_tab         = false,
  hijack_cursor       = false,
  update_cwd          = true,
  diagnostics         = {
    enable = false,
    icons = {
      hint = "",
      info = "",
      warning = "",
      error = "",
    }
  },
  system_open         = {
    cmd  = nil,
    args = {}
  },
  filters             = {
    dotfiles = false,
    custom = {}
  },
  view                = {
    width = 50,
    side = 'left',
    preserve_window_proportions = false,
    -- mappings = {
    --   custom_only = false,
    --   list = {}
    -- }
  },
  git                 = {
    enable = true,
    ignore = false,
    timeout = 500,
  },
  actions             = {
    change_dir = {
      enable = false
    },
    open_file = {
      quit_on_open = false,
      resize_window = false,
    },
    use_system_clipboard = true,
  },
  renderer            = {
    indent_markers = {
      enable = false,
      icons = {
        corner = "└ ",
        edge = "│ ",
        none = "  ",
      },
    },
    icons = {
      webdev_colors = true,
    },
  },
  hijack_directories  = {
    enable = true,
    auto_open = true,
  },
}

local km = require("keymappings")
local nvim_tree_api = require("nvim-tree.api")

vim.keymap.set(
  "n",
  km.keymaps["open file tree"],
  function()
    nvim_tree_api.tree.toggle({ path = vim.fn.getcwd() })
  end,
  {})

vim.keymap.set(
  "n",
  km.keymaps["open file tree on current buffer"],
  function()
    nvim_tree_api.tree.find_file({ open = true, focus = true })
  end,
  {})
