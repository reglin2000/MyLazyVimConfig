-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
-- Add any additional autocmds here

local function set_my_colors()
  vim.api.nvim_set_hl(0, "Sneak", { link = "Search" })
  vim.api.nvim_set_hl(0, "SneakLabel", { link = "Search" })
  vim.api.nvim_set_hl(0, "SneakScope", { link = "DiffText" })
end

vim.api.nvim_create_autocmd({"ColorScheme"}, {
  pattern = {"*"},
  callback = function ()
    set_my_colors()
  end
})

set_my_colors()

vim.api.nvim_create_autocmd("FileType", {
  pattern = { "text", "plaintex", "typst", "gitcommit", "markdown" },
  callback = function()
    vim.opt_local.spell = false
  end,
})
vim.api.nvim_create_autocmd("FileType", {
  pattern = { "markdown" },
  callback = function()
    vim.opt.linebreak = false
    vim.api.nvim_buf_set_keymap(0, "i", "<tab>", "<cmd>AutolistTab<cr>", {})
    vim.api.nvim_buf_set_keymap(0, "i", "<s-tab>", "<cmd>AutolistShiftTab<cr>", {})
    vim.api.nvim_buf_set_keymap(0, "i", "<CR>", "<CR><cmd>AutolistNewBullet<cr>", {})
    vim.api.nvim_buf_set_keymap(0, "n", "o", "o<cmd>AutolistNewBullet<cr>", {})
    vim.api.nvim_buf_set_keymap(0, "n", "O", "O<cmd>AutolistNewBulletBefore<cr>", {})

    -- functions to recalculate list on edit
    vim.api.nvim_buf_set_keymap(0, "n", ">>", ">><cmd>AutolistRecalculate<cr>", {})
    vim.api.nvim_buf_set_keymap(0, "n", "<<", "<<<cmd>AutolistRecalculate<cr>", {})
    vim.api.nvim_buf_set_keymap(0, "n", "dd", "dd<cmd>AutolistRecalculate<cr>", {})
    vim.api.nvim_buf_set_keymap(0, "v", "d", "d<cmd>AutolistRecalculate<cr>", {})
    vim.cmd("set foldexpr=NestedMarkdownFolds()")
  end,
})
vim.api.nvim_create_autocmd("FileType", {
  pattern = { "json" },
  callback = function()
    vim.cmd("setlocal comments=sO:*\\ -,mO:*\\ \\ ,exO:*/,s1:/*,mb:*,ex:*/,:///,://")
    vim.bo.commentstring = '// %s'
  end,
})

vim.api.nvim_create_autocmd("FileType", {
  pattern = { "scheme", "skill" },
  callback = function()
    vim.keymap.set('i', "'", "'", { buffer = 0 })
  end,
})
