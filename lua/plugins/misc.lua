return {
  { "jdhao/better-escape.vim" },
  {
    "stevearc/oil.nvim",
    dependencies = { { "echasnovski/mini.icons" } },
    lazy = false,
    opts = {
      view_options = {
        -- Show files and directories that start with "."
        show_hidden = true,
      },
    },
    keys = {
      { "<leader>wd", "<cmd>Oil<cr>", desc = "Open Oil Files Viewer" },
    },
  },
  {
    "ThePrimeagen/harpoon",
    opts = {
      settings = {
        save_on_toggle = false,
      },
    },
  },
  {
    "folke/noice.nvim",
    lazy = false,
    opts = {
      views = {
        mini = {
          reverse = false,
          timeout = 5000,
        },
      },
      lsp = {
        signature = {
          auto_open = {
            enabled = false,
          },
        },
      },
      messages = {
        -- view_error = "messages",
        -- view_warn = "messages",
        -- view_error = "confirm",
        -- view_warn = "mini",
      },
    },
  },
  {
    "Darazaki/indent-o-matic",
  },
  {
    "akinsho/bufferline.nvim",
    keys = {
      { "<S-h>", false },
      { "<S-l>", false },
    },
  },
  {
    "justinmk/vim-sneak",
    priority = 1000,
    lazy = false,
    keys = {
      { "S", "<Plug>Sneak_S" },
      { "s", "<Plug>Sneak_s" },
    },
  },
  {
    "folke/lazy.nvim",
    checker = {
      enabled = false,
      notify = false,
    }
  },
  {
    "gaoDean/autolist.nvim",
    ft = {
      "markdown",
    },
    config = function()
      require("autolist").setup()
    end
  },
  {
    'echasnovski/mini.pairs',
    opts = {
      skip_unbalanced = false,
    }
  },
  {
    "folke/zen-mode.nvim",
    opts = {
      width = 80,
      backdrop = 1,
    },
    keys = {
      { "<leader>uz", "<cmd>ZenMode<cr>", desc = "Toggle Zen Mode" },
    }
  },
  {
    "mbbill/undotree",
    -- lazy = false,
    keys = {
      { "<leader>uu", "<cmd>UndotreeToggle<cr>", desc = "Toggle Undo Tree" },
    }
  },
  {
    'norcalli/nvim-colorizer.lua',
  },
  {
    'godlygeek/tabular',
  },
  {
    'Olical/conjure',
  },
  {
    'gpanders/nvim-parinfer',
  },
  {
    "hat0uma/csvview.nvim",
    opts = {
      parser = { comments = { "#", "//" } },
      keymaps = {
        -- Text objects for selecting fields
        textobject_field_inner = { "if", mode = { "o", "x" } },
        textobject_field_outer = { "af", mode = { "o", "x" } },
        -- Excel-like navigation:
        -- Use <Tab> and <S-Tab> to move horizontally between fields.
        -- Use <Enter> and <S-Enter> to move vertically between rows and place the cursor at the end of the field.
        -- Note: In terminals, you may need to enable CSI-u mode to use <S-Tab> and <S-Enter>.
        jump_next_field_end = { "<Tab>", mode = { "n", "v" } },
        jump_prev_field_end = { "<S-Tab>", mode = { "n", "v" } },
        jump_next_row = { "<Enter>", mode = { "n", "v" } },
        jump_prev_row = { "<S-Enter>", mode = { "n", "v" } },
      },
    },
    cmd = { "CsvViewEnable", "CsvViewDisable", "CsvViewToggle" },
  }
}
