local bootstrap_lazy = function()
  local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
  if not vim.loop.fs_stat(lazypath) then
    vim.fn.system({
      "git",
      "clone",
      "--filter=blob:none",
      "https://github.com/folke/lazy.nvim.git",
      "--branch=stable", -- latest stable release
      lazypath,
    })
  end
  vim.opt.rtp:prepend(lazypath)
end
bootstrap_lazy()

local plugins = {
  "andrewwillette/notes.nvim",
  -- { dir = "~/git/notes.nvim" },
  "andrewwillette/open.nvim",
  "andrewwillette/keyofday.nvim",
  "andrewwillette/projectnotes.nvim",
  "williamboman/mason.nvim",
  -- "neovim/nvim-lspconfig",
  "hrsh7th/cmp-nvim-lsp",
  -- colorschemes
  "ellisonleao/gruvbox.nvim",
  {
    "dhruvasagar/vim-open-url",
    lazy = false
  },
  "hrsh7th/nvim-cmp",
  "hrsh7th/cmp-nvim-lsp",
  "hrsh7th/cmp-buffer",
  "hrsh7th/cmp-path",
  "hrsh7th/cmp-nvim-lua",
  "saadparwaiz1/cmp_luasnip",
  "L3MON4D3/LuaSnip",
  {
    "kyazdani42/nvim-tree.lua",
    -- dir = "~/git/nvim-tree.lua",
  },
  "kyazdani42/nvim-web-devicons",
  -- { dir = "~/git/project.nvim" },
  "andrewwillette/project.nvim",
  "nvim-lua/plenary.nvim",
  "ibhagwan/fzf-lua",
  "andrewwillette/willette-scripts.nvim",
  -- { dir = "~/git/willette-scripts.nvim" },
  { "nvim-treesitter/nvim-treesitter", lazy = false },
  -- { dir = "~/git/willette-scripts.nvim" },
  { "nvim-treesitter/nvim-treesitter", lazy = false },
  "nvim-treesitter/nvim-treesitter-context",
  "nvim-treesitter/playground",
  "ryanoasis/vim-devicons",
  {
    "tpope/vim-commentary",
    lazy = false
  },
  "junegunn/fzf",
  {
    "tpope/vim-fugitive",
    lazy = false
  },
  {
    "NeogitOrg/neogit",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "sindrets/diffview.nvim",
      "ibhagwan/fzf-lua",
    },
    config = true
  },
  {
    "ruanyl/vim-gh-line",
    lazy = false
  },
  {
    "vim-test/vim-test",
    lazy = false
  },
  "sebdah/vim-delve",
  "mfussenegger/nvim-dap",
  "leoluz/nvim-dap-go",
  {
    "rcarriga/nvim-dap-ui",
    dependencies = { "mfussenegger/nvim-dap", "nvim-neotest/nvim-nio" }
  },
  {
    "nvim-neotest/neotest",
    lazy = false,
    dependencies = {
      "nvim-neotest/nvim-nio",
      "nvim-lua/plenary.nvim",
      "antoinemadec/FixCursorHold.nvim",
      "nvim-neotest/neotest-go",
      -- "andrewwillette/neotest-go",
      "rouge8/neotest-rust",
      "nvim-neotest/neotest-plenary"
    }
  },
  "theHamsta/nvim-dap-virtual-text",
  "nvim-lualine/lualine.nvim",
  "milisims/nvim-luaref",
  "jose-elias-alvarez/null-ls.nvim",
  "jose-elias-alvarez/nvim-lsp-ts-utils",
  "chentoast/marks.nvim",
  "hashivim/vim-terraform",
  "lewis6991/gitsigns.nvim",
  "rust-lang/rust.vim",
  {
    "zbirenbaum/copilot.lua",
    --     dir = "/Users/andrewwillette/git/copilot.lua",
  },
  {
    -- "zbirenbaum/copilot-cmp",
    -- because of unresolved deprecations, using fork
    "andrewwillette/copilot-cmp"
    -- dir = "/Users/andrewwillette/git/copilot-cmp",
  },
  'MeanderingProgrammer/render-markdown.nvim',
  "andrewwillette/health_check_nvim",
  {
    "kawre/leetcode.nvim",
    build = ":TSUpdate html",
    dependencies = {
      "nvim-telescope/telescope.nvim",
      "nvim-lua/plenary.nvim", -- required by telescope
      "MunifTanjim/nui.nvim",

      -- optional
      "nvim-treesitter/nvim-treesitter",
      "rcarriga/nvim-notify",
      "nvim-tree/nvim-web-devicons",
    },
    cmd = "Leet",
    opts = {
      lang = "golang",
      plugins = {
        non_standalone = true,
      },
      -- configuration goes here
    },
  },
  {
    -- "robitx/gp.nvim"
    dir = "~/git/gp.nvim"
  },
  {
    'dhruvmanila/browser-bookmarks.nvim',
    version = '*',
    dependencies = {
      -- Only if your selected browser is Firefox, Waterfox or buku
      'kkharji/sqlite.lua',
    }
  },
  {
    "andrewwillette/browsemarks.nvim",
    lazy = true,
    -- dir = "/Users/andrewwillette/git/browsemarks.nvim",
    -- name = "browsemarks.nvim",
    -- dev = { true },
  },
  -- { dir = "~/git/lsplogs.nvim" },
}

-- added to get nvim --headless 'PlenaryBusted' to have plugins on runtime path
vim.go.loadplugins = true
require("lazy").setup(plugins, {
  defaults = {
    lazy = true,
  }
})
local willettescripts = require("willette-scripts")
local verifynvimplugin = willettescripts.verifynvimplugin
local keymaps = require("keymappings")
local ok, lazy = verifynvimplugin("lazy")
if ok and lazy then
  if verifynvimplugin("lazy") then
    vim.keymap.set("n", keymaps.keymaps["lazy sync"], function()
        lazy.sync({})
      end,
      { noremap = true })
  end
end
