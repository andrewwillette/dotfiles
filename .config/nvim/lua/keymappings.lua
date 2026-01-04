---@diagnostic disable: redefined-local
local M = {}

M.keymaps = {
  ["view incomplete jira issues"] = "<Leader>ji",
  ["create jira story"] = "<Leader>jic",
  ["clear search highlight"] = "<Leader>/",
  ["show current file path"] = "<leader>cb",
  ["no-op leader"] = "<leader>",
  ["open file tree"] = "<leader>1",
  ["open file tree on current buffer"] = "<leader>2",
  ["toggle word wrapping"] = "<leader>w",
  ["split window horizontally"] = "<leader>ws",
  ["split window vertically"] = "<leader>wv",
  ["open only current window"] = "<leader>wo",
  ["close current buffer"] = "<leader>wc",
  ["move current buffer to new tab"] = "<leader>wt",
  ["save current buffer"] = "<leader>s",
  ["open Orion notes"] = "<Leader>or",
  ["open diary entry"] = "<Leader>di",
  ["open weekly note"] = "<Leader>wk",
  ["start docker"] = "<Leader>do",
  ["jira browser"] = "<Leader>ig",
  ["test nearest"] = "<leader>tn",
  ["test file"] = "<leader>tf",
  ["run last test, test last"] = "<leader>tl",
  ["execute plenary test on file"] = "<leader>pt",
  ["toggle test output panel"] = "<leader>to",
  ["pane size smaller vertically"] = "<A-1>",
  ["pane size larger vertically"] = "<A-2>",
  ["pane size smaller horizontally"] = "<A-3>",
  ["pane size larger horizontally"] = "<A-4>",
  ["open new tab"] = "<leader><leader>t",
  ["open terminal in current buffer"] = "<c-t>",
  ["buffer selector"] = "<Leader>b",
  ["open notes on current kunai contract"] = "<leader>or",
  ["daily personal note"] = "<leader>dp",
  ["daily kunai note"] = "<leader>dk",
  ["weekly kunai note"] = "<leader>wk",
  ["move to right window"] = "<A-l>",
  ["move to left window"] = "<A-h>",
  ["move down window"] = "<A-j>",
  ["move up window"] = "<A-k>",
  ["toggle git blame"] = "<leader>`",
  ["git diff view"] = "<Leader>gd",
  ["delete current buffer"] = "<c-j>",
  ["git diff current buffer"] = "<Leader>gdb",
  ["fugitive use left diff"] = "<leader>dgf",
  ["fugitive use right diff"] = "<leader>dgj",
  ["git log"] = "<leader>gl",
  ["git diff fugitive view"] = "<leader>gdv",
  ["git status"] = "<Leader>gs",
  ["git pull"] = "<Leader>gpl",
  ["delete git branch picker"] = "<leader>gbd",
  ["git commit"] = "<leader>gc",
  ["git checkout new branch"] = "<leader>gcn",
  ["lazy sync"] = "<leader>ls",
  ["close help pane"] = "<leader>hc",
  ["waste my time"] = "<leader>wmt",
  ["enable relative numbers"] = "<Leader>ne",
  ["disable relative numbers"] = "<Leader>nd",
  ["copy last vim message"] = "<leader>clm",
  ["copy vim messages buffer"] = "<leader>cm",
  ["close tab"] = "<Leader>tc",
  ["chmod current buffer to be executable"] = "<Leader>cm7",
  ["select colorscheme"] = "<Leader>cs",
  ["toggle htop"] = "<leader>ht",
  ["select and open ableton project"] = "<leader>ab",
  ["toggle lazy docker"] = "<leader>ld",
  ["select and open git project with intellij"] = "<Leader>ig",
  ["make jira document"] = "<Leader>mj",
  ["mark jira document as done"] = "<Leader>jd",
  ["make meeting document"] = "<Leader>mm",
  ["browser history selector"] = "<Leader>bh",
  ["go run current project"] = "<Leader>gor",
  ["open terminal for current project"] = "<Leader>t",
  ["open terminal for current buffer"] = "<leader>tb",
  ["open email"] = "<Leader>em",
  ["insert current date time"] = "<Leader>dd",
  ["open calendar"] = "<Leader>ca",
  ["select vim command"] = "<Leader>cmd",
  ["grep current project"] = "<Leader>g",
  ["select from vim marks"] = "<Leader>m",
  ["select from help pages"] = "<Leader>h",
  ["select file from current project"] = "<Leader>f",
  ["select a git project and file from that project"] = "<leader>gf",
  ["select a git project and grep that project"] = "<leader>gg",
  ["select a git project and open its github"] = "<leader>gr",
  ["toggle youtube transcript handler"] = "<leader>yt",
  ["select a git project and open terminal for it"] = "<leader>tt",
  ["select from recent / old files"] = "<Leader>r",
  ["open a file from terminal configuration repo"] = "<Leader>oc",
  ["open a file from manual repo"] = "<Leader>om",
  ["select a git branch to checkout"] = "<Leader>gco",
  ["select from vim command history"] = "<Leader>ch",
  ["select from todo files"] = "<Leader>td",
  ["toggle gitsigns plugin"] = "<Leader>gst",
  ["luasnip jump forward"] = "<c-k>",
  ["luasnip jump back"] = "<c-j>",
  ["luasnip change choice"] = "<c-l>",
  ["make session"] = "<leader>ssm",
  ["open session"] = "<leader>sso",
  ["source my zshrc"] = "<leader>sz",
  ["buffer next"] = "<leader>bn",
  ["open quickfix list"] = "<leader>co",
  ["close quickfix list"] = "<leader>cc",
  ["quickfix next"] = "<leader>cn",
  ["quickfix previous"] = "<leader>cp",
  ["open url under cursor"] = "gx",
  ["select from finance bookmarks"] = "<leader>of",
  ["kunai delivery report"] = "<Leader>dr",
  ["key of the day"] = "<Leader>kod",
  ["add browser bookmark"] = "<Leader>bmm",
  ["select browser bookmark"] = "<Leader>bm",
  ["create leetcode test"] = "<leader>lt",
  ["open AI prompt window"] = "<leader>gp",
  ["open new AI prompt window"] = "<leader>gpn",
  ["pick from previous AI prompt chats"] = "<leader>gpp",
  ["take highlighted text into AI prompt"] = "<leader>gpp",
  ["select keymap configuration"] = "<leader>km",
  ["lsp show details on item"] = "K",
  ["lsp go to definition"] = "gd",
  ["lsp get references"] = "gr",
  ["lsp get implementations"] = "gi",
  ["lsp type definitions"] = "<leader>gt",
  ["lsp document symbols"] = "<leader>o",
  ["lsp rename variable"] = "<leader>rn",
  ["lsp diagnostic go to previous"] = "<leader>ds",
  ["lsp diagnostic go to next"] = "<leader>df",

  ["debugger step over"] = "<F1>",
  ["debugger step into"] = "<F2>",
  ["debugger step out"] = "<F3>",
  ["debugger continue"] = "<F4>",
  ["debugger terminate"] = "<F5>",
  ["debugger clear breakpoints"] = "<F6>",
  ["debugger step back"] = "<F7>",
  ["debugger toggle breakpoint"] = "<leader>bp",
  ["debugger set breakpoint with condition"] = "<leader>bpc",
  ["debugger set breakpoint with log point message"] = "<leader>lp",
  ["debugger debug go test"] = "<leader>dt",
}

