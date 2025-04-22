-- Show Macro Recording, reference: https://www.reddit.com/r/neovim/comments/xy0tu1/cmdheight0_recording_macros_message/
local lualine = require("lualine")
vim.api.nvim_create_autocmd("RecordingEnter", {
    callback = function()
        lualine.refresh({
            place = { "statusline" },
        })
    end,
})

vim.api.nvim_create_autocmd("RecordingLeave", {
    callback = function()
        -- This is going to seem really weird!
        -- Instead of just calling refresh we need to wait a moment because of the nature of
        -- `vim.fn.reg_recording`. If we tell lualine to refresh right now it actually will
        -- still show a recording occuring because `vim.fn.reg_recording` hasn't emptied yet.
        -- So what we need to do is wait a tiny amount of time (in this instance 50 ms) to
        -- ensure `vim.fn.reg_recording` is purged before asking lualine to refresh.
        local timer = vim.loop.new_timer()
        timer:start(
            50,
            0,
            vim.schedule_wrap(function()
                lualine.refresh({
                    place = { "statusline" },
                })
            end)
        )
    end,
})
local function show_macro_recording()
  local recording_register = vim.fn.reg_recording()
  if recording_register == "" then
    return ""
  else
    return "Recording @" .. recording_register
  end
end


return {
  {
    "nvim-lualine/lualine.nvim",
    opts = function()
      local lualine_require = require("lualine_require")
      lualine_require.require = require

      local icons = LazyVim.config.icons

      vim.o.laststatus = vim.g.lualine_laststatus

      local opts = {
        options = {
          theme = "auto",
          -- theme = "modus",
          -- globalstatus = vim.o.laststatus == 3,
          globalstatus = false,
          disabled_filetypes = { statusline = { "dashboard", "alpha", "ministarter" } },
          component_separators = "|",
          section_separators = { left = "", right = "" },
        },
        sections = {
          lualine_a = { "mode" },
          lualine_b = { "branch" },

          lualine_c = {
            -- LazyVim.lualine.root_dir(),
            -- { "filetype", icon_only = true, separator = "", padding = { left = 1, right = 0 } },
            -- { "filetype", icon_only = true, separator = "", padding = { left = 1, right = 0 } },
            -- { LazyVim.lualine.pretty_path() },
            { 'filename', path = 1 },
            {
              "macro-recording",
              fmt = show_macro_recording,
            },
          },
          lualine_x = {
            "%S",
            {
              "diagnostics",
              symbols = {
                error = icons.diagnostics.Error,
                warn = icons.diagnostics.Warn,
                info = icons.diagnostics.Info,
                hint = icons.diagnostics.Hint,
              },
            },
            -- -- stylua: ignore
            -- {
              --   function() return require("noice").api.status.command.get() end,
              --   cond = function() return package.loaded["noice"] and require("noice").api.status.command.has() end,
              --   color = function() return LazyVim.ui.fg("Statement") end,
              -- },
              -- -- stylua: ignore
              -- {
                --   function() return require("noice").api.status.mode.get() end,
                --   cond = function() return package.loaded["noice"] and require("noice").api.status.mode.has() end,
                --   color = function() return LazyVim.ui.fg("Constant") end,
                -- },
                -- stylua: ignore
                {
                  function() return "  " .. require("dap").status() end,
                  cond = function() return package.loaded["dap"] and require("dap").status() ~= "" end,
                  color = function() return LazyVim.ui.fg("Debug") end,
                },
                -- -- stylua: ignore
                -- {
                  --   require("lazy.status").updates,
                  --   cond = require("lazy.status").has_updates,
                  --   color = function() return LazyVim.ui.fg("Special") end,
                  -- },
                  {
                    "diff",
                    symbols = {
                      added = icons.git.added,
                      modified = icons.git.modified,
                      removed = icons.git.removed,
                    },
                    source = function()
                      local gitsigns = vim.b.gitsigns_status_dict
                      if gitsigns then
                        return {
                          added = gitsigns.added,
                          modified = gitsigns.changed,
                          removed = gitsigns.removed,
                        }
                      end
                    end,
                  },
                },
                lualine_y = { "filetype", "progress" },
                lualine_z = {
                  { "location" },
                },
              },
              extensions = { "neo-tree", "lazy" },
            }

            -- do not add trouble symbols if aerial is enabled
            -- And allow it to be overriden for some buffer types (see autocmds)
            -- if vim.g.trouble_lualine and LazyVim.has("trouble.nvim") then
            --   local trouble = require("trouble")
            --   local symbols = trouble.statusline({
              --     mode = "symbols",
              --     groups = {},
              --     title = false,
              --     filter = { range = true },
              --     format = "{kind_icon}{symbol.name:Normal}",
              --     hl_group = "lualine_c_normal",
              --   })
              --   table.insert(opts.sections.lualine_c, {
                --     symbols and symbols.get,
                --     cond = function()
                  --       return vim.b.trouble_lualine ~= false and symbols.has()
                  --     end,
                  --   })
                  -- end

                  return opts
                end,
              },
            }
