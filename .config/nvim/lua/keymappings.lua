local M = {}

-- replace term codes
---@diagnostic disable-next-line: unused-function, unused-local
local function t(str)
  return vim.api.nvim_replace_termcodes(str, true, true, true)
end

local willettescripts = require("willette-scripts")
local verifynvimplugin = willettescripts.verifynvimplugin
local oneoffterminal = willettescripts.oneoffterminal
local oneoffterminaltab = willettescripts.oneoffterminaltab
local home = os.getenv("HOME")

vim.keymap.set("n", "<Leader>jc", function()
  oneoffterminal("jiraclient")
end, { noremap = true, silent = true })

vim.keymap.set("n", "<Leader>/", function()
  vim.cmd("nohlsearch")
end, { noremap = true, silent = true })
vim.keymap.set("n", "<leader>cb", function()
  vim.cmd("echo expand('%:p')")
end, { noremap = true, silent = true })

vim.keymap.set(
  "n", "<Leader>km",
  function()
    vim.cmd("e ~/git/dotfiles/.config/nvim/lua/keymappings.lua")
  end,
  { noremap = true, silent = true })

-- to avoid error message for empty leader
vim.keymap.set("n", "<leader>",
  function()
  end)

if verifynvimplugin("nvim-tree") then
  local nvimtreeApi = require("nvim-tree.api")
  -- nvim tree keybinds
  vim.keymap.set(
    "n",
    "<Leader>1",
    function()
      nvimtreeApi.tree.toggle({ path = vim.fn.getcwd() })
    end,
    {})
  vim.keymap.set(
    "n",
    "<Leader>2",
    function()
      nvimtreeApi.tree.find_file({ open = true, focus = true })
    end,
    {})
end

vim.keymap.set("n", "<Leader>w", function()
    local isWrap = vim.cmd('se wrap?')
    if (isWrap == 'wrap') then
      vim.cmd('set wrap')
    else
      vim.cmd('set wrap!')
    end
  end,
  { noremap = true })

vim.keymap.set("n", "<Leader>ws", function()
    vim.cmd('split')
  end,
  { noremap = true })
vim.keymap.set("n", "<Leader>wv", function()
    vim.cmd('vsplit')
  end,
  { noremap = true })
vim.keymap.set("n", "<Leader>wo", function()
    vim.cmd('only')
  end,
  { noremap = true })
vim.keymap.set("n", "<Leader>wc", function()
    vim.cmd('close')
  end,
  { noremap = true })
vim.api.nvim_set_keymap("n", "<leader>wt", "<C-w>T",
  { noremap = true })
vim.keymap.set("n", "<leader>s", function()
    vim.cmd('silent! write')
    local filetype = vim.api.nvim_get_option_value('ft', {})
    local wd = vim.fn.getcwd()
    -- neovim repo has lua files I don't want to source
    if filetype == 'lua' and not string.find(wd, "neovim") then
      vim.cmd('luafile %')
    end
  end,
  { noremap = true })

local neotest = require("neotest")

M.testCallbackRust = function()
  vim.keymap.set("n", "<leader>tn", function()
      -- vim.cmd("TestNearest -- --nocapture")
      neotest.run.run({ args = "-- --nocapture" })
      neotest.output_panel.open()
    end,
    { noremap = true, silent = false })
  vim.keymap.set("n", "<leader>tf", function()
      vim.cmd("TestFile -- --nocapture")
    end,
    { noremap = true, silent = false })
end

M.testCallbackGo = function()
  vim.keymap.set("n", "<leader>tn", function()
      neotest.run.run()
      neotest.output_panel.open()
    end,
    { noremap = true, silent = false })

  vim.keymap.set("n", "<leader>tnc", function()
      vim.cmd("TestNearest -v -count=1")
    end,
    { noremap = true, silent = false })
  vim.keymap.set("n", "<leader>tf", function()
      neotest.run.run(vim.fn.expand("%"))
      neotest.output_panel.open()
    end,
    { noremap = true, silent = false })

  vim.keymap.set("n", "<leader>tl", function()
      neotest.run.run_last()
      neotest.output_panel.open()
    end,
    { noremap = true, silent = false })
end
vim.keymap.set(
  "n", "<Leader>to",
  function()
    neotest.output_panel.toggle()
  end,
  { noremap = true, silent = true })


