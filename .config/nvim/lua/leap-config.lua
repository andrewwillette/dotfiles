local ok, leap = require "scripts".verify_nvim_plugin "leap"
if ok and leap then leap.add_default_mappings() end
