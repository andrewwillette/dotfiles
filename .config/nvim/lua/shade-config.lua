local ok, shade = require "willette-scripts".verify_nvim_plugin "shade"
if not ok or shade == nil then
  return
end

shade.setup({
  overlay_opacity = 90,
  opacity_step = 1,
})