local scripts = require("scripts")
local verify_nvim_plugin = scripts.verify_nvim_plugin
local one_off_terminal = scripts.one_off_terminal
local one_off_terminal_tab = scripts.one_off_terminal_tab

-- Lightweight grouping modular mappings
local function km(mode, lhs, rhs, desc, opts)
  opts = opts or {}
  opts = vim.tbl_extend("force", { noremap = true, silent = true, desc = desc }, opts)
  vim.keymap.set(mode, lhs, rhs, opts)
end

local function setup_general()
  km("n", M.keymaps["view incomplete jira issues"], function() one_off_terminal("jira_open_incomplete_issues.sh") end,
    "view incomplete jiras")
  km("n", M.keymaps["create jira story"], function() one_off_terminal("jira_create_issue.sh") end,
    "view incomplete jiras")
  km("n", M.keymaps["clear search highlight"], function() vim.cmd.nohlsearch() end, "Clear search highlight")
  km("n", M.keymaps["show current file path"], function() print(vim.fn.expand('%:p')) end, "Show current file path")
end

setup_general()

-- to avoid error message for empty leader
vim.keymap.set("n", M.keymaps["no-op leader"], function() end)

vim.keymap.set("n", M.keymaps["toggle word wrapping"], function()
    local is_wrap = vim.cmd('se wrap?')
    if (is_wrap == 'wrap') then
      vim.cmd('set wrap')
    else
      vim.cmd('set wrap!')
    end
  end,
  { noremap = true })

