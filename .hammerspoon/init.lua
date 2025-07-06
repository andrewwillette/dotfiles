local grid = hs.grid
local hotkey = hs.hotkey
local window = hs.window
local application = hs.application

grid.setMargins({ x = 0, y = 0 })

-- reload config
hotkey.bind({ "cmd", "alt", "ctrl" }, "R", function() hs.reload() end)

local user = os.getenv("USER")
if (user == "andrewwillette") then
  hotkey.bind({ "cmd", "ctrl" }, "c", function() application.launchOrFocus("Brave Browser") end)
else
  hotkey.bind({ "cmd", "ctrl" }, "v", function() hs.execute("~/git/willette_terminal/scripts/apps/openC1VPN") end)
  hotkey.bind({ "cmd", "ctrl" }, "c", function() application.launchOrFocus("Google Chrome") end)
end

hotkey.bind({ "cmd", "ctrl" }, "s", function() application.launchOrFocus("Slack") end)
hotkey.bind({ "cmd", "ctrl" }, "z", function() application.launchOrFocus("kitty") end)
hotkey.bind({ "cmd", "ctrl" }, "v", function() application.launchOrFocus("ChatGPT") end)
hotkey.bind({ "cmd", "ctrl" }, "k", function() application.launchOrFocus("Amazon Kindle") end)
hotkey.bind({ "cmd", "ctrl" }, "a", function() application.launchOrFocus("Ableton Live 12 Standard") end)
-- hotkey.bind({ "cmd", "ctrl" }, "a", function() hs.execute("~/git/willette_terminal/scripts/browser/openCalendar.sh") end)
hotkey.bind({ "cmd", "ctrl" }, "m", function() hs.execute("~/git/willette_terminal/scripts/browser/openEmail.sh") end)
hotkey.bind({ "cmd", "ctrl" }, "j", function() hs.execute("~/git/willette_terminal/scripts/browser/openJira.sh") end)
hotkey.bind({ "cmd", "ctrl" }, "p", function() hs.execute("~/git/willette_terminal/scripts/browser/openPortfolio.sh") end)
hotkey.bind({ "cmd", "ctrl" }, "g", function()
  hs.focus()
  local ok, result = hs.dialog.textPrompt("Search Google", "Google search string:")
  if (ok == "OK") then
    hs.execute("~/git/willette_terminal/scripts/browser/googleSearch.sh " .. result)
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
hs.alert.show("Swag")
