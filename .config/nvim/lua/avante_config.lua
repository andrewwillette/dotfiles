return {
  {
    "yetone/avante.nvim",
    build = vim.fn.has("win32") ~= 0
        and "powershell -ExecutionPolicy Bypass -File Build.ps1 -BuildFromSource false"
        or "make",
    event = "VeryLazy",
    version = false,
    -- Use a dedicated configuration table that will be passed to avante.setup via config()
    opts = {
      instructions_file = "avante.md",
      provider = "openai",
      openai = {
        endpoint = "https://api.openai.com/v1",
        model = "gpt-5-mini",
        timeout = 30000,
        context_window = 128000,
        use_response_api = true,
        support_previous_response_id = true,
        extra_request_body = {
          temperature = 0.75,
          max_completion_tokens = 16384,
          reasoning_effort = "medium",
        },
      },
    },
    dependencies = {
      "nvim-lua/plenary.nvim",
      "MunifTanjim/nui.nvim",
      "nvim-mini/mini.pick",
      "nvim-telescope/telescope.nvim",
      "hrsh7th/nvim-cmp",
      "ibhagwan/fzf-lua",
      "stevearc/dressing.nvim",
      "folke/snacks.nvim",
      "nvim-tree/nvim-web-devicons",
      "zbirenbaum/copilot.lua",
      {
        "HakonHarnes/img-clip.nvim",
        event = "VeryLazy",
        opts = {
          default = {
            embed_image_as_base64 = false,
            prompt_for_file_name = false,
            drag_and_drop = { insert_mode = true },
            use_absolute_path = true,
          },
        },
      },
      {
        "MeanderingProgrammer/render-markdown.nvim",
        opts = {
          file_types = { "markdown", "Avante" },
        },
        ft = { "markdown", "Avante" },
      },
    },
    config = function(_, opts)
      local ok, avante = pcall(require, "avante")
      if ok and avante and type(avante.setup) == "function" then
        avante.setup(opts)
      end
    end,
  }
}