vim.keymap.set("n", M.keymaps["split window horizontally"], function()
    vim.cmd.split()
  end,
  { noremap = true })
vim.keymap.set("n", M.keymaps["split window vertically"], function()
    vim.cmd.vsplit()
  end,
  { noremap = true })
vim.keymap.set("n", M.keymaps["open only current window"], function()
    vim.cmd.only()
  end,
  { noremap = true })
vim.keymap.set("n", M.keymaps["close current buffer"], function()
    vim.cmd.close()
  end,
  { noremap = true })

vim.keymap.set("n", M.keymaps["move current buffer to new tab"], "<C-w>T", { noremap = true })

vim.keymap.set("n", M.keymaps["save current buffer"], function()
    vim.cmd('silent! write')
    local filetype = vim.api.nvim_get_option_value('ft', {})
    local wd = vim.fn.getcwd()
    -- neovim repo has lua files I don't want to source
    if filetype == 'lua' and not string.find(wd, "neovim") then
      vim.cmd('luafile %')
    end
  end,
  { noremap = true })

vim.keymap.set("n", M.keymaps["open new tab"], function()
    vim.cmd.tabnew()
  end,
  { noremap = true })

vim.keymap.set("n", M.keymaps["open terminal in current buffer"], function()
    vim.cmd.terminal()
    vim.cmd.startinsert()
  end,
  { noremap = true })

-- replace term codes
---@diagnostic disable-next-line: unused-function, unused-local
local function t(str)
  return vim.api.nvim_replace_termcodes(str, true, true, true)
end

-- adjust pane sizes, ordered x,y
vim.keymap.set("n", M.keymaps["pane size smaller vertically"], "<C-w>3<",
  { noremap = true })
vim.keymap.set("n", M.keymaps["pane size larger vertically"], "<C-w>3>",
  { noremap = true })
vim.keymap.set("n", M.keymaps["pane size smaller horizontally"], "<C-w>3-",
  { noremap = true })
vim.keymap.set("n", M.keymaps["pane size larger horizontally"], "<C-w>3+",
  { noremap = true })

-- normal mode window switching
vim.keymap.set("n", M.keymaps["move to right window"], "<C-w>l",
  { noremap = true })
vim.keymap.set("n", M.keymaps["move to left window"], "<C-w>h",
  { noremap = true })
vim.keymap.set("n", M.keymaps["move down window"], "<C-w>j",
  { noremap = true })
vim.keymap.set("n", M.keymaps["move up window"], "<C-w>k",
  { noremap = true })

-- terminal mode window switching
vim.keymap.set("t", M.keymaps["move to right window"], "<C-\\><C-N><C-w>l",
  { noremap = true })
vim.keymap.set("t", M.keymaps["move to left window"], "<C-\\><C-N><C-w>h",
  { noremap = true })
vim.keymap.set("t", M.keymaps["move down window"], "<C-\\><C-N><C-w>j",
  { noremap = true })
vim.keymap.set("t", M.keymaps["move up window"], "<C-\\><C-N><C-w>k",
  { noremap = true })

-- escape from terminal mode with ctrl-h
vim.keymap.set("t", "<c-h>", "<C-\\><C-N>",
  { noremap = true })

vim.keymap.set({ "n", "t" }, M.keymaps["delete current buffer"], function()
    vim.cmd("call feedkeys(\"<C-\\><C-N>\")")
    vim.cmd.bdelete({ bang = true })
  end,
  { noremap = true })


vim.keymap.set("n", M.keymaps["close help pane"], function()
    vim.cmd.helpclose()
  end,
  { noremap = true })

vim.keymap.set("n", M.keymaps["waste my time"], function()
    one_off_terminal("waste_time|bash")
  end,
  { noremap = true })

vim.keymap.set("n", M.keymaps["enable relative numbers"],
  function()
    vim.wo.relativenumber = true
    vim.wo.number = true
  end,
  {})
vim.keymap.set("n", M.keymaps["disable relative numbers"],
  function()
    vim.wo.relativenumber = false
    vim.wo.number = false
  end,
  {})

