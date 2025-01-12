return {
  "goolord/alpha-nvim",
  dependencies = {
    { "nvim-tree/nvim-web-devicons", lazy = true }
  },

  config = function()
    local alpha = require("alpha")
    local dashboard = require("alpha.themes.startify")

    dashboard.section.header.val = {
      [[                                                                       ]],
      [[                                                                       ]],
      [[                                                                       ]],
      [[                                                                       ]],
      [[                                                                     ]],
      [[       ████ ██████           █████      ██                     ]],
      [[      ███████████             █████                             ]],
      [[      █████████ ███████████████████ ███   ███████████   ]],
      [[     █████████  ███    █████████████ █████ ██████████████   ]],
      [[    █████████ ██████████ █████████ █████ █████ ████ █████   ]],
      [[  ███████████ ███    ███ █████████ █████ █████ ████ █████  ]],
      [[ ██████  █████████████████████ ████ █████ █████ ████ ██████ ]],
      [[                                                                       ]],
      [[                                                                       ]],
      [[                                                                       ]],
    }

    -- dashboard.section.buttons.val = {
    --   dashboard.button("f", "  Find file", ":Telescope find_files <CR>"),
    --   dashboard.button("e", "  New file", ":ene <BAR> startinsert <CR>"),
    --   dashboard.button("p", "  Find project", ":Telescope projects <CR>"),
    --   dashboard.button("r", "  Recently used files", ":Telescope oldfiles <CR>"),
    --   dashboard.button("t", "󱎸  Find text", ":Telescope live_grep <CR>"),
    --   dashboard.button("c", "  Configuration", ":e $MYVIMRC <CR>"),
    --   dashboard.button("q", "  Quit Neovim", ":qa<CR>"),
    -- }

    alpha.setup(dashboard.opts)

  end,
}

