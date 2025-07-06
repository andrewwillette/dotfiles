local ok, ls = require "willette-scripts".verifynvimplugin "luasnip"
if not ok or ls == nil then return end

vim.api.nvim_command("hi LuasnipChoiceNodePassive cterm=italic")
ls.config.set_config {
  history = true,
  updateevents = "TextChanged,TextChangedI",
  enable_autosnippets = true
}

-- https://github.com/L3MON4D3/LuaSnip/blob/master/DOC.md#loaders
-- require("luasnip/loaders/from_vscode").lazy_load()
-- local s = ls.snippet
-- local t = ls.text_node
-- local i = ls.insert_node
-- local sn = ls.snippet_node
-- local isn = ls.indent_snippet_node
-- local f = ls.function_node
-- local c = ls.choice_node
-- local d = ls.dynamic_node
-- local r = ls.restore_node
-- local events = require("luasnip.util.events")
-- local ai = require("luasnip.nodes.absolute_indexer")
-- local fmt = require("luasnip.extras.fmt").fmt
-- local m = require("luasnip.extras").m
-- local lambda = require("luasnip.extras").l
-- local postfix = require("luasnip.extras.postfix").postfix
-- local parse = require("luasnip.util.parser").parse_snippet
