local km = require("keymappings")
local willettescripts = require("willette-scripts")
local verify_nvim_plugin = willettescripts.verify_nvim_plugin
local ok, notes = verify_nvim_plugin("notes")
local home = os.getenv("HOME")

if ok and notes then
  vim.keymap.set("n", km.keymaps["daily personal note"], function()
      notes.opendailynote({
        directory = home .. "/git/manual/general_notes/daily",
        filetype = ".md",
        templatefile = home .. "/git/manual/general_notes/daily/dailyPersonalNotesTemplate.md",
      })
    end,
    { noremap = true })
  vim.keymap.set("n", km.keymaps["daily kunai note"], function()
      notes.opendailynote({
        directory = home .. "/git/manual/employment/kunai/mexico/dailynotesmexico/",
        filetype = ".md",
        templatefile = home .. "/git/manual/employment/kunai/templates/dailyCapitalOneNotesTemplate.md",
      })
    end,
    { noremap = true })

  vim.keymap.set("n", km.keymaps["weekly kunai note"], function()
      notes.openweeklynote {
        meetingname = "kunai_delivery",
        directory = home .. "/git/manual/employment/kunai/tasks_todo",
        template = home .. "/git/manual/employment/kunai/templates/kunai_delivery_meeting.md",
        dayofweek = "Thursday",
        filetype = ".md"
      }
    end,
    { noremap = true })
end

-- notes shortcuts
vim.keymap.set("n", km.keymaps["open notes on current kunai contract"], function()
    local orionnotes = home .. "/git/manual/employment/kunai/discovery_decisioning/discovery_decisioning.md"
    vim.cmd("e " .. orionnotes)
  end,
  { noremap = true })

vim.keymap.set("n", km.keymaps["open diary entry"], function()
    local diary = require("willette-scripts.diary")
    diary.diary_entry()
  end,
  { noremap = true })
