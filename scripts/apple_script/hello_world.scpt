#!/usr/bin/osascript

tell application "Google Chrome"
    activate
end tell

repeat
    tell application "System Events"
        key code 8 using {command down} -- "c" and command
        key code 17 using {command down} -- "t" and command
        delay 1
        key code 9 using {command down} -- "v" and command
        key code 76 -- "enter key"
        key code 18 using {command down} -- "1" and command
        delay 1
        key code 125 -- "down arrow"
    end
end repeat
