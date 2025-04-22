return {
  {
    "sindrets/diffview.nvim",
    opts = {
      hooks = {
        diff_buf_read = function(_)
          -- Change local options in diff buffers
          vim.opt_local.wrap = false
        end,
      }
    }
  },
  {
    "tpope/vim-fugitive",
  },
  {
    "NeogitOrg/neogit",
    dependencies = {
      "nvim-lua/plenary.nvim",         -- required
      "sindrets/diffview.nvim",        -- optional - Diff integration

      -- Only one of these is needed.
      "ibhagwan/fzf-lua",              -- optional
    },
    config = true,
    keys = {
      { "<leader>gn", "<cmd>Neogit<cr>", desc = "Neogit" },
    },
  }
}
