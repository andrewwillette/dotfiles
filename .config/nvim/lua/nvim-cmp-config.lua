-- Setup nvim-cmp.
local cmp = require("cmp")
local ls = require("luasnip")
local compare = require("cmp.config.compare")

---@diagnostic disable-next-line: unused-function, unused-local
-- local function border(hl_name)
--   return {
--     { "╭", hl_name },
--     { "─", hl_name },
--     { "╮", hl_name },
--     { "│", hl_name },
--     { "╯", hl_name },
--     { "─", hl_name },
--     { "╰", hl_name },
--     { "│", hl_name },
--   }
-- end

vim.api.nvim_set_hl(0, "CmpItemKindCopilot", { fg = "#6CC644" })

cmp.setup({
  window = {
    completion = cmp.config.window.bordered(),
    documentation = cmp.config.window.bordered(),
  },
  completion = {
    autocomplete = {
      cmp.TriggerEvent.TextChanged,
      cmp.TriggerEvent.InsertEnter,
      -- on ctrl-n
    },
    keyword_length = 0,
    keyword_pattern = "",
  },
  snippet = {
    expand = function(args)
      -- if not ls then return end
      ls.lsp_expand(args.body)
    end
  },
  mapping = {
    ['<C-b>'] = cmp.mapping(cmp.mapping.scroll_docs(-4), { 'i', 'c' }),
    ['<C-f>'] = cmp.mapping(cmp.mapping.scroll_docs(4), { 'i', 'c' }),
    ['<C-Space>'] = cmp.mapping(cmp.mapping.complete(), { 'i', 'c' }),
    ['<C-k>'] = cmp.mapping.close(),
    -- ['<C-y>'] = cmp.config.disable, -- Specify `cmp.config.disable` if you want to remove the default `<C-y>` mapping.
    ['<C-e>'] = cmp.mapping({ i = cmp.mapping.abort(), c = cmp.mapping.close() }),
    -- ['<C-n>'] = cmp.mapping.select_next_item(),
    ['<C-n>'] = cmp.mapping({
      i = function(fallback)
        if cmp.visible() then
          cmp.select_next_item()
        else
          cmp.complete()
        end
      end,
    }),
    ['<C-p>'] = cmp.mapping.select_prev_item(),
    ['<CR>'] = cmp.mapping.confirm({ select = true }),
  },
  sources = {
    {
      name = 'nvim_lsp',
      group_index = 2,
      priority = 2,
      max_item_count = 3,
    },
    {
      name = 'luasnip',
      group_index = 2,
      priority = 3,
    },
    {
      name = 'buffer',
      group_index = 2,
      priority = 1,
      max_item_count = 3,
    },
    {
      name = "copilot",
      group_index = 2,
      priority = 1,
      max_item_count = 3,
    },
  },
  confirm_opts = {
    behavior = cmp.ConfirmBehavior.Replace,
    select = false,
  },
  sorting = {
    priority_weight = 1,
    comparators = {
      -- compare.offset,
      -- compare.exact,
      compare.score,
      -- compare.recently_used,
      -- compare.locality,
      -- compare.sort_text,
      -- compare.length,
      -- compare.order,

      -- require("copilot_cmp.comparators").prioritize,
      -- require("copilot_cmp.comparators").score,
      -- compare.scopes,
      -- compare.kind,
      -- require("copilot_cmp.comparators").prioritize,
      -- require("copilot_cmp.comparators").score,
    },
  },
  formatting = {
    expandable_indicator = true,
    fields = { "kind", "abbr", "menu" },
    format = function(entry, vim_item)
      -- if entry.source.name == "copilot" then
      --   vim_item.kind_hl_group = "CmpItemKindCopilot"
      -- end
      -- -- NOTE: order matters
      vim_item.menu = ({
        copilot = "",
        nvim_lsp = "",
        nvim_lua = "",
        luasnip = "",
        buffer = "",
        path = "",
        emoji = "",
      })[entry.source.name]
      return vim_item
    end,
  },
})
