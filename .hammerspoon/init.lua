local grid = hs.grid
local hotkey = hs.hotkey
local window = hs.window
local application = hs.application

grid.setMargins({ x = 0, y = 0 })

-- reload config
hotkey.bind({ "cmd", "alt", "ctrl" }, "R", function() hs.reload() end)

local scriptsDir = "~/git/scripts"
local user = os.getenv("USER")
if (user == "andrewwillette") then
  hotkey.bind({ "cmd", "ctrl" }, "c", function() application.launchOrFocus("Brave Browser") end)
else
  hotkey.bind({ "cmd", "ctrl" }, "v", function() hs.execute(scriptsDir .. "/apps/openC1VPN") end)
  hotkey.bind({ "cmd", "ctrl" }, "c", function() application.launchOrFocus("Google Chrome") end)
end

hotkey.bind({ "cmd", "ctrl" }, "s", function() application.launchOrFocus("Slack") end)
hotkey.bind({ "cmd", "ctrl" }, "z", function() application.launchOrFocus("kitty") end)
hotkey.bind({ "cmd", "ctrl" }, "v", function() application.launchOrFocus("ChatGPT") end)
hotkey.bind({ "cmd", "ctrl" }, "k", function() application.launchOrFocus("Amazon Kindle") end)
hotkey.bind({ "cmd", "ctrl" }, "a", function() application.launchOrFocus("Ableton Live 12 Standard") end)
-- hotkey.bind({ "cmd", "ctrl" }, "a", function() hs.execute("~/git/dotfiles/scripts/browser/openCalendar.sh") end)
hotkey.bind({ "cmd", "ctrl" }, "m", function() hs.execute(scriptsDir .. "/browser/openEmail.sh") end)
hotkey.bind({ "cmd", "ctrl" }, "j", function() hs.execute(scriptsDir .. "/browser/openJira.sh") end)
hotkey.bind({ "cmd", "ctrl" }, "p", function() hs.execute(scriptsDir .. "/browser/openPortfolio.sh") end)
hotkey.bind({ "cmd", "ctrl" }, "g", function()
  hs.focus()
  local ok, result = hs.dialog.textPrompt("Search Google", "Google search string:")
  if (ok == "OK") then
    hs.execute("~/git/dotfiles/scripts/browser/googleSearch.sh " .. result)
  end
end)
hotkey.bind({ "cmd", "alt" }, "x", function() window.focusedWindow():moveOneScreenEast() end)
hotkey.bind({ "cmd", "alt" }, "z", function() window.focusedWindow():moveOneScreenWest() end)
hotkey.bind({ "cmd", "alt" }, "\\", function() grid.maximizeWindow(window.focusedWindow()) end)

-- Grid positioning (2x2 grid)
-- Docs: https://www.hammerspoon.org/docs/hs.grid.html
-- Source: Hammerspoon.app/Contents/Resources/extensions/grid/grid.lua
--
-- hs.grid.set(window, cell) where cell is {x, y, w, h}:
--   x = starting column (0-indexed from left)
--   y = starting row (0-indexed from top)
--   w = width in grid columns
--   h = height in grid rows
--
-- With a 2x2 grid, the screen is divided into 2 columns and 2 rows:
--   +-------+-------+
--   | (0,0) | (1,0) |
--   +-------+-------+
--   | (0,1) | (1,1) |
--   +-------+-------+
grid.setGrid("2x2")

-- Left half: start at col 0, row 0, span 1 col, span 2 rows
hotkey.bind({ "cmd", "alt" }, "h", function()
  hs.grid.set(hs.window.focusedWindow(), { 0, 0, 1, 2 })
end)
-- Right half: start at col 1, row 0, span 1 col, span 2 rows
hotkey.bind({ "cmd", "alt" }, "l", function()
  hs.grid.set(hs.window.focusedWindow(), { 1, 0, 1, 2 })
end)
-- Top half: start at col 0, row 0, span 2 cols, span 1 row
hotkey.bind({ "cmd", "alt" }, "k", function()
  hs.grid.set(hs.window.focusedWindow(), { 0, 0, 2, 1 })
end)
-- Bottom half: start at col 0, row 1, span 2 cols, span 1 row
hotkey.bind({ "cmd", "alt" }, "j", function()
  hs.grid.set(hs.window.focusedWindow(), { 0, 1, 2, 1 })
end)
-- Top-left quadrant: start at col 0, row 0, span 1 col, span 1 row
hotkey.bind({ "cmd", "alt" }, "u", function()
  hs.grid.set(hs.window.focusedWindow(), { 0, 0, 1, 1 })
end)
-- Top-right quadrant: start at col 1, row 0, span 1 col, span 1 row
hotkey.bind({ "cmd", "alt" }, "i", function()
  hs.grid.set(hs.window.focusedWindow(), { 1, 0, 1, 1 })
end)
-- Bottom-left quadrant: start at col 0, row 1, span 1 col, span 1 row
hotkey.bind({ "cmd", "alt" }, "n", function()
  hs.grid.set(hs.window.focusedWindow(), { 0, 1, 1, 1 })
end)
-- Bottom-right quadrant: start at col 1, row 1, span 1 col, span 1 row
hotkey.bind({ "cmd", "alt" }, "m", function()
  hs.grid.set(hs.window.focusedWindow(), { 1, 1, 1, 1 })
end)

local function openabletonexercise()
  local key_module = require("keyofday")
  if key_module ~= nil then
    local key = key_module.keyofday()
    local keyofdayableton = "/Users/andrewwillette/Documents/Production/fiddle_projects/daily_exercises_" ..
        key .. " Project/daily_exercises_" .. key .. ".als"
    hs.execute("open '" .. keyofdayableton .. "'")
    application.launchOrFocus("Ableton Live 12 Standard")
  end
end

hotkey.bind({ "cmd", "ctrl" }, "e", openabletonexercise)
hotkey.bind({ "cmd", "ctrl" }, "t", function()
  hs.execute("open 'x-apple.systempreferences:com.apple.Screen-Time-Settings.extension'")
end)

hs.alert.show("Hammerspoon Config Loaded")