vim.keymap.set("n", "<leader>tn", function()
    neotest.run.run()
    neotest.output_panel.open()
  end,
  { noremap = true, silent = false })
vim.keymap.set("n", "<leader>tf", function()
    neotest.run.run(vim.fn.expand("%"))
    neotest.output_panel.open()
  end,
  { noremap = true, silent = false })

vim.keymap.set("n", "<leader>tl", function()
    neotest.run.run_last()
    neotest.output_panel.open()
  end,
  { noremap = true, silent = false })


if verifynvimplugin("plenary") then
  vim.api.nvim_set_keymap("n", "<leader>pt", "<Plug>PlenaryTestFile", { noremap = false, silent = false })
end

vim.keymap.set("n", "<leader><leader>t", function()
    vim.cmd("tabnew")
  end,
  { noremap = true })

-- notes shortcuts
vim.keymap.set("n", "<leader>or", function()
    local orionnotes = home .. "/git/manual/employment/kunai/mexico/orion_notes.md"
    vim.cmd("e " .. orionnotes)
  end,
  { noremap = true })
vim.keymap.set("n", "<leader>di", function()
    local diary = require("willette-scripts.diary")
    diary.diaryentry()
  end,
  { noremap = true })

vim.keymap.set("n", "<c-t>", function()
    vim.cmd("terminal")
    vim.cmd("startinsert")
  end,
  { noremap = true })

-- open terminal history with one keymap
-- hacky, uses magic number for timeToInitMs
vim.keymap.set("n", "<c-SPACE>", function()
    willettescripts.initsplitterm("exec zsh")
    local history = t("<C-r>")
    local expectedTimeToInitMs = 2500
    vim.defer_fn(
      function()
        vim.api.nvim_feedkeys(history, "n", false)
      end
      , expectedTimeToInitMs)
  end,
  { noremap = true })

vim.api.nvim_set_keymap("n", "<leader>yt", ":YAMLTelescope<cr>", { noremap = false, silent = false })