-- copy last message
vim.keymap.set("n", M.keymaps["copy last vim message"], function()
    vim.cmd("let @+=trim(execute('1messages'))")
  end,
  { noremap = true })
-- copy message
vim.keymap.set("n", M.keymaps["copy vim messages buffer"], function()
    vim.cmd("let @+=trim(execute('messages'))")
  end,
  { noremap = true })

vim.keymap.set("n", M.keymaps["close tab"],
  function()
    vim.cmd.tabclose()
  end,
  { noremap = true, silent = true })

vim.keymap.set("n", M.keymaps["chmod current buffer to be executable"],
  function()
    scripts.chmod_0777_currentbuf()
  end,
  { noremap = true, silent = true })

vim.keymap.set("n", M.keymaps["select colorscheme"],
  function()
    require("scripts.colorschemes").select_colorscheme()
  end,
  {})

vim.keymap.set("n", M.keymaps["toggle htop"], function()
    one_off_terminal_tab("htop")
  end,
  { noremap = true })

vim.keymap.set("n", M.keymaps["select and open ableton project"], function()
    scripts.init_split_term("open_ableton_fiddle_project.sh")
  end,
  { noremap = true })

vim.keymap.set("n", M.keymaps["toggle lazy docker"], function()
    one_off_terminal_tab("lazydocker")
  end,
  { noremap = true })

vim.keymap.set("n", M.keymaps["select and open git project with intellij"], function()
    one_off_terminal_tab("ig")
  end,
  { noremap = true })

local function is_integer(str)
  return not (str == "" or str:find("%D")) -- str:match("%D") also works
end

vim.keymap.set("n", M.keymaps["make jira document"], function()
    vim.ui.input({ prompt = "New Kunai JIRA TODO Doc: " }, function(input)
      local filename = ""
      local jira_prefix = "FINCORE-"
      if (is_integer(input)) then
        filename = jira_prefix .. input .. ".md"
      else
        filename = input .. ".md"
      end
      local new_file = "~/git/manual/employment/kunai/tasks_todo/" .. filename
      vim.cmd("!touch " .. new_file)
      vim.cmd.edit(vim.fn.fnameescape(new_file))
      vim.cmd.write()
    end)
  end,
  { noremap = true })

vim.keymap.set("n", M.keymaps["mark jira document as done"], function()
    -- get current file
    local filepath = vim.fn.expand('%')
    local filename = vim.fn.expand('%:t')
    local done_filepath = "./jira/done/" .. filename
    os.rename(filepath, done_filepath)
    vim.cmd.edit(vim.fn.fnameescape(done_filepath))
  end,
  { noremap = true })

vim.keymap.set("n", M.keymaps["make meeting document"], function()
    vim.ui.input({ prompt = "New Meeting Name: " }, function(input)
      local date = os.date("%Y-%m-%d")
      local new_file = "~/git/manual/employment/kunai/tasks_todo/" .. date .. "-" .. input .. ".md"
      vim.cmd.edit(vim.fn.fnameescape(new_file))
      vim.cmd.write()
    end)
  end,
  { noremap = true })

vim.keymap.set("n", M.keymaps["browser history selector"], function()
    one_off_terminal_tab("browserhistoryfzf")
  end,
  { noremap = true })

vim.keymap.set("n", M.keymaps["go run current project"], function()
    one_off_terminal_tab "go run ."
  end,
  { noremap = true })

vim.keymap.set("n", M.keymaps["open terminal for current project"],
  function()
    scripts.terminal_git()
  end,
  {})

vim.keymap.set("n", M.keymaps["open terminal for current buffer"], function()
    scripts.terminal_buffer()
  end,
  { noremap = true })

vim.keymap.set("n", M.keymaps["open email"],
  function()
    vim.cmd("!openEmail.sh")
  end,
  { noremap = true, silent = true })

vim.keymap.set("n", M.keymaps["insert current date time"],
  function()
    vim.cmd("r!date")
  end,
  { noremap = true, silent = true })

vim.keymap.set("n", M.keymaps["open calendar"],
  function()
    vim.cmd("!openCalendar.sh")
  end,
  { noremap = true, silent = true })

