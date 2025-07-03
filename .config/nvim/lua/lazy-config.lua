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
    "yetone/avante.nvim",
    build = vim.fn.has("win32") ~= 0
        and "powershell -ExecutionPolicy Bypass -File Build.ps1 -BuildFromSource false"
        or "make",
    event = "VeryLazy",
    version = false, -- Never set this value to "*"! Never!
    ---@module 'avante'
    ---@type avante.Config
    opts = {
      instructions_file = "avante.md",
      provider = "openai",
      providers = {
        openai = {
          endpoint = "https://api.openai.com/v1",
          model = "gpt-5-nano",
          timeout = 30000,                             -- Timeout in milliseconds, increase this for reasoning models
          context_window = 128000,                     -- Number of tokens to send to the model for context
          use_response_api = copilot_use_response_api, -- Automatically switch to Response API for GPT-5 Codex models
          support_previous_response_id = true,         -- OpenAI Response API supports previous_response_id for stateful conversations
          -- NOTE: Response API automatically manages conversation state using previous_response_id for tool calling
          extra_request_body = {
            temperature = 0.75,
            max_completion_tokens = 16384, -- Increase this to include reasoning tokens (for reasoning models). For Response API, will be converted to max_output_tokens
            reasoning_effort = "medium",   -- low|medium|high, only used for reasoning models. For Response API, this will be converted to reasoning.effort
            -- background = false, -- Response API only: set to true to start a background task
            -- NOTE: previous_response_id is automatically managed by the provider for tool calling - don't set manually
          },
        },
      },
      rag_service = {                             -- RAG Service configuration
        enabled = false,                          -- Enables the RAG service
        host_mount = os.getenv("HOME"),           -- Host mount path for the rag service (Docker will mount this path)
        runner = "docker",                        -- Runner for the RAG service (can use docker or nix)
        llm = {                                   -- Language Model (LLM) configuration for RAG service
          provider = "openai",                    -- LLM provider
          endpoint = "https://api.openai.com/v1", -- LLM API endpoint
          api_key = "OPENAI_API_KEY",             -- Environment variable name for the LLM API key
          model = "gpt-4o-mini",                  -- LLM model name
          extra = nil,                            -- Additional configuration options for LLM
        },
        embed = {                                 -- Embedding model configuration for RAG service
          provider = "openai",                    -- Embedding provider
          endpoint = "https://api.openai.com/v1", -- Embedding API endpoint
          api_key = "OPENAI_API_KEY",             -- Environment variable name for the embedding API key
          model = "text-embedding-3-large",       -- Embedding model name
          extra = nil,                            -- Additional configuration options for the embedding model
        },
        docker_extra_args = "",                   -- Extra arguments to pass to the docker command
      },
    },
    dependencies = {
      "nvim-lua/plenary.nvim",
      "MunifTanjim/nui.nvim",
      --- The below dependencies are optional,
      "nvim-mini/mini.pick",           -- for file_selector provider mini.pick
      "nvim-telescope/telescope.nvim", -- for file_selector provider telescope
      "hrsh7th/nvim-cmp",              -- autocompletion for avante commands and mentions
      "ibhagwan/fzf-lua",              -- for file_selector provider fzf
      "stevearc/dressing.nvim",        -- for input provider dressing
      "folke/snacks.nvim",             -- for input provider snacks
      "nvim-tree/nvim-web-devicons",   -- or echasnovski/mini.icons
      "zbirenbaum/copilot.lua",        -- for providers='copilot'
      {
        -- support for image pasting
        "HakonHarnes/img-clip.nvim",
        event = "VeryLazy",
        opts = {
          -- recommended settings
          default = {
            embed_image_as_base64 = false,
            prompt_for_file_name = false,
            drag_and_drop = {
              insert_mode = true,
            },
            -- required for Windows users
            use_absolute_path = true,
          },
        },
      },
      {
        -- Make sure to set this up properly if you have lazy=true
        'MeanderingProgrammer/render-markdown.nvim',
        opts = {
          file_types = { "markdown", "Avante" },
        },
        ft = { "markdown", "Avante" },
      },
    },
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