local ok, notes = verifynvimplugin("notes")
if ok and notes then
  vim.keymap.set("n", "<leader>dp", function()
      notes.opendailynote({
        directory = home .. "/git/manual/general_notes/daily",
        filetype = ".md",
        templatefile = home .. "/git/manual/general_notes/daily/dailyPersonalNotesTemplate.md",
      })
    end,
    { noremap = true })
  vim.keymap.set("n", "<leader>dk", function()
      notes.opendailynote({
        directory = home .. "/git/manual/employment/kunai/mexico/dailynotesmexico/",
        filetype = ".md",
        templatefile = home .. "/git/manual/employment/kunai/templates/dailyCapitalOneNotesTemplate.md",
      })
    end,
    { noremap = true })

  vim.keymap.set("n", "<leader>wk", function()
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

-- adjust pane sizes, ordered x,y
vim.api.nvim_set_keymap("n", "<A-1>", "<C-w>3<",
  { noremap = true })
vim.api.nvim_set_keymap("n", "<A-2>", "<C-w>3>",
  { noremap = true })
vim.api.nvim_set_keymap("n", "<A-3>", "<C-w>3-",
  { noremap = true })
vim.api.nvim_set_keymap("n", "<A-4>", "<C-w>3+",
  { noremap = true })

-- insert mode window switching
vim.api.nvim_set_keymap("i", "<A-l>", "<C-w>l",
  { noremap = true })
vim.api.nvim_set_keymap("i", "<A-h>", "<C-w>h",
  { noremap = true })
vim.api.nvim_set_keymap("i", "<A-j>", "<C-w>j",
  { noremap = true })
vim.api.nvim_set_keymap("i", "<A-k>", "<C-w>k",
  { noremap = true })

-- normal mode window switching
vim.api.nvim_set_keymap("n", "<A-l>", "<C-w>l",
  { noremap = true })
vim.api.nvim_set_keymap("n", "<A-h>", "<C-w>h",
  { noremap = true })
vim.api.nvim_set_keymap("n", "<A-j>", "<C-w>j",
  { noremap = true })
vim.api.nvim_set_keymap("n", "<A-k>", "<C-w>k",
  { noremap = true })

-- terminal mode window switching
vim.api.nvim_set_keymap("t", "<A-l>", "<C-\\><C-N><C-w>l",
  { noremap = true })
vim.api.nvim_set_keymap("t", "<A-h>", "<C-\\><C-N><C-w>h",
  { noremap = true })
vim.api.nvim_set_keymap("t", "<A-j>", "<C-\\><C-N><C-w>j",
  { noremap = true })
vim.api.nvim_set_keymap("t", "<A-k>", "<C-\\><C-N><C-w>k",
  { noremap = true })

-- escape from terminal mode with ctrl-h
vim.api.nvim_set_keymap("t", "<c-h>", "<C-\\><C-N>",
  { noremap = true })
vim.keymap.set({ "n", "t" }, "<c-j>", function()
    vim.cmd("call feedkeys(\"<C-\\><C-N>\")")
    vim.cmd(":bdelete!")
  end,
  { noremap = true })

vim.keymap.set("n", "<leader>`", function()
    vim.cmd("G blame")
  end,
  { noremap = true })

vim.keymap.set(
  "n", "<Leader>gd",
  function()
    oneoffterminal("gitdh.sh")
  end,
  { noremap = true, silent = true })
vim.keymap.set(
  "n", "<Leader>gdb",
  function()
    local currentFile = vim.fn.expand('%')
    print(currentFile)
    oneoffterminal("gitdh.sh " .. currentFile)
  end,
  { noremap = true, silent = true })

-- fugitive keymaps
-- "]c" and "[c" and next and previous diff respectively
vim.api.nvim_set_keymap("n", "<leader>dgf", ":diffget //2<cr>",
  { noremap = true })
vim.api.nvim_set_keymap("n", "<leader>dgj", ":diffget //3<cr>",
  { noremap = true })

vim.keymap.set("n", "<leader>gl",
  function()
    willettescripts.initsplitterm("gitl.sh")
  end,
  { noremap = true, silent = true })

vim.api.nvim_set_keymap("n", "<leader>gdv", ":Gvdiffsplit!<cr>",
  { noremap = true, silent = true })

vim.keymap.set(
  "n", "<Leader>gs",
  function()
    -- vim.cmd "G status"
    willettescripts.initsplitterm("gits.sh")
  end,
  { noremap = true, silent = true })

vim.keymap.set(
  "n", "<Leader>gpl",
  function()
    vim.cmd "G pull"
  end,
  { noremap = true, silent = true })
vim.keymap.set("n", "<leader>gbd", function()
    oneoffterminal("gitbd.sh")
  end,
  { noremap = true })

local function getCurrentGitBranch()
  local out = vim.api.nvim_exec("!git rev-parse --abbrev-ref @", true)
  lines = {}
  for s in out:gmatch("[^\r\n]+") do
    table.insert(lines, s)
  end
  return lines[2]
end

local getcurrentgitrepo = willettescripts.getgitrepobase

-- git commit all
vim.keymap.set("n", "<leader>gc", function()
  vim.ui.input({ prompt = "Commit Messsage: " }, function(input)
    vim.cmd("!git add --all")
    vim.cmd("!git commit -m \"" .. input .. "\"")
    vim.cmd("!git push -u origin HEAD")
  end)
end, { noremap = true })

-- git checkout new
vim.keymap.set("n", "<leader>gcn", function()
  vim.ui.input({ prompt = "Checkout new branch with name:" }, function(input)
    vim.cmd("!git checkout -B " .. input)
  end)
end, { noremap = true })

local ok, lazy = verifynvimplugin("lazy")
if ok and lazy then
  if verifynvimplugin("lazy") then
    vim.keymap.set("n", "<leader>ls", function()
        lazy.sync({})
      end,
      { noremap = true })
  end
end


vim.keymap.set("n", "<leader>hc", function()
    vim.cmd(":helpclose")
  end,
  { noremap = true })

vim.keymap.set("n", "<leader>md", function()
    vim.cmd(":MarkdownPreviewToggle")
  end,
  { noremap = true })

-- waste my time
vim.keymap.set("n", "<leader>wmt", function()
    oneoffterminal("waste_time|bash")
  end,
  { noremap = true })

vim.keymap.set(
  "n", "<Leader>ne",
  function()
    vim.wo.relativenumber = true
    vim.wo.number = true
  end,
  {})
vim.keymap.set(
  "n", "<Leader>nd",
  function()
    vim.wo.relativenumber = false
    vim.wo.number = false
  end,
  {})

-- lsp functions
vim.keymap.set(
  "n",
  "<Leader>la",
  function()
    vim.cmd("LspStart")
  end,
  {})
vim.keymap.set(
  "n",
  "<Leader>lo",
  function()
    vim.ui.input({ prompt = "Lsp server to stop: " }, function(input)
      vim.cmd("LspStop " .. input)
    end)
  end,
  {})
vim.keymap.set(
  "n",
  "<Leader>loa",
  function()
    vim.cmd("LspStop *")
  end,
  {})
vim.keymap.set(
  "n",
  "<Leader>li",
  function()
    vim.cmd("LspInfo")
  end,
  {})
vim.keymap.set(
  "n",
  "<Leader>lr",
  function()
    vim.cmd("LspRestart")
  end,
  {})

-- copy last message
vim.keymap.set("n", "<leader>clm", function()
    vim.cmd("let @+=trim(execute('1messages'))")
  end,
  { noremap = true })
-- copy message
vim.keymap.set("n", "<leader>cm", function()
    vim.cmd("let @+=trim(execute('messages'))")
  end,
  { noremap = true })

vim.keymap.set(
  "n", "<Leader>tc",
  function()
    vim.cmd("tabclose")
  end,
  { noremap = true, silent = true })

vim.keymap.set(
  "n", "<Leader>cm7",
  function()
    willettescripts.chmod0777currentbuf()
  end,
  { noremap = true, silent = true })

vim.keymap.set(
  "n", "<Leader>cs",
  function()
    require("willette-scripts.colorschemes").selectcolorscheme()
  end,
  {})

vim.keymap.set("n", "<leader>ht", function()
    oneoffterminaltab("htop")
  end,
  { noremap = true })

vim.keymap.set("n", "<leader>ab", function()
    oneoffterminaltab("open_ableton_fiddle_project.sh")
  end,
  { noremap = true })

-- start docker
vim.keymap.set("n", "<leader>do", function()
  vim.cmd "!open -a Docker"
end, { silent = true })

vim.keymap.set("n", "<leader>ld", function()
    oneoffterminaltab("lazydocker")
  end,
  { noremap = true })

-- jira browser
vim.keymap.set("n", "<Leader>ig", function()
    oneoffterminaltab("ig")
  end,
  { noremap = true })

local function isInteger(str)
  return not (str == "" or str:find("%D")) -- str:match("%D") also works
end

-- make jira doc
vim.keymap.set("n", "<Leader>mj", function()
    vim.ui.input({ prompt = "New Kunai JIRA TODO Doc: " }, function(input)
      local filename = ""
      local jiraPrefix = "FINCORE-"
      if (isInteger(input)) then
        filename = jiraPrefix .. input .. ".md"
      else
        filename = input .. ".md"
      end
      local newFile = "~/git/manual/employment/kunai/tasks_todo/" .. filename
      vim.cmd("!touch " .. newFile)
      vim.cmd("e " .. newFile)
      vim.cmd("w")
    end)
  end,
  { noremap = true })

-- jira done - moves jira doc to DONE directory
vim.keymap.set("n", "<Leader>jd", function()
    -- get current file
    local filepath = vim.fn.expand('%')
    local filename = vim.fn.expand('%:t')
    local doneFilepath = "./jira/done/" .. filename
    os.rename(filepath, doneFilepath)
    vim.cmd("e " .. doneFilepath)
  end,
  { noremap = true })

-- make meeting doc
vim.keymap.set("n", "<Leader>mm", function()
    vim.ui.input({ prompt = "New Meeting Name: " }, function(input)
      local date = os.date("%Y-%m-%d")
      local newFile = "~/git/manual/employment/kunai/tasks_todo/" .. date .. "-" .. input .. ".md"
      vim.cmd("e " .. newFile)
      vim.cmd("w")
    end)
  end,
  { noremap = true })

vim.keymap.set("n", "<Leader>bh", function()
    oneoffterminaltab("browserhistoryfzf")
  end,
  { noremap = true })

vim.keymap.set("n", "<Leader>gor", function()
    oneoffterminaltab "go run ."
  end,
  { noremap = true })

vim.keymap.set(
  "n", "<Leader>t",
  function()
    willettescripts.terminalgit()
  end,
  {})

vim.keymap.set("n", "<leader>tb", function()
    willettescripts.terminalbuffer()
  end,
  { noremap = true })

vim.keymap.set(
  "n", "<Leader>em",
  function()
    vim.cmd("!openEmail.sh")
  end,
  { noremap = true, silent = true })

vim.keymap.set(
  "n", "<Leader>dd",
  function()
    vim.cmd("r!date")
  end,
  { noremap = true, silent = true })

vim.keymap.set(
  "n", "<Leader>ca",
  function()
    vim.cmd("!openCalendar.sh")
  end,
  { noremap = true, silent = true })

local ok, fzflua = verifynvimplugin("fzf-lua")
if ok and fzflua then
  vim.keymap.set(
  -- "buffer grep" for bg
    "n", "<Leader>bg",
    function()
      fzflua.blines()
    end,
    {})
  vim.keymap.set(
    "n", "<Leader>g",
    function()
      fzflua.live_grep_glob()
    end,
    {})
  vim.keymap.set(
    "n", "<Leader>m",
    function()
      fzflua.marks({})
    end,
    {})
  vim.keymap.set(
    "n", "<Leader>h",
    function()
      fzflua.help_tags({})
    end,
    { noremap = true, silent = true })

  vim.keymap.set(
    "n", "<Leader>f",
    function()
      require("fzf-lua").git_files()
    end,
    {})
  vim.keymap.set(
    "n", "<leader>gf",
    function()
      fzflua.fzf_exec("ls ~/git", {
        actions = {
          ['default'] = function(selected)
            fzflua.git_files({ cwd = "~/git/" .. selected[1] })
          end
        }
      })
    end,
    { noremap = true, silent = true })
  vim.keymap.set(
    "n", "<leader>gg",
    function()
      fzflua.fzf_exec("ls ~/git", {
        actions = {
          ['default'] = function(selected)
            fzflua.live_grep_glob({ cwd = "~/git/" .. selected[1] })
          end
        }
      })
    end,
    { noremap = true, silent = true })
  -- fzf select for open github page
  vim.keymap.set(
    "n", "<leader>gr",
    function()
      fzflua.fzf_exec("ls ~/git", {
        actions = {
          ['default'] = function(selected)
            local dirToOpen = "~/git/" .. selected[1]
            local pwd = vim.api.nvim_command_output("pwd")
            vim.cmd("cd " .. dirToOpen)
            vim.cmd("silent !gho")
            vim.cmd("cd " .. pwd)
          end
        }
      })
    end,
    { noremap = true, silent = true })
  vim.keymap.set("n", "<leader>tt", function()
      fzflua.fzf_exec("ls ~/git", {
        actions = {
          ['default'] = function(selected)
            local dirToOpen = "~/git/" .. selected[1]
            local pwd = vim.api.nvim_command_output("pwd")
            willettescripts.initsplitterm("cd " .. dirToOpen .. "; exec zsh;")
            vim.cmd("cd " .. pwd)
          end
        }
      })
    end,
    { noremap = true })
  vim.keymap.set(
    "n", "<Leader>r",
    function()
      fzflua.oldfiles()
    end,
    {})
  vim.keymap.set(
    "n", "<Leader>oc",
    function()
      fzflua.git_files({
        cwd = "~/git/dotfiles",
      })
    end,
    { noremap = true, silent = true })
  vim.keymap.set(
    "n", "<Leader>om",
    function()
      fzflua.git_files({
        cwd = "~/git/manual",
      })
    end,
    { noremap = true, silent = true })
  vim.keymap.set(
    "n", "<Leader>gco",
    function()
      fzflua.git_branches({})
    end,
    {})
  vim.keymap.set(
    "n", "<Leader>ch",
    function()
      fzflua.command_history({})
    end,
    {})
  vim.keymap.set("n", "<Leader>pf", function()
      fzflua.files({
        cwd = "~/.local/share/nvim/site/pack/packer",
      })
    end,
    { noremap = true, silent = true })
  vim.keymap.set(
    "n", "<Leader>ek",
    function()
      fzflua.files({
        cwd = "~/git/manual/employment/kunai",
      })
    end,
    { noremap = true, silent = true })
  vim.keymap.set("n", "<Leader>c1", function()
    fzflua.files({
      cwd = "~/git/capital_one_notes",
    })
  end, { noremap = true, silent = true })

  local user = os.getenv("USER")
  vim.keymap.set("n", "<Leader>td", function()
    if user == "andrewwillette" then
      fzflua.files({
        cwd = "~/git/manual/personaltodo/todo/",
      })
    else
      fzflua.files({
        cwd = "~/git/manual/employment/kunai/tasks_todo",
      })
    end
  end, { noremap = true, silent = true })
  vim.keymap.set("n", "<Leader>tdk", function()
    fzflua.files({
      cwd = "~/git/manual/employment/kunai/tasks_todo",
    })
  end, { noremap = true, silent = true })

  -- view buffers
  vim.keymap.set(
    "n", "<Leader>b",
    function()
      fzflua.buffers({})
    end,
    { noremap = true, silent = true })
end

local ok, gitsigns = verifynvimplugin("gitsigns")
if ok and gitsigns then
  vim.keymap.set(
    "n", "<Leader>gst",
    function()
      vim.cmd("Gitsigns toggle_signs")
    end,
    { noremap = true, silent = true })
end

local ok, ls = verifynvimplugin("luasnip")
if ok and ls then
  vim.keymap.set({ "i", "s" }, "<c-k>", function()
    if ls.expand_or_jumpable() then
      ls.expand_or_jump()
    end
  end, { silent = true })

  vim.keymap.set({ "i", "s" }, "<c-j>", function()
    if ls.jumpable(-1) then
      ls.jump(-1)
    end
  end, { silent = true })

  vim.keymap.set({ "i", "s" }, "<c-l>", function()
    if ls.choice_active() then
      ls.change_choice(1)
    end
  end, { silent = true })
end

vim.keymap.set("n", "<leader>ssm", function()
  vim.cmd "mksession! ~/tmp/Session.vim"
end, { silent = true })
vim.keymap.set("n", "<leader>sso", function()
  vim.cmd "source ~/tmp/Session.vim"
end, { silent = true })

vim.keymap.set("n", "<leader>sz", function()
  vim.cmd "!source ~/.zshrc"
end, { silent = true })

-- buffer next / previous
vim.keymap.set("n", "<leader>bn", function()
  vim.cmd "bn"
end, { silent = true })
-- vim.keymap.set("n", "<leader>bp", function()
--     vim.cmd "bp"
-- end, { silent = true })

-- quickfix list keybinds
vim.keymap.set("n", "<leader>co", function()
  vim.cmd "copen"
end, { silent = true })
vim.keymap.set("n", "<leader>cc", function()
  vim.cmd "cclose"
end, { silent = true })
vim.keymap.set("n", "<leader>cn", function()
  vim.cmd "cnext"
end, { silent = true })
vim.keymap.set("n", "<leader>cp", function()
  vim.cmd "cprevious"
end, { silent = true })

---@diagnostic disable-next-line: unused-function, unused-local
local function getWordUnderCursor()
  local word = vim.call('expand', '<cWORD>')
  print(word)
  return word
end

vim.keymap.set("n", "gx", "<Plug>(open-url-browser)")

-- debugging keymaps
local dapInstalled, dap = require("willette-scripts").verifynvimplugin("dap")
if dapInstalled and dap then
  local dapgo = require("dap-go")
  require("nvim-dap-virtual-text").setup()
  dapgo.setup()
  vim.keymap.set("n", "gx", "<Plug>(open-url-browser)")
  vim.keymap.set("n", "<F1>", dap.step_over)
  vim.keymap.set("n", "<F2>", dap.step_into)
  vim.keymap.set("n", "<F3>", dap.step_out)
  vim.keymap.set("n", "<F4>", dap.continue)
  vim.keymap.set("n", "<F5>", dap.terminate)
  vim.keymap.set("n", "<F6>", dap.clear_breakpoints)
  vim.keymap.set("n", "<F7>", dap.step_back)
  vim.keymap.set("n", "<leader>bp", dap.toggle_breakpoint)
  vim.keymap.set("n", "<leader>bpc", ":lua require'dap'.set_breakpoint(vim.fn.input('Breakpoint condition: '))<CR>")
  vim.keymap.set("n", "<leader>lp",
    ":lua require'dap'.set_breakpoint(nil, nil, vim.fn.input('Log point message: '))<CR>")
  vim.keymap.set("n", "<leader>dt", dapgo.debug_test)
end

local setKeyMap = function(lhs, rhsFunc, opts)
  vim.keymap.set("n", lhs, function() rhsFunc() end, opts)
end

M.lsp_capabilities = require('cmp_nvim_lsp').default_capabilities(vim.lsp.protocol.make_client_capabilities())

-- keymaps to be configured when attaching LSP server
function M.lsp_on_attach()
  setKeyMap("K", vim.lsp.buf.hover, {})
  vim.api.nvim_buf_set_option(0, 'formatexpr', 'v:lua.vim.lsp.formatexpr()')
  local ok, fzflua = willettescripts.verifynvimplugin("fzf-lua")
  if ok and fzflua then
    vim.keymap.set(
      "n", "<Leader>a",
      fzflua.lsp_code_actions,
      {})
    setKeyMap("gd", fzflua.lsp_definitions, {})
    setKeyMap("gr", fzflua.lsp_references, {})
    setKeyMap("gi", fzflua.lsp_implementations, {})
    vim.keymap.set(
      "n", "<Leader>o",
      function()
        fzflua.lsp_document_symbols({})
      end,
      {})
    setKeyMap("<leader>gt", fzflua.lsp_typedefs, {})
  end
  setKeyMap("<leader>rn", vim.lsp.buf.rename, {})
  setKeyMap("<leader>ds", vim.diagnostic.goto_prev, {})
  setKeyMap("<leader>df", vim.diagnostic.goto_next, {})
  local lspGroup = vim.api.nvim_create_augroup("lspGroup", { clear = true })
  vim.api.nvim_create_autocmd("BufWritePre",
    {
      callback = function()
        local wd = vim.fn.getcwd()
        -- don't autoformat lua code in neovim repository
        if not string.find(wd, "neovim") and not string.find(wd, "lspconfig") then
          vim.lsp.buf.format({ formatting_options = { tabSize = 2, trimTrailingWhitespace = true, insertSpaces = true } })
        end
      end,
      pattern = { "*.go", "*.scala", "*.lua", "*.rs" },
      group = lspGroup
    })
  local filetype = vim.api.nvim_get_option_value('ft', {})
  if filetype == 'c' then
    vim.opt.expandtab = true
    vim.opt.tabstop = 2
    vim.opt.shiftwidth = 2
  end
end

if verifynvimplugin("chatgpt") then
  setKeyMap("<leader>gp", require("chatgpt").openChat, {})
end

-- urlencode I copied off internet
local function urlencode(str)
  str = string.gsub(str, "([^0-9a-zA-Z !'()*._~-])", -- locale independent
    function(c) return string.format("%%%02X", string.byte(c)) end)
  str = string.gsub(str, " ", "+")
  return str
end

setKeyMap("<leader>ggl", function()
  vim.ui.input({ prompt = "googlesearch: " }, function(input)
    os.execute("open " .. "https://google.com/search?q=" .. urlencode(input))
  end)
end, {})

local function getCurrentBufferAbsolutePath()
  return vim.call('expand', '%:p')
end

-- leetcode test - add test to leetcode testing file
vim.keymap.set("n", "<leader>lt", function()
  currentBuffer = getCurrentBufferAbsolutePath()
  vim.api.nvim_exec("!creategotest " .. currentBuffer, false)
end, { silent = true })

local ok, browserbookmarks = verifynvimplugin("browser_bookmarks")
if ok and browserbookmarks then
  vim.keymap.set(
    "n",
    "<Leader>bm",
    browserbookmarks.select,
    { noremap = true, silent = true }
  )
end

local ok, browsemarks = verifynvimplugin("browsemarks")
if ok and browsemarks then
  browsemarks.setup({
    selected_browser = "brave"
  })

  vim.keymap.set(
    "n",
    "<Leader>bmm",
    browsemarks.add_bookmark,
    { noremap = true, silent = true }
  )
end

vim.keymap.set("n", "<Leader>kod", function()
    local kod = require("keyofday").keyofday()
    vim.print(kod)
  end,
  { noremap = true })

vim.keymap.set("n", "<Leader>jf", function()
    oneoffterminaltab "c1jenkinsfzf"
  end,
  { noremap = true })
local ok, open = verifynvimplugin("open")
if ok and open then
  local openconfig = require("open-config")
  open.set_keymap("<leader>ji", openconfig.jiras)
  open.set_keymap("<leader>sf", openconfig.splunk)
  open.set_keymap("<leader>nr", openconfig.newrelic)
end

vim.keymap.set(
  "n",
  "<Leader>dr",
  function()
    oneoffterminaltab("jiraclient -deliveryreport")
  end,
  { noremap = true, silent = true }
)

return M
