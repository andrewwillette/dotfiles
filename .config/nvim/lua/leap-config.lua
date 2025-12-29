local ok, leap = require "willette-scripts".verify_nvim_plugin "leap"
if ok and leap then leap.add_default_mappings() end
