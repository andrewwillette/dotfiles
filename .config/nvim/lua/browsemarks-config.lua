local willettescripts = require("willette-scripts")
local verifyplugin = willettescripts.verifynvimplugin

local ok, browsemarks = verifyplugin("browsemarks")
if not ok or browsemarks == nil then
  print "browsemarks not found"
  return
end

-- browsemarks.setup()
-- browsemarks.print_existing_bookmarks()
