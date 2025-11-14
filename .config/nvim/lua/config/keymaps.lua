-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

-- Setup ESC to exit from terminal
vim.keymap.set("t", "<Esc>", [[<C-\><C-n>]], { desc = "Exit terminal mode" })

vim.keymap.set("n", ";", ":", { noremap = true, silent = false })
vim.keymap.set("v", ";", ":", { noremap = true, silent = false })

-- Map <Space>t to open a terminal at the bottom, switch to it if already open
vim.keymap.set("n", "<Space>t", function()
  local term_buf
  -- Look for an existing terminal buffer
  for _, buf in ipairs(vim.api.nvim_list_bufs()) do
    if vim.api.nvim_buf_is_loaded(buf) and vim.bo[buf].buftype == "terminal" then
      term_buf = buf
      break
    end
  end

  if term_buf then
    -- If a terminal exists, switch to its window
    local win_found = false
    for _, win in ipairs(vim.api.nvim_list_wins()) do
      if vim.api.nvim_win_get_buf(win) == term_buf then
        vim.api.nvim_set_current_win(win)
        win_found = true
        break
      end
    end

    if not win_found then
      -- If terminal buffer exists but isn’t visible, show it in a split
      local height = 10
      vim.cmd(string.format("split | resize %d", height))
      vim.api.nvim_set_current_buf(term_buf)
    end

    -- Enter insert mode in the terminal
    vim.cmd("startinsert")
  else
    -- Otherwise, create a new terminal split
    local height = 10
    vim.cmd(string.format("split | resize %d | terminal", height))
    vim.cmd("startinsert")
  end
end, { desc = "Toggle/focus horizontal terminal" })

