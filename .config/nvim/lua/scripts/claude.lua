local M = {}

-- Stored claude terminal buffer number
local claude_bufnr = nil

---Print all terminal buffer names (for debugging)
function M.print_terminal_buffers()
  local found = false
  for _, buf in ipairs(vim.api.nvim_list_bufs()) do
    if vim.api.nvim_buf_is_valid(buf) and vim.bo[buf].buftype == "terminal" then
      local name = vim.api.nvim_buf_get_name(buf)
      local marker = (buf == claude_bufnr) and " [CLAUDE]" or ""
      print(string.format("Terminal buf %d: %s%s", buf, name, marker))
      found = true
    end
  end
  if not found then
    print("No terminal buffers found")
  end
end

---Print current buffer info
function M.print_current_buffer()
  local buf = vim.api.nvim_get_current_buf()
  local name = vim.api.nvim_buf_get_name(buf)
  local buftype = vim.bo[buf].buftype
  print(string.format("Current buf %d: name=%s, buftype=%s", buf, name, buftype))
end

---Mark current terminal as the claude terminal
function M.mark_as_claude()
  local buf = vim.api.nvim_get_current_buf()
  if vim.bo[buf].buftype ~= "terminal" then
    vim.notify("Current buffer is not a terminal", vim.log.levels.WARN)
    return
  end
  claude_bufnr = buf
  vim.notify("Marked buffer " .. buf .. " as claude terminal", vim.log.levels.INFO)
end

---Find terminal buffer running claude
---@return number|nil bufnr Buffer number or nil if not found
local function find_claude_terminal()
  -- Use marked buffer if valid
  if claude_bufnr and vim.api.nvim_buf_is_valid(claude_bufnr) and vim.bo[claude_bufnr].buftype == "terminal" then
    return claude_bufnr
  end
  claude_bufnr = nil
  return nil
end

---Get visually selected text
---@return string text The selected text
local function get_visual_selection()
  local _, srow, scol = unpack(vim.fn.getpos("'<"))
  local _, erow, ecol = unpack(vim.fn.getpos("'>"))

  if srow > erow or (srow == erow and scol > ecol) then
    srow, erow = erow, srow
    scol, ecol = ecol, scol
  end

  local lines = vim.api.nvim_buf_get_lines(0, srow - 1, erow, false)
  if #lines == 0 then
    return ""
  end

  -- Handle single line selection
  if #lines == 1 then
    lines[1] = lines[1]:sub(scol, ecol)
  else
    lines[1] = lines[1]:sub(scol)
    lines[#lines] = lines[#lines]:sub(1, ecol)
  end

  return table.concat(lines, "\n")
end

---Send text to a terminal buffer
---@param bufnr number Terminal buffer number
---@param text string Text to send
local function send_to_terminal(bufnr, text)
  local chan = vim.bo[bufnr].channel
  if chan == 0 then
    vim.notify("No channel for terminal buffer", vim.log.levels.ERROR)
    return false
  end

  -- Find window displaying the terminal buffer and enter insert mode
  for _, win in ipairs(vim.api.nvim_list_wins()) do
    if vim.api.nvim_win_get_buf(win) == bufnr then
      local current_win = vim.api.nvim_get_current_win()
      vim.api.nvim_set_current_win(win)
      vim.cmd("startinsert")
      vim.api.nvim_set_current_win(current_win)
      break
    end
  end

  -- Send the text followed by newline to submit
  vim.api.nvim_chan_send(chan, text .. "\n")
  return true
end

---Send visual selection to claude terminal
function M.send_selection_to_claude()
  local text = get_visual_selection()
  if text == "" then
    vim.notify("No text selected", vim.log.levels.WARN)
    return
  end

  local claude_buf = find_claude_terminal()
  if not claude_buf then
    vim.notify("No claude terminal found. Start claude in a terminal first.", vim.log.levels.WARN)
    return
  end

  if send_to_terminal(claude_buf, text) then
    vim.notify("Sent to claude", vim.log.levels.INFO)
  end
end

---Send visual selection to claude with a prompt prefix
---@param prompt string|nil Optional prompt to prepend
function M.send_selection_with_prompt(prompt)
  local text = get_visual_selection()
  if text == "" then
    vim.notify("No text selected", vim.log.levels.WARN)
    return
  end

  local claude_buf = find_claude_terminal()
  if not claude_buf then
    vim.notify("No claude terminal found. Start claude in a terminal first.", vim.log.levels.WARN)
    return
  end

  local final_text = text
  if prompt and prompt ~= "" then
    final_text = prompt .. "\n\n```\n" .. text .. "\n```"
  end

  if send_to_terminal(claude_buf, final_text) then
    vim.notify("Sent to claude", vim.log.levels.INFO)
  end
end

---Prompt user for context then send selection
function M.send_selection_with_input()
  local text = get_visual_selection()
  if text == "" then
    vim.notify("No text selected", vim.log.levels.WARN)
    return
  end

  vim.ui.input({ prompt = "Prompt for claude: " }, function(input)
    if not input then
      return
    end
    M.send_selection_with_prompt(input)
  end)
end

---Open a new tab with claude CLI and mark it
function M.open_claude_terminal()
  vim.cmd("tabnew | terminal claude")
  claude_bufnr = vim.api.nvim_get_current_buf()
  vim.notify("Opened and marked claude terminal (buf " .. claude_bufnr .. ")", vim.log.levels.INFO)
  vim.cmd("startinsert")
end

return M
