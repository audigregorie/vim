-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

-- Go into Normal mode
vim.keymap.set("i", "kj", "<Esc>", { noremap = false })

-- Toggle LSP inlay hints
vim.keymap.set("n", "<leader>ih", function()
  local bufnr = vim.api.nvim_get_current_buf()
  local enabled = vim.lsp.inlay_hint.is_enabled({ bufnr = bufnr })
  vim.lsp.inlay_hint.enable(not enabled, { bufnr = bufnr })
end, { desc = "Toggle Inlay Hints" })

-- Paste below without indentation
vim.keymap.set("n", "p", "]p")
vim.keymap.set("n", "P", "[p")

-- Navigate split windows
vim.keymap.set("n", "<C-h>", "<C-w>h", { noremap = true, silent = true })
vim.keymap.set("n", "<C-j>", "<C-w>j", { noremap = true, silent = true })
vim.keymap.set("n", "<C-k>", "<C-w>k", { noremap = true, silent = true })
vim.keymap.set("n", "<C-l>", "<C-w>l", { noremap = true, silent = true })

-- Toggle between previous file and current file
vim.keymap.set("n", "<leader><leader>", "<c-^>")

-- Press 'H', 'L' to jump to start/end of a line (first/last char)
vim.keymap.set("n", "L", "$", { noremap = true, silent = true })
vim.keymap.set("n", "H", "^", { noremap = true, silent = true })

-- Turn off highlighted results
vim.keymap.set("n", "<leader>nh", "<cmd>noh<cr>", { noremap = true, silent = true })

-- Yank and then comment out the selected code in visual mode using mini.comment
vim.keymap.set("x", "<leader>y", function()
  -- Yank the selected lines
  vim.cmd('normal! "+y')

  -- Get the range of the selected lines
  local start_line = vim.fn.line("'<")
  local end_line = vim.fn.line("'>")

  -- Use mini.comment to comment the range
  require("mini.comment").toggle_lines(start_line, end_line)

  -- Move the cursor to the last line
  vim.fn.cursor(end_line, 0)
end, { noremap = true, silent = true })

-- Stay in indent mode
vim.keymap.set("v", "<", "<gv", { noremap = true, silent = true })
vim.keymap.set("v", ">", ">gv", { noremap = true, silent = true })

-- Move text up and down in visual mode
vim.keymap.set("v", "<S-j>", ":m '>+1<cr>gv=gv", { noremap = true, silent = true })
vim.keymap.set("v", "<S-k>", ":m '<-2<cr>gv=gv", { noremap = true, silent = true })

-- Git blame
vim.keymap.set("n", "<leader>gb", ":Git blame<CR>", { noremap = true, desc = "Git: blame" })
