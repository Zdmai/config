return {
	{
		"nvim-telescope/telescope-ui-select.nvim",
    lazy = true,
	},
	{
		"nvim-telescope/telescope.nvim",
		tag = "0.1.5",
		dependencies = { "nvim-lua/plenary.nvim" },
		config = function()
			selection_caret = " "
			require("telescope").setup({
				extensions = {
					["ui-select"] = {
						require("telescope.themes").get_dropdown({}),
					},
				},
			})
			-- local builtin = require("telescope.builtin")
			-- vim.keymap.set("n", "<C-p>", builtin.find_files, {})
			-- vim.keymap.set("n", "<leader>fg", builtin.live_grep, {})

			require("telescope").load_extension("ui-select")
		end,
    keys = {
        { "<C-p>", ":Telescope find_files<CR>", desc = "find file", silent = true, noremap = true },
        { "<leader>fg", ":Telescope live_grep<CR>", desc = "live grep", silent = true, noremap = true },
        -- { "<leader>te", ":Telescope env<CR>", desc = "environment variables", silent = true, noremap = true },
        { "<leader>fb", ":Telescope buffers<CR>", desc = "buffer", silent = true, noremap = true },
        -- { "<leader>te", ":Telescope env<CR>", desc = "environment variables", silent = true, noremap = true },
        -- { "<leader>te", ":Telescope env<CR>", desc = "environment variables", silent = true, noremap = true },
    },
	},
}
