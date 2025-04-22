return {
  {
    "folke/trouble.nvim",
    opts = {
      defaults = {
        focus = true,
      },
      focus = true,
      win = {
        size = 0.4,
      },
      modes = {
        lsp = {
          win = { position = "bottom" },
        },
        lsp_base = {
          auto_refresh = false, -- auto refresh when open
          params = {
            include_current = true,
          },
        },
        symbols = {
          focus = true,
        },
      },
    },
    keys = {
      { "<leader>xq", "<cmd>Trouble qflist toggle<cr>", desc = "Quickfix List (Trouble)" },
      { "<leader>xc", "<cmd>Trouble qflist toggle<cr>", desc = "Quickfix List (Trouble)" },
    }
  },
}
