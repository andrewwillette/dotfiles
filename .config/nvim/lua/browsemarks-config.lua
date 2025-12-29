local scripts = require("scripts")
local verifyplugin = scripts.verify_nvim_plugin

local ok, browsemarks = verifyplugin("browsemarks")
if not ok or browsemarks == nil then
  print "browsemarks not found"
  return
end
