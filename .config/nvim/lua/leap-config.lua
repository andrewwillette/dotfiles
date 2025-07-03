local ok, leap = require "willette-scripts".verifynvimplugin "leap"
if ok and leap then leap.add_default_mappings() end
