local function fzf_file_browser(opts)
  opts = opts or {}
  opts.cwd = opts.cwd or vim.fn.expand('%:p:h')
  local fzf_lua = require'fzf-lua'
  local cwd = opts.cwd or (vim.fn.getcwd())
  local select = function(selected)
    local filePath = cwd .. selected[1]
    if selected[1] == "../" then
      filePath = cwd:gsub("(.*/).*/", "%1")
      fzf_file_browser({cwd = filePath})
    elseif string.sub(selected[1], -1) == '/' then
      fzf_file_browser({cwd = filePath})
    else
      vim.cmd('e ' .. filePath)
    end
  end
  if string.sub(cwd, -1) ~= '/' then
    cwd = cwd .. '/'
  end

  opts.winopts = opts.winopts or {
    split = "belowright new",-- open in a split instead?
  }
  -- opts.previewer = "builtin"
  opts.prompt = cwd
  -- opts.previewer = "bat"
  opts.actions = {
    ['tab'] = select,
    ['default'] = select,
  }
  fzf_lua.fzf_exec("echo \"../\" && LC_COLLATE=C ls -ap | grep \"/\" | sed \"1,2 d\" | LC_COLLATE=C sort -V && LC_COLLATE=C ls -ap | grep -v \"/\" | LC_COLLATE=C sort -V", opts)
end

local fzf_file_browser_wrapper = function(opts)
  return function()
    fzf_file_browser(opts)
  end
end

return {
  {
    "ibhagwan/fzf-lua",
    dependencies = {
      "michel-garcia/fzf-lua-file-browser.nvim"
    },
    opts = {
      -- "max-perf",
      winopts = {
        height = 0.99,
        width = 0.99,
        fullscreen = true,
        border = false,
        preview = {
          delay = 1,
          -- default = "bat",
          border = "noborder",
          layout = "vertical",
          vertical = 'up:45%',
        },
      },
      previewer = {
        builtin = {
          treesitter = { enable = true, disable = {} },
        },
      },
      defaults = {
        -- file_icons = false,
        -- git_icons = false,
        color_icons = false,
      },
      files = {
        preview_opts = "hidden",
        winopts = { split = "belowright new" },
        find_opts = [[-type f -not -path '*/\.git/*' -not -name '*.o' -printf '%P\n']],
        rg_opts = "--color=never --files --hidden --follow -g '!.git' -g '!*.o'",
        fd_opts = "--color=never --type f --hidden --follow --exclude .git --exclude '*.o' --exclude '*.exe'",
      },
      oldfiles = {
        preview_opts = "hidden",
        winopts = { split = "belowright new" },
      },
      buffers = {
        -- preview_opts = "hidden",
        -- winopts = { split = "belowright new" },
      },
      colorschemes = {
        winopts = { split = "belowright new" },
      },
    },
    keys = {
      -- { "<leader>.", LazyVim.pick("files"), desc = "Find Files (Root Dir)" },
      { "<leader>/", "<cmd>FzfLua live_grep_native preview_opts=nohidden<cr>", desc = "Grep (Root Dir)" },
      { "<leader>.", "<cmd>FzfLua files<cr>", desc = "Find Files (Root Dir)" },
      { "<leader>*", "<cmd>FzfLua grep_cword preview_opts=nohidden<cr>", desc = "Find Current Word" },
      { "<leader>ff", fzf_file_browser_wrapper(_), desc = "File Browser" },
      { "<leader><space>", false, desc = "Find Current Word" },
    },
  },

  {
    "michel-garcia/fzf-lua-file-browser.nvim",
    opts = {
      hidden = true,
    },
    keys = {
      -- { "<leader>ff", "<cmd>FzfLua file_browser<cr>", desc = "File Browser" },
    },
  },
}
