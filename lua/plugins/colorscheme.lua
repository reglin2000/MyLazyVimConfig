return {
  {
    "AlexvZyl/nordic.nvim",
    lazy = false,
    priority = 1000,
    opts = {
      swap_backgrounds = true,
      italic_comments = false,
      on_highlight = function(highlights, palette)
        highlights.Comment = {
          fg = "#8493a9",
        }
        highlights.PmenuSel = {
          bg = palette.gray3,
        }
        highlights.Visual = {
          bg = palette.gray3,
        }
        highlights.LspInlayHint = {
          link = "Comment",
        }
        highlights.LineNr = {
          fg = palette.gray5,
        }
        highlights["@parameter"] = {
          italic = false,
          fg = "#eceff4",
        }
        highlights.Delimiter = {
          italic = false
        }
      end,
    },
  },
  {
    "sainnhe/gruvbox-material",
    lazy = false,
    priority = 1000,
  },
  {
    "oxfist/night-owl.nvim",
    lazy = true, -- make sure we load this during startup if it is your main colorscheme
    priority = 1000, -- make sure to load this before all the other start plugins
    config = function()
      -- load the colorscheme here
      require("night-owl").setup({
        italics = false,
        custom_highlights = function(palette)
          return {
            Type = { fg = palette.fg },
            Identifier = { fg = palette.fg },
            Function = { fg = palette.fg },
            Operator = { fg = palette.fg },
            LineNr = { fg = palette.gray5 },
            Comment = { fg = "#ccbd70", bg = "NONE" },
            ["@type"] = { fg = palette.fg },
            ["@lsp.type.parameter"] = { fg = "#fbfbfb", bg = "NONE" },
          }
        end
      })
    end,
  },
  {
    'Mofiqul/vscode.nvim',
    priority = 1000,
  },
  {
    "miikanissi/modus-themes.nvim",
    priority = 1000,
    opts = {
      -- variant = "deuteranopia", -- Theme comes in four variants `default`, `tinted`, `deuteranopia`, and `tritanopia`
      variant = "tinted", -- Theme comes in four variants `default`, `tinted`, `deuteranopia`, and `tritanopia`
      styles = {
        -- Style to be applied to different syntax groups
        -- Value is any valid attr-list value for `:help nvim_set_hl`
        -- comments = { italic = false, fg = "#d8af7a" },
        comments = { italic = false },
        keywords = { italic = false },
        -- functions = { fg="#ffffff" },
        -- variables = { fg="#ffffff" },
      },
      on_highlights = function(highlights, colors)
        highlights["htmlBold"] = {bold = true}
        highlights["htmlItalic"] = {italic = true}
        highlights["LineNr"].bg = colors.bg
        highlights["LineNrAbove"].bg = colors.bg
        highlights["LineNrBelow"].bg = colors.bg
        highlights["Type"].fg = colors.fg
        highlights["Identifier"].fg = colors.fg
        highlights["Function"].fg = colors.fg
      end,
    },
  },
  {
    'p00f/alabaster.nvim',
    priority = 1000,
  },
  {
    'Yazeed1s/minimal.nvim',
    -- Optionally install Lush. Allows for more configuration or extending the colorscheme
    -- If you don't want to install lush, make sure to set g:zenbones_compat = 1
    -- In Vim, compat mode is turned on as Lush only works in Neovim.
    lazy = false,
    priority = 1000,
  },
  -- {
  --   'echasnovski/mini.base16',
  --   lazy = false,
  --   priority = 1000,
  --   opts = {
  --     palette = { -- tomorrow-night
  --       base00 = '#1d1f21', base01 = '#282a2e', base02 = '#373b41', base03 = '#969896',
  --       base04 = '#b4b7b4', base05 = '#c5c8c6', base06 = '#e0e0e0', base07 = '#ffffff',
  --       base08 = '#cc6666', base09 = '#de935f', base0A = '#f0c674', base0B = '#b5bd68',
  --       base0C = '#8abeb7', base0D = '#81a2be', base0E = '#b294bb', base0F = '#a3685a'
  --     }
  --     -- palette = { -- modus
  --     --   base00 = "#0d0e1c", base01 = "#1b1e2c", base02 = "#4a4f69", base03 = "#d3aa92",
  --     --   base04 = "#c6daff", base05 = "#ffffff", base06 = "#ffffff", base07 = "#ffffff",
  --     --   base08 = "#ff5f59", base09 = "#ff9f80", base0A = "#fec43f", base0B = "#00c06f",
  --     --   base0C = "#00d3d0", base0D = "#79a8ff", base0E = "#f78fe7", base0F = "#d2b580",
  --     -- },
  --     -- palette = { -- night-owl
  --     --   base00 = "#011627", base01 = "#011627", base02 = "#1d3b53", base03 = "#758a8a",
  --     --   base04 = "#8ba1c6", base05 = "#d6deeb", base06 = "#ffffff", base07 = "#817e7e",
  --     --   base08 = "#ef5350", base09 = "#f78c6c", base0A = "#c792ea", base0B = "#22da6e",
  --     --   base0C = "#addb67", base0D = "#82aaff", base0E = "#7fdbca", base0F = "#21c7a8",
  --     -- }
  --   },
  -- },
  {
    'aktersnurra/no-clown-fiesta.nvim',
    priority = 1000,
    opts = {
      -- comments = {fg = "#999999"}
      styles = {
        -- comments = {fg = "#8c8c8c"},
        comments = {fg = "#ccb18f"},
        type = { fg = "#cc8fbe", bold = false},
      }
    }
  },
  {
    'mellow-theme/mellow.nvim',
    priority = 1000,
  },
  {
    'marko-cerovac/material.nvim',
    priority = 1000,
  },
  {
    "gmr458/cold.nvim",
    priority = 1000
  },
  {
    "neanias/everforest-nvim",
    priority = 1000,
    config = function()
      require("everforest").setup({
        on_highlights = function(hl, palette)
          hl.Comment = { fg = palette.grey2 }
        end,
      })
    end,
  },
  {
    "phha/zenburn.nvim",
    priority = 1000,
  },
  -- {
  --   'echasnovski/mini.hues',
  --   version = false,
  --   priority = 1000,
  --   opts = {
  --     background = '#222222',
  --     foreground = '#e6d9b8',
  --     n_hues = 4,
  --     saturation = 'lowmedium'
  --   }
  -- },
  {
    "wtfox/jellybeans.nvim",
    priority = 1000,
  },
  {
    'loctvl842/monokai-pro.nvim',
    priority = 1000,
    opts = {
      styles = {
        comment = { italic = false },
        keyword = { italic = false }, -- any other keyword
        type = { italic = false }, -- (preferred) int, long, char, etc
        storageclass = { italic = false }, -- static, register, volatile, etc
        structure = { italic = false }, -- struct, union, enum, etc
        parameter = { italic = false }, -- parameter pass in function
        annotation = { italic = false },
        tag_attribute = { italic = false }, -- attribute of tag in reactjs 
      },
      override = function()
        return {
          Comment = { fg = "#a6a2a6" }
        }
      end
    }
  },
  {
    'nuvic/flexoki-nvim',
    priority = 1000,
  },
  {
    'navarasu/onedark.nvim',
    priority = 1000,
  },
  {
    "catppuccin/nvim",
    priority = 1000,
    lazy = false,
    opts = {
      styles = {
        comments = {},
        conditionals = {},
      },
      color_overrides = {
        frappe = {
          -- Night Owl
          -- rosewater = "#f2d5cf", flamingo = "#eebebe", pink = "#f4b8e4", mauve = "#c792ea", red = "#ff5874", maroon = "#78ccf0", peach = "#f78c6c", yellow = "#ffd602", green = "#c5e478", teal = "#6ae9f0", sky = "#7fdbca", sapphire = "#caece6", blue = "#82aaff", lavender = "#5ca7e4", text = "#d6deeb", subtext1 = "#b5bfe2", subtext0 = "#a5adce", overlay2 = "#949cbb", overlay1 = "#838ba7", overlay0 = "#737994", surface2 = "#626880", surface1 = "#51576d", surface0 = "#414559", base = "#021727", mantle = "#292c3c", crust = "#232634",

          -- Night Owl (generated by ChatGPT)
          -- rosewater = '#f78c6c', flamingo = '#ff6f7b', pink = '#f4b8e4', mauve = '#c792ea', red = '#ff6363', maroon = '#f1a7a4', peach = '#ecc48d', yellow = '#ffd602', green = '#c5e478', teal = '#80cbc4', sky = '#78ccf0', sapphire = '#82aaff', blue = '#5ca7e4', lavender = '#6ae9f0', text = '#d6deeb', base = '#021727',

          -- Night Owl (generated by ChatGPT API)
          base = "#021727", mantle = "#092135", crust = "#010d18", text = "#d6deeb", subtext1 = "#c5e4fc", subtext0 = "#4b6479", mauve = "#c792ea", blue = "#82aaff", cyan = "#62d0ce", green = "#9ccc65", yellow = "#ffeb95", peach = "#f0b567", red = "#ef5350", rosewater = "#eea890", teal = "#6bbdbf", sky = "#699dbf", lavender = "#5ca7e4", sapphire = "#6ae9f0", flamingo = "#eebebe", pink = "#f4b8e4", maroon = "#d77379", parameter = "#fbfbfb", comment = "#ccbd70",
          -- Modus (generated by ChatGPT API)
          -- base = "#000000", mantle = "#1e1e1e", crust = "#0f0f0f", text = "#ffffff", subtext1 = "#c6daff", subtext0 = "#989898", overlay2 = "#C4C4C4", overlay1 = "#646464", overlay0 = "#bfc0c4", surface2 = "#303030", surface1 = "#282828", surface0 = "#545454", mauve = "#feacd0", blue = "#2fafff", cyan = "#00d3d0", green = "#44bc44", yellow = "#d0bc00", peach = "#fec43f", red = "#ff5f59", maroon = "#db7b5f", rosewater = "#ff7f9f", teal = "#6ae4b9", sky = "#79a8ff", lavender = "#caa6df", flamingo = "#ff9580", pink = "#f78fe7", sapphire = "#9099d9",
        },
      },
      custom_highlights = function(colors)
        return {
          Type = { fg = colors.text },
          Identifier = { fg = colors.text },
          Function = { fg = colors.text },
          Operator = { fg = colors.text },
          LineNr = { fg = colors.subtext0 },
          Comment = { fg = colors.comment },
          ["@type.builtin"] = { fg = colors.text },
          ["@parameter"] = { fg = colors.parameter },
          ["@property"] = { fg = colors.sapphire }, -- Class properties.
        }
      end,
      -- custom_highlights = function(colors) -- Night Owl Generated by ChatGPT
      --   return {
      --     -- Add any per-syntax customizations here (optional)
      --     LineNr = { fg = colors.subtext0 }, -- Line numbers
      --     CursorLineNr = { fg = colors.subtext1, style = { "bold" } }, -- Current line
      --     Comment = { fg = colors.cyan, style = { "italic" } }, -- Comments
      --     Keyword = { fg = colors.mauve, style = { "bold" } }, -- Keywords
      --     Function = { fg = colors.blue, style = { "italic" } }, -- Functions
      --     Error = { fg = colors.red, style = { "bold", "italic" } }, -- Errors
      --     Operator = { fg = colors.mauve },
      --     ["@property"] = { fg = colors.teal },
      --   }
      -- end,
      -- custom_highlights = function(colors) -- Modus
      --   return {
      --     LineNr = { fg = colors.subtext0 }, -- Line numbers (dimmed).
      --     CursorLineNr = { fg = colors.subtext1, style = { "bold" } }, -- Current line number.
      --     Comment = { fg = colors.cyan, style = { "italic" } }, -- Comments.
      --     Keyword = { fg = colors.mauve, style = { "bold" } }, -- Keywords (e.g., `if`, `else`).
      --     Function = { fg = colors.blue, style = { "italic" } }, -- Functions and methods.
      --     String = { fg = colors.peach }, -- Strings and characters.
      --     Constant = { fg = colors.yellow }, -- Constants and numbers.
      --     Operator = { fg = colors.mauve }, -- Operators (arithmetic, logical).
      --     ["@property"] = { fg = colors.teal }, -- Class properties.
      --     ["@type"] = { fg = colors.sky }, -- Types (e.g., `int`, `float`).
      --     ["@tag"] = { fg = colors.lavender }, -- Tags and annotations.
      --     Error = { fg = colors.red, style = { "bold", "italic" } }, -- Errors.
      --   }
      -- end,
    }
  },
  {
    "dgox16/oldworld.nvim",
    lazy = false,
    priority = 1000,
  },
  {
    "oonamo/ef-themes.nvim",
    lazy = false,
    priority = 1000,
  },
  {
    "LazyVim/LazyVim",
    opts = {
      -- colorscheme = "nordic",
      -- colorscheme = "alabaster",
      -- colorscheme = "night-owl",
      -- colorscheme = "mellow",
      colorscheme = "modus",
      -- colorscheme = "catppuccin-frappe",
      -- colorscheme = "zenburn",
      -- colorscheme = "no-clown-fiesta",
    },
  },
}
