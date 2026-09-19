-- Make homebrew luarocks available (Hammerspoon doesn't inherit shell LUA_PATH)
package.path = package.path .. ";/opt/homebrew/share/lua/5.5/?.lua;/opt/homebrew/share/lua/5.5/?/init.lua"
package.cpath = package.cpath .. ";/opt/homebrew/lib/lua/5.5/?.so"

local grid = hs.grid
local hotkey = hs.hotkey
local window = hs.window
local application = hs.application

grid.setMargins({ x = 0, y = 0 })

-- reload config
hotkey.bind({ "cmd", "alt", "ctrl" }, "R", function() hs.reload() end)

local scriptsDir = "~/git/scripts"
local user = os.getenv("USER")
local home = os.getenv("home")
if (user == "andrewwillette") then
  hotkey.bind({ "cmd", "ctrl" }, "c", function() application.launchOrFocus("Brave Browser") end)
  hotkey.bind({ "cmd", "ctrl" }, "v", function() application.launchOrFocus("Claude") end)
else
  hotkey.bind({ "cmd", "ctrl" }, "c", function() application.launchOrFocus("Google Chrome") end)
end
-- use launchctl to set this var
-- eg:
-- launchctl setenv HAMMERSPOON_TERMINAL terminal
local terminalApp = os.getenv("HAMMERSPOON_TERMINAL") or "kitty"
hotkey.bind({ "cmd", "ctrl" }, "z", function() application.launchOrFocus(terminalApp) end)

-- Runs open_ableton_fiddle_project.sh, preferring (in order):
--   1. An already-running nvim (normally running inside kitty) -- reuse its
--      "<leader>ab" keymap so the script opens in a terminal split there.
--   2. An already-running kitty instance (see listen_on/allow_remote_control
--      in kitty.conf) -- add a new tab there via kitty's remote control
--      socket instead of spawning a whole new kitty process.
--   3. Otherwise, spawn a new kitty instance via `open`.
-- Cases 1 and 2 reuse an existing, possibly unfocused window, so we need to
-- explicitly focus kitty afterward. Case 3 is skipped because `open` already
-- focuses the new window itself -- calling launchOrFocus there would race
-- with the new window's creation and could steal focus back to a different,
-- pre-existing kitty window instead.
-- The script is run through `zsh -l` (not directly) so it sources
-- ~/.zprofile and picks up the homebrew PATH -- apps launched via `open` or
-- kitty's remote control inherit launchd's bare PATH, which doesn't include
-- /opt/homebrew/bin, so fzf would be missing and the script/window would
-- close immediately.
local function runAbletonFiddleProject()
  local abletonScript = os.getenv("HOME") .. "/git/scripts/ableton/open_ableton_fiddle_project.sh"
  local tmpdir = (os.getenv("TMPDIR") or "/tmp"):gsub("/*$", "")
  local nvimSockGlob = tmpdir .. "/nvim." .. user .. "/*/nvim.*.0"
  local kittySockGlob = tmpdir .. "/kitty-*"
  local shellCmd = [[
    mode=new
    for sock in $(ls -t ]] .. nvimSockGlob .. [[ 2>/dev/null); do
      if /opt/homebrew/bin/nvim --headless --server "$sock" --remote-send '<C-\><C-n> ab' 2>/dev/null; then
        mode=reuse
        break
      fi
    done
    if [ "$mode" = "new" ]; then
      for sock in $(ls -t ]] .. kittySockGlob .. [[ 2>/dev/null); do
        if /Applications/kitty.app/Contents/MacOS/kitty @ --to "unix:$sock" launch --type=tab --cwd=current /bin/zsh -l -c "]] .. abletonScript .. [[" 2>/dev/null; then
          mode=reuse
          break
        fi
      done
    fi
    if [ "$mode" = "new" ]; then
      open -na kitty --args -e /bin/zsh -l -c "]] .. abletonScript .. [["
    fi
    echo "$mode"
  ]]
  local mode = hs.execute(shellCmd)
  if (mode or ""):match("^reuse") then
    application.launchOrFocus(terminalApp)
  end
end

hotkey.bind({ "cmd", "ctrl" }, "s", runAbletonFiddleProject)

hotkey.bind({ "cmd", "ctrl" }, "k", function() application.launchOrFocus("Amazon Kindle") end)
hotkey.bind({ "cmd", "ctrl" }, "a", function() application.launchOrFocus("Ableton Live 12 Standard") end)
-- hotkey.bind({ "cmd", "ctrl" }, "a", function() hs.execute("~/git/dotfiles/scripts/browser/openCalendar.sh") end)
hotkey.bind({ "cmd", "ctrl" }, "m", function() hs.execute(scriptsDir .. "/browser/openEmail.sh") end)
hotkey.bind({ "cmd", "ctrl" }, "j", function() hs.execute(scriptsDir .. "/browser/openJira.sh") end)
-- hotkey.bind({ "cmd", "ctrl" }, "p", function() hs.execute(home .. "/gocode/bin/webwalker --flow fidelity", true) end)
hotkey.bind({ "cmd", "ctrl" }, "p", function() hs.execute(scriptsDir .. "/browser/openPortfolio.sh", true) end)
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
  hs.grid.set(window.focusedWindow(), { 0, 0, 1, 2 })
end)
-- Right half: start at col 1, row 0, span 1 col, span 2 rows
hotkey.bind({ "cmd", "alt" }, "l", function()
  hs.grid.set(window.focusedWindow(), { 1, 0, 1, 2 })
end)
-- Top half: start at col 0, row 0, span 2 cols, span 1 row
hotkey.bind({ "cmd", "alt" }, "k", function()
  hs.grid.set(window.focusedWindow(), { 0, 0, 2, 1 })
end)
-- Bottom half: start at col 0, row 1, span 2 cols, span 1 row
hotkey.bind({ "cmd", "alt" }, "j", function()
  hs.grid.set(window.focusedWindow(), { 0, 1, 2, 1 })
end)
-- Top-left quadrant: start at col 0, row 0, span 1 col, span 1 row
hotkey.bind({ "cmd", "alt" }, "u", function()
  hs.grid.set(window.focusedWindow(), { 0, 0, 1, 1 })
end)
-- Top-right quadrant: start at col 1, row 0, span 1 col, span 1 row
hotkey.bind({ "cmd", "alt" }, "i", function()
  hs.grid.set(window.focusedWindow(), { 1, 0, 1, 1 })
end)
-- Bottom-left quadrant: start at col 0, row 1, span 1 col, span 1 row
hotkey.bind({ "cmd", "alt" }, "n", function()
  hs.grid.set(window.focusedWindow(), { 0, 1, 1, 1 })
end)
-- Bottom-right quadrant: start at col 1, row 1, span 1 col, span 1 row
hotkey.bind({ "cmd", "alt" }, "m", function()
  hs.grid.set(window.focusedWindow(), { 1, 1, 1, 1 })
end)

-- add a comment explaining how this module is pulled in
local function openabletonexercise()
  local ok, key_module = pcall(require, "keyofday")
  if not ok then
    hs.alert.show("require keyofday failed: " .. tostring(key_module))
    return
  end
  local key = key_module.keyofday()
  local keyofdayableton = "/Users/andrewwillette/Documents/Production/fiddle_projects/daily_exercises_" ..
      key .. " Project/daily_exercises_" .. key .. ".als"
  local openCommand = "open '" .. keyofdayableton .. "'"
  hs.execute(openCommand)
  application.launchOrFocus("Ableton Live 12 Standard")
end

hotkey.bind({ "cmd", "ctrl" }, "e", openabletonexercise)

hotkey.bind({ "cmd", "ctrl" }, "r", function()
  local output, status, typ, rc = hs.execute("/Users/andrewwillette/gocode/bin/musicstudio --random-song 2>&1")
  hs.alert.show(output ~= "" and output or ("exit " .. tostring(rc)), 6)
end)

hs.alert.show("Hammerspoon Config Loaded")
