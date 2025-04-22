return {
  {
    "mfussenegger/nvim-dap",
    keys = {
      { "<leader>d", "", desc = "+debug", mode = {"n", "v"} },
      { "<F4>", "<cmd>make<cr>", desc = "Make file"},
      -- { "<F5>", function()if (vim.system({'make'}):wait().code == 0) then require'dap'.continue() else error("build fail!") end end, desc = "Continue" },
      { "<F5>", function() require'dap'.continue() end, desc = "Continue" },
      { "<F6>", function() require("dap").step_into() end, desc = "Step Into" },
      { "<F7>", function() require("dap").step_over() end, desc = "Step Over" },
      { "<F8>", function() require("dap").step_out() end, desc = "Step Out" },
      { "<F9>", function() require("dap").run_last() end, desc = "Run Last" },
      { "<F10>", function() require("dap").terminate() end, desc = "Terminate" },
    }
  },
  {
    "rcarriga/nvim-dap-ui",
    opts = {
      mappings = {
        -- Use a table to apply multiple mappings
        expand = { "<CR>", "<2-LeftMouse>", "l" },
        open = "o",
        remove = "d",
        edit = "e",
        repl = "r",
        toggle = "t",
      },
      element_mappings = {
        -- Example:
        stacks = {
          open = { "<CR>", "<2-LeftMouse>" },
          expand = "o",
        }
      },
      layouts = {
        {
          elements = {
            -- Elements can be strings or table with id and size keys.
            { id = "scopes", size = 0.6 },
            { id = "stacks", size = 0.2 },
            { id = "breakpoints", size = 0.1 },
            { id = "watches", size = 0.1 },
            -- "watches",
          },
          size = 40, -- 40 columns
          position = "left",
        },
        {
          elements = {
            "repl",
            "console",
          },
          size = 0.3, -- 10% of total lines
          position = "bottom",
        },
      },
    },
    keys = {
      { "<F11>", function() require'dapui'.toggle() end, desc = "Terminate" },
    }
  },
}
