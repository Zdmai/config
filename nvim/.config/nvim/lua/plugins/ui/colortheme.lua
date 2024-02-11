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
}
