-- Notes configuration
-- Work-specific notes (kunai, etc.) are in dotfiles_private
local km = require("keymappings")
local scripts = require("scripts")
local verify_nvim_plugin = scripts.verify_nvim_plugin
local ok, notes = verify_nvim_plugin("notes")
local home = os.getenv("HOME")

if ok and notes then
  vim.keymap.set("n", km.keymaps["daily personal note"], function()
      local daily_notes_dir = os.getenv("DAILY_PERSONAL_NOTES_DIR") or (home .. "/git/manual/general_notes/daily")
      notes.opendailynote({
        directory = daily_notes_dir,
        filetype = ".md",
        templatefile = daily_notes_dir .. "/dailyPersonalNotesTemplate.md",
      })
    end,
    { noremap = true })
end

vim.keymap.set("n", km.keymaps["open diary entry"], function()
    local diary = require("scripts.diary")
    diary.diary_entry()
  end,
  { noremap = true })
