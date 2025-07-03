local km = require("keymappings")
local willettescripts = require("willette-scripts")
local oneoffterminal = willettescripts.oneoffterminal
vim.keymap.set("n", km.keymaps["toggle git blame"], function()
    vim.cmd("G blame")
  end,
  { noremap = true })

vim.keymap.set("n", km.keymaps["git diff view"],
  function()
    oneoffterminal("gitdh.sh")
  end,
  { noremap = true, silent = true })

vim.keymap.set("n", km.keymaps["git diff current buffer"],
  function()
    local currentFile = vim.fn.expand('%')
    print(currentFile)
    oneoffterminal("gitdh.sh " .. currentFile)
  end,
  { noremap = true, silent = true })

-- fugitive keymaps
-- "]c" and "[c" and next and previous diff respectively
vim.keymap.set("n", km.keymaps["fugitive use left diff"], ":diffget //2<cr>",
  { noremap = true })
vim.keymap.set("n", km.keymaps["fugitive use right diff"], ":diffget //3<cr>",
  { noremap = true })

vim.keymap.set("n", km.keymaps["git log"],
  function()
    willettescripts.initsplitterm("gitl.sh")
  end,
  { noremap = true, silent = true })

vim.keymap.set("n", km.keymaps["git diff fugitive view"], ":Gvdiffsplit!<cr>",
  { noremap = true, silent = true })

vim.keymap.set("n", km.keymaps["git status"],
  function()
    -- vim.cmd "G status"
    willettescripts.initsplitterm("gits.sh")
  end,
  { noremap = true, silent = true })

vim.keymap.set("n", km.keymaps["git pull"],
  function()
    vim.cmd "G pull"
  end,
  { noremap = true, silent = true })

vim.keymap.set("n", km.keymaps["delete git branch picker"], function()
    oneoffterminal("gitbd.sh")
  end,
  { noremap = true })

-- git commit all
vim.keymap.set("n", km.keymaps["git commit"], function()
  vim.ui.input({ prompt = "Commit Messsage: " }, function(input)
    vim.cmd("!git add --all")
    vim.cmd("!git commit -m \"" .. input .. "\"")
    vim.cmd("!git push -u origin HEAD")
  end)
end, { noremap = true })

-- git checkout new
vim.keymap.set("n", km.keymaps["git checkout new branch"], function()
  vim.ui.input({ prompt = "Checkout new branch with name:" }, function(input)
    vim.cmd("!git checkout -B " .. input)
  end)
end, { noremap = true })
