-- Notes configuration
-- Work-specific notes (kunai, etc.) are in dotfiles_private
local km = require("keymappings")
local scripts = require("scripts")
local verify_nvim_plugin = scripts.verify_nvim_plugin
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
end

vim.keymap.set("n", km.keymaps["open diary entry"], function()
    local diary = require("scripts.diary")
    diary.diary_entry()
  end,
  { noremap = true })
