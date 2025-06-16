-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

vim.o.clipboard = "unnamedplus" -- Use system clipboard
vim.opt.iskeyword:append("-") -- Treat hyphenated words as one word
vim.opt.diffopt = "vertical" -- Vertical diff
