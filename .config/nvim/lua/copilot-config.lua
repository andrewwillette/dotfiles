require("copilot_cmp").setup({
  method = "getCompletionsCycling",
  formatters = {
    label = require("copilot_cmp.format").format_label_text,
    insert_text = require("copilot_cmp.format").format_insert_text,
    preview = require("copilot_cmp.format").deindent,
  },
})

require("copilot").setup {
  cmp = {
    enabled = true,
    method = "getCompletionsCycling",
  },
  panel = { -- no config options yet
    enabled = false,
  },
  advanced = {
    listCount = 5,          -- #completions for panel
    inlineSuggestCount = 3, -- #completions for getCompletions
  },
  suggestion = {
    enabled = false,
  },
  filetypes = {
    javascript = true, -- allow specific filetype
    typescript = true, -- allow specific filetype
    template = true,
    go = true,
    lua = true,
    markdown = true,
    -- ["*"] = false, -- disable for all other filetypes and ignore default `filetypes`
  },
  -- ft_disable = {},

  -- plugin_manager_path = vim.fn.stdpath "data" .. "/site/pack/packer",
  server_opts_overrides = {
    -- trace = "verbose",
    settings = {
      advanced = {
        listCount = 10,         -- #completions for panel
        inlineSuggestCount = 3, -- #completions for getCompletions
      },
    },
  },
}
