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
hotkey.bind({ "cmd", "alt" }, "]", function()
  grid.setGrid("2x2")
  grid.show()
end)
hotkey.bind({ "cmd", "alt" }, "[", function()
  grid.setGrid("3x3")
  grid.show()
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

hotkey.bind({ "cmd", "alt" }, "e", openabletonexercise)

hs.alert.show("Hammerspoon Config Loaded")
