-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here
vim.api.nvim_set_var("better_escape_shortcut", "kj")
vim.api.nvim_set_var("better_escape_interval", 1000)
vim.opt.undofile = false
vim.opt.clipboard = "unnamed"
vim.opt.timeoutlen = 1000
vim.g.lazyvim_picker = "fzf"
vim.opt.cursorline = false
vim.opt.conceallevel = 0
vim.opt.wrap = true
vim.opt.list = false
-- vim.opt.tabstop = 4
-- vim.opt.shiftwidth = 4
vim.cmd("set breakindent")
vim.cmd("set breakindentopt:shift:2")
vim.opt.scrolloff = 2
vim.g.autoformat = false
vim.opt.showcmdloc="statusline"

vim.g["sneak#prompt"] = ''
vim.g["sneak#use_ic_scs"] = 1
vim.g["sneak#label"] = 1

vim.g.lazyvim_python_lsp = "pyright"
vim.g.lazyvim_python_ruff = "ruff"
vim.g.mellow_italic_functions = false
vim.g.mellow_highlight_overrides = {
  ["Comment"] = { fg="#8c877e" },
  -- ["Comment"] = { fg="#bfbf99" },
  ["LineNr"] = { link="Comment" }
}
vim.g.alabaster_floatborder = true
vim.g["conjure#filetypes"] = {"scheme"}

vim.g.clipboard = { -- wsl clipboard setup
  name = 'WslClipboard',
  copy = {
    ["+"] = 'clip.exe',
    ["*"] = 'clip.exe',
  },
  paste = {
    ['+'] = 'powershell.exe -c [Console]::Out.Write($(Get-Clipboard -Raw).tostring().replace("`r", ""))',
    ['*'] = 'powershell.exe -c [Console]::Out.Write($(Get-Clipboard -Raw).tostring().replace("`r", ""))',
  },
  cache_enabled = 0,
}
