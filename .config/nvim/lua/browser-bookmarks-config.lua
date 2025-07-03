local willetteScripts = require("willette-scripts")
local verifyNvimPlugin = willetteScripts.verifynvimplugin

local ok, bb = verifyNvimPlugin("browser_bookmarks")
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