local ok, fzflua = verify_nvim_plugin("fzf-lua")
if ok and fzflua then
  vim.keymap.set("n", M.keymaps["select vim command"],
    function()
      fzflua.commands()
    end,
    {})
  vim.keymap.set("n", M.keymaps["grep current project"],
    function()
      fzflua.live_grep()
    end,
    {})
  vim.keymap.set("n", M.keymaps["select from vim marks"],
    function()
      fzflua.marks({})
    end,
    {})
  vim.keymap.set("n", M.keymaps["select from help pages"],
    function()
      fzflua.help_tags({})
    end,
    { noremap = true, silent = true })

  vim.keymap.set("n", M.keymaps["select file from current project"],
    function()
      fzflua.git_files()
    end,
    {})
  vim.keymap.set("n", M.keymaps["select a git project and file from that project"],
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
  vim.keymap.set("n", M.keymaps["select a git project and grep that project"],
    function()
      fzflua.fzf_exec("ls ~/git", {
        actions = {
          ['default'] = function(selected)
            fzflua.live_grep({ cwd = "~/git/" .. selected[1] })
          end
        }
      })
    end,
    { noremap = true, silent = true })

  vim.keymap.set("n", M.keymaps["select a git project and open its github"],
    function()
      fzflua.fzf_exec("ls ~/git", {
        actions = {
          ['default'] = function(selected)
            local dir_to_open = "~/git/" .. selected[1]
            local pwd = vim.fn.getcwd()
            vim.cmd.cd(dir_to_open)
            vim.cmd("silent !gho")
            vim.cmd.cd(pwd)
          end
        }
      })
    end,
    { noremap = true, silent = true })

  -- prompt user for upload or open? if upload, prompt user for youtube_url and transcript_title, execute command 'cleansrt -o $HOME/tmp/youtubetranscripts/<transcript_title>.txt "<youtube_url>"' with inputted value, make sure to surround with quotes correctly, wait for completion of command, then execute fzf tool on files in $HOME/tmp/youtubetranscripts to open as ":e <file>"
  -- if option selected is open, just execute fzf tool on files in $HOME/tmp/youtubetranscripts to open as ":e <file>"
  vim.keymap.set("n", M.keymaps["toggle youtube transcript handler"], function()
    local choice = vim.fn.input("Upload new transcript or open existing? (u/o): ")

    local transcripts_dir = vim.fn.expand("~/tmp/youtubetranscripts")
    vim.fn.mkdir(transcripts_dir, "p") -- ensure dir exists

    if choice == "u" then
      local youtube_url = vim.fn.input("YouTube URL: ")
      if youtube_url == "" then
        print("You must provide a YouTube URL")
        return
      end

      -- Build command safely (handles spaces etc.)
      local cmd = string.format(
        "cleansrt -od %s %s",
        vim.fn.shellescape(transcripts_dir),
        vim.fn.shellescape(youtube_url)
      )

      -- Run and capture stdout (should be just the file path)
      local out = vim.fn.system(cmd)
      if vim.v.shell_error ~= 0 then
        print("Error running cleansrt command")
        return
      end

      -- Trim trailing whitespace/newlines
      local path = out:gsub("%s+$", "")
      if path == "" then
        print("cleansrt returned an empty path")
        return
      end

      -- Open the file; fnameescape handles spaces and special chars
      vim.cmd("edit " .. vim.fn.fnameescape(path))
    elseif choice == "o" then
      -- Run fzf to pick a transcript file to open
      fzflua.fzf_exec("ls " .. transcripts_dir, {
        actions = {
          ['default'] = function(selected)
            local file_to_open = transcripts_dir .. "/" .. selected[1]
            vim.cmd.edit(vim.fn.fnameescape(file_to_open))
          end
        }
      })
    end
  end, { noremap = true, silent = true })

  vim.keymap.set("n", M.keymaps["select a git project and open terminal for it"], function()
      fzflua.fzf_exec("ls ~/git", {
        actions = {
          ['default'] = function(selected)
            local dir_to_open = "~/git/" .. selected[1]
            local pwd = vim.fn.getcwd()
            scripts.init_split_term("cd " .. dir_to_open .. "; exec zsh;")
            vim.cmd.cd(pwd)
          end
        }
      })
    end,
    { noremap = true })
  vim.keymap.set("n", M.keymaps["select from recent / old files"],
    function()
      fzflua.oldfiles()
    end,
    {})
  vim.keymap.set("n", M.keymaps["open a file from terminal configuration repo"],
    function()
      fzflua.git_files({
        cwd = "~/git/dotfiles",
      })
    end,
    { noremap = true, silent = true })
  vim.keymap.set("n", M.keymaps["open a file from manual repo"],
    function()
      fzflua.git_files({
        cwd = "~/git/manual",
      })
    end,
    { noremap = true, silent = true })
  vim.keymap.set("n", M.keymaps["select a git branch to checkout"],
    function()
      fzflua.git_branches({})
    end,
    {})
  vim.keymap.set("n", M.keymaps["select from vim command history"],
    function()
      fzflua.command_history({})
    end,
    {})

  local user = os.getenv("USER")
  vim.keymap.set("n", M.keymaps["select from todo files"], function()
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

  -- view buffers
  vim.keymap.set("n", M.keymaps["buffer selector"],
    function()
      fzflua.buffers({})
    end,
    { noremap = true, silent = true })

  -- select keymap and jump to its configuration
  vim.keymap.set("n", M.keymaps["select keymap configuration"], function()
    local keymaps_list = {}
    for desc, key in pairs(M.keymaps) do
      table.insert(keymaps_list, key .. " :: " .. desc)
    end
    table.sort(keymaps_list)
    fzflua.fzf_exec(keymaps_list, {
      previewer = false,
      actions = {
        ['default'] = function(selected)
          local desc = selected[1]:match(":: (.+)$")
          local pattern = 'M.keymaps\\["' .. desc .. '"\\]'
          local ok, _ = pcall(vim.cmd, 'vimgrep /' .. pattern .. '/j ~/git/dotfiles/.config/nvim/lua/**/*.lua')
          if ok then
            vim.cmd('cfirst')
          else
            vim.notify("No match found for: " .. desc, vim.log.levels.WARN)
          end
        end
      }
    })
  end, { noremap = true, silent = true })
end

local ok, gitsigns = verify_nvim_plugin("gitsigns")
if ok and gitsigns then
  vim.keymap.set("n", M.keymaps["toggle gitsigns plugin"],
    function()
      gitsigns.toggle_signs()
    end,
    { noremap = true, silent = true })
end

local ok, ls = verify_nvim_plugin("luasnip")
if ok and ls then
  vim.keymap.set({ "i", "s" }, M.keymaps["luasnip jump forward"], function()
    if ls.expand_or_jumpable() then
      ls.expand_or_jump()
    end
  end, { silent = true })

  vim.keymap.set({ "i", "s" }, M.keymaps["luasnip jump back"], function()
    if ls.jumpable(-1) then
      ls.jump(-1)
    end
  end, { silent = true })

  vim.keymap.set({ "i", "s" }, M.keymaps["luasnip change choice"], function()
    if ls.choice_active() then
      ls.change_choice(1)
    end
  end, { silent = true })
end

vim.keymap.set("n", M.keymaps["make session"], function()
  vim.cmd.mksession({ args = { "~/tmp/Session.vim" }, bang = true })
end, { silent = true })
vim.keymap.set("n", M.keymaps["open session"], function()
  vim.cmd.source("~/tmp/Session.vim")
end, { silent = true })

vim.keymap.set("n", M.keymaps["source my zshrc"], function()
  vim.cmd "!source ~/.zshrc"
end, { silent = true })

-- buffer next / previous
vim.keymap.set("n", M.keymaps["buffer next"], function()
  vim.cmd.bnext()
end, { silent = true })

-- quickfix list keybinds
vim.keymap.set("n", M.keymaps["open quickfix list"], function()
  vim.cmd.copen()
end, { silent = true })
vim.keymap.set("n", M.keymaps["close quickfix list"], function()
  vim.cmd.cclose()
end, { silent = true })
vim.keymap.set("n", M.keymaps["quickfix next"], function()
  vim.cmd.cnext()
end, { silent = true })
vim.keymap.set("n", M.keymaps["quickfix previous"], function()
  vim.cmd.cprevious()
end, { silent = true })

---@diagnostic disable-next-line: unused-function, unused-local
local function get_word_under_cursor()
  local word = vim.fn.expand('<cWORD>')
  print(word)
  return word
end

vim.keymap.set("n", M.keymaps["open url under cursor"],
  "<Plug>(open-url-browser)")

-- debugging keymaps
local dap_installed, dap = require("scripts").verify_nvim_plugin("dap")
if dap_installed and dap then
  local dapgo = require("dap-go")
  require("nvim-dap-virtual-text").setup()
  dapgo.setup()
  vim.keymap.set("n", M.keymaps["debugger step over"], dap.step_over)
  vim.keymap.set("n", M.keymaps["debugger step into"], dap.step_into)
  vim.keymap.set("n", M.keymaps["debugger step out"], dap.step_out)
  vim.keymap.set("n", M.keymaps["debugger continue"], dap.continue)
  vim.keymap.set("n", M.keymaps["debugger terminate"], dap.terminate)
  vim.keymap.set("n", M.keymaps["debugger clear breakpoints"], dap.clear_breakpoints)
  vim.keymap.set("n", M.keymaps["debugger step back"], dap.step_back)
  vim.keymap.set("n", M.keymaps["debugger toggle breakpoint"], dap.toggle_breakpoint)
  vim.keymap.set("n", M.keymaps["debugger set breakpoint with condition"],
    ":lua require'dap'.set_breakpoint(vim.fn.input('Breakpoint condition: '))<CR>")
  vim.keymap.set("n", M.keymaps["debugger set breakpoint with log point message"],
    ":lua require'dap'.set_breakpoint(nil, nil, vim.fn.input('Log point message: '))<CR>")
  vim.keymap.set("n", M.keymaps["debugger debug go test"], dapgo.debug_test)
end

local set_normal_mode_keymap = function(lhs, rhs_func, opts)
  vim.keymap.set("n", lhs, function() rhs_func() end, opts)
end

-- "gp" is gp prompt
if verify_nvim_plugin("gp") then
  local function keymap_options(desc)
    return {
      noremap = true,
      silent = true,
      nowait = true,
      desc = "GPT prompt " .. desc,
    }
  end
  vim.keymap.set("n", M.keymaps["open AI prompt window"],
    "<cmd>GpChatToggle<cr>", keymap_options("Open most recent chat"))
  vim.keymap.set("n", M.keymaps["open new AI prompt window"],
    "<cmd>GpChatNew<cr>", keymap_options("New Chat"))
  -- gpt prompt pk
  vim.keymap.set("n", M.keymaps["pick from previous AI prompt chats"],
    "<cmd>GpChatFinder<cr>", keymap_options("Select existing chat"))
  vim.keymap.set("v", "<leader>gpp",
    ":<C-u>'<,'>GpChatPaste<cr>", keymap_options("Paste selection to prompt"))
end

-- urlencode I copied off internet
local function urlencode(str)
  str = string.gsub(str, "([^0-9a-zA-Z !'()*._~-])", -- locale independent
    function(c) return string.format("%%%02X", string.byte(c)) end)
  str = string.gsub(str, " ", "+")
  return str
end

set_normal_mode_keymap("<leader>ggl", function()
  vim.ui.input({ prompt = "googlesearch: " }, function(input)
    os.execute("open " .. "https://google.com/search?q=" .. urlencode(input))
  end)
end, {})

local function get_current_buffer_absolute_path()
  return vim.fn.expand('%:p')
end

-- leetcode test - add test to leetcode testing file
vim.keymap.set("n", M.keymaps["create leetcode test"], function()
  current_buffer = get_current_buffer_absolute_path()
  vim.cmd("!creategotest " .. current_buffer)
end, { silent = true })

local ok, browserbookmarks = verify_nvim_plugin("browser_bookmarks")
if ok and browserbookmarks then
  vim.keymap.set("n", M.keymaps["select browser bookmark"],
    browserbookmarks.select,
    { noremap = true, silent = true }
  )
end

local ok, browsemarks = verify_nvim_plugin("browsemarks")
if ok and browsemarks then
  browsemarks.setup({
    selected_browser = "brave"
  })

  vim.keymap.set("n", M.keymaps["add browser bookmark"],
    browsemarks.add_bookmark,
    { noremap = true, silent = true }
  )
end

vim.keymap.set("n", M.keymaps["key of the day"], function()
    local kod = require("keyofday").keyofday()
    vim.print(kod)
  end,
  { noremap = true })

vim.keymap.set("n", "<Leader>jf", function()
    one_off_terminal_tab "c1jenkinsfzf"
  end,
  { noremap = true })

local ok, open = verify_nvim_plugin("open")
if ok and open then
  local openconfig = require("open-config")
  open.set_keymap(M.keymaps["select from finance bookmarks"], openconfig.finance)
end

vim.keymap.set("n", M.keymaps["kunai delivery report"],
  function()
    one_off_terminal_tab("jiraclient -deliveryreport")
  end,
  { noremap = true, silent = true }
)

return M
