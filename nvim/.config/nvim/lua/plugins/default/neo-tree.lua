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
					vim.api.nvim_command("silent !open -g " .. path)
				end,
			},
		},
	},
	-- keys = {
	-- 	{
	-- 	  "<leader>fe",
	-- 	  function()
	-- 	    require("neo-tree.command").execute({ toggle = true, dir = Util.root() })
	-- 	  end,
	-- 	  desc = "Explorer NeoTree (root dir)",
	-- 	},
	-- 	{
	-- 	  "<leader>fE",
	-- 	  function()
	-- 	    require("neo-tree.command").execute({ toggle = true, dir = vim.loop.cwd() })
	-- 	  end,
	-- 	  desc = "Explorer NeoTree (cwd)",
	-- 	},
	-- 	{ "<leader>e", "<leader>fe", desc = "Explorer NeoTree (root dir)", remap = true },
	-- 	{ "<leader>E", "<leader>fE", desc = "Explorer NeoTree (cwd)", remap = true },
	-- 	{
	-- 		"<leader>ge",
	-- 		function()
	-- 			require("neo-tree.command").execute({ source = "git_status", toggle = true })
	-- 		end,
	-- 		desc = "Git explorer",
	-- 	},
	-- 	{
	-- 	  "<leader>be",
	-- 	  function()
	-- 	    require("neo-tree.command").execute({ source = "buffers", toggle = true })
	-- 	  end,
	-- 	  desc = "Buffer explorer",
	-- 	},
	-- },
	config = function()
		vim.keymap.set("n", "<C-n>", ":Neotree filesystem reveal left<CR>", {})
		vim.keymap.set("n", "<leader>bf", ":Neotree buffers reveal float<CR>", {})
	end,
}
