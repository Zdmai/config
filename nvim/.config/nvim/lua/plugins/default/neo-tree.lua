return {
  "nvim-neo-tree/neo-tree.nvim",
  branch = "v3.x",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-tree/nvim-web-devicons",
    "MunifTanjim/nui.nvim",
  },
  opts = {
    filesystem = {
      -- hijack_netrw_behavior = "open_default",
      -- bind_to_cwd = false,
      filtered_items = {
        always_show = { ".github", ".gitignore" },
        hide_dotfiles = false,
        hide_gitignored = false,
        hide_by_name = {
          ".git",
          -- "node_modules",
        },
        never_show = {
          ".DS_Store",
          "thumbs.db",
        },
      },
      window = {
        mappings = {
          ["o"] = "system_open",
        },
      },
      commands = {
        system_open = function(state)
          local node = state.tree:get_node()
          local path = node:get_id()
          -- vim.api.nvim_command("silent !open -g " .. path)
          -- macOs: open file in default application in the background.
          vim.fn.jobstart({ "open", "-g", path }, { detach = true })
          -- Linux: open file in default application
          -- vim.fn.jobstart({ "xdg-open", path }, { detach = true })
        end,
      },
    },
  },
  keys = {
    {
      "<leader>e",
      function()
        require("neo-tree.command").execute({
          toggle = true,
          source = "filesystem",
          position = "left",
        })
      end,
      desc = "filesystem (root dir)",
    },
    {
      "<leader>ge",
      function()
        require("neo-tree.command").execute({ source = "git_status", toggle = true })
      end,
      desc = "Git explorer",
    },
    {
      "<leader>bf",
      function()
        require("neo-tree.command").execute({ source = "buffers", toggle = true, position = "float" })
      end,
      desc = "Buffer explorer",
    },
  },
  event_handlers = {

    { -- Auto Close on Open File
      event = "file_opened",
      handler = function(file_path)
        -- auto close
        -- vimc.cmd("Neotree close")
        -- OR
        require("neo-tree.command").execute({ action = "close" })
      end
    },
    { -- Clear Search after Opening File
      event = "file_opened",
      handler = function(file_path)
        require("neo-tree.sources.filesystem").reset_search(state)
      end
    },
    {
      event = "neo_tree_buffer_enter",
      handler = function()
        vim.cmd("highlight! Cursor blend=100")
      end,
    },
    {
      event = "neo_tree_buffer_leave",
      handler = function()
        vim.cmd("highlight! Cursor guibg=#5f87af blend=0")
      end,
    },
  }
}
