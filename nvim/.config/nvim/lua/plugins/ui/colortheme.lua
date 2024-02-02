return {
  {
    "catppuccin/nvim",
    lazy = false,
    name = "catppuccin",
    priority = 1000,
    config = function()
      require("catppuccin").setup({
        contrast = "hard",
        transparent_background = true,
      })
      -- vim.cmd.colorscheme("catppuccin")
      -- set the visual mode select color
      vim.api.nvim_set_hl(0, "visual", { reverse = true })
    end,
  },
  {
    "ellisonleao/gruvbox.nvim",
    lazy = false,  -- make sure we load this during startup if it is your main colorscheme
    priority = 1000, -- make sure to load this before all the other start plugins
    config = function()
      require("gruvbox").setup({
        contrast = "hard",
        transparent_mode = true,
      })
      -- vim.cmd.colorscheme("gruvbox")
      vim.api.nvim_set_hl(0, "visual", { reverse = true })
    end,
  },
  {
    "EdenEast/nightfox.nvim",
    config = function()
      -- Default options
      require("nightfox").setup({
        options = {
          -- Compiled file's destination location
          compile_file_suffix = "_compiled", -- Compiled file suffix
          transparent = true,          -- Disable setting background
          terminal_colors = true,       -- Set terminal colors (vim.g.terminal_color_*) used in `:terminal`
          dim_inactive = false,         -- Non focused panes set to alternative background
          module_default = true,        -- Default enable value for modules
          colorblind = {
            enable = true,             -- Enable colorblind support
            simulate_only = false,      -- Only show simulated colorblind colors and not diff shifted
            severity = {
              protan = 0,               -- Severity [0,1] for protan (red)
              deutan = 0,               -- Severity [0,1] for deutan (green)
              tritan = 0,               -- Severity [0,1] for tritan (blue)
            },
          },
          styles = {     -- Style to be applied to different syntax groups
            comments = "italic", -- Value is any valid attr-list value `:help attr-list`
            -- conditionals = "NONE",
            -- constants = "NONE",
            -- functions = "NONE",
            keywords = "bold",
            -- numbers = "normal",
            -- operators = "NONE",
            -- strings = "NONE",
            types = "italic,bold",
            -- variables = "NONE",
          },
          inverse = { -- Inverse highlight for different types
            match_paren = false,
            visual = false,
            search = false,
          },
        },
      })

      -- setup must be called before loading
      vim.cmd.colorscheme("nightfox")
      vim.api.nvim_set_hl(0, "visual", { reverse = true })
    end,
  },
  {
    "lukas-reineke/indent-blankline.nvim",
    main = "ibl",
    config = function()
      require("ibl").setup()
      -- local highlight = {
      -- 	"RainbowRed",
      -- 	"RainbowYellow",
      -- 	"RainbowBlue",
      -- 	"RainbowOrange",
      -- 	"RainbowGreen",
      -- 	"RainbowViolet",
      -- 	"RainbowCyan",
      -- }

      -- local hooks = require("ibl.hooks")
      -- -- create the highlight groups in the highlight setup hook, so they are reset
      -- -- every time the colorscheme changes
      -- hooks.register(hooks.type.HIGHLIGHT_SETUP, function()
      -- 	vim.api.nvim_set_hl(0, "RainbowRed", { fg = "#E06C75" })
      -- 	vim.api.nvim_set_hl(0, "RainbowYellow", { fg = "#E5C07B" })
      -- 	vim.api.nvim_set_hl(0, "RainbowBlue", { fg = "#61AFEF" })
      -- 	vim.api.nvim_set_hl(0, "RainbowOrange", { fg = "#D19A66" })
      -- 	vim.api.nvim_set_hl(0, "RainbowGreen", { fg = "#98C379" })
      -- 	vim.api.nvim_set_hl(0, "RainbowViolet", { fg = "#C678DD" })
      -- 	vim.api.nvim_set_hl(0, "RainbowCyan", { fg = "#56B6C2" })
      -- end)

      -- require("ibl").setup({ indent = { highlight = highlight } })
    end,
  },
  {
    "akinsho/bufferline.nvim",
    version = "*",
    dependencies = "nvim-tree/nvim-web-devicons",
    config = function()
      local options = {
        indicator = { style = "icon", icon = "▎" },
        separator_style = { "", "" },
        buffer_close_icon = "",
        modified_icon = "●",
        close_icon = "x",
        left_trunc_marker = "",
        right_trunc_marker = "",
        max_name_length = 20,
        max_prefix_length = 15, -- prefix used when a buffer is de-duplicated
        tab_size = 22,
        show_buffer_close_icons = false,
        show_close_icon = false,
        always_show_bufferline = true,
      }

      require("bufferline").setup({ options = options })
    end,
  },
}
