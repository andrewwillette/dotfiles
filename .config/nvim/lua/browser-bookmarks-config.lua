local willette_scripts = require("willette-scripts")
local verify_nvim_plugin = willette_scripts.verify_nvim_plugin

local ok, bb = verify_nvim_plugin("browser_bookmarks")
if not ok or bb == nil then
  return
end

local user = vim.fn.expand("$USER")
local browser = "chrome"
if user == "andrewwillette" then
  browser = "brave"
end
bb.setup({
  -- override default configuration values
  selected_browser = browser,
})
