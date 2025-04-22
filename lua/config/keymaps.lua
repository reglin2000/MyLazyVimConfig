-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
local map = vim.keymap.set
map({ "n" }, "<leader>fs", "<cmd>w<cr>", { desc = "Save File", silent = true })
map({ "n" }, "<S-h>", "H", { desc = "Goto Screen Top", silent = true })
map({ "n" }, "<S-l>", "L", { desc = "Goto Screen Bot", silent = true })
map({ "n" }, "<leader><space>", ":", { desc = "Ex Mode", silent = false })
vim.keymap.del('v', '<')
vim.keymap.del('v', '>')
