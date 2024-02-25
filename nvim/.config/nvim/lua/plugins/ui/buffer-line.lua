return {
  {
    "akinsho/bufferline.nvim",
    version = "*",
    dependencies = "nvim-tree/nvim-web-devicons",
    config = function()
      local options = {
        indicator = { style = "icon", icon = "▎" },
        separator_style = { "", "" },
        buffer_close_icon = "x",
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

-- return {
-- 	'akinsho/bufferline.nvim',
-- 	version = "*",
-- 	dependencies = 'nvim-tree/nvim-web-devicons',
-- 	opts = {
-- 		options = {
-- 			mode = "tabs",
-- 			diagnostics = "nvim_lsp",
-- 			diagnostics_indicator = function(count, level, diagnostics_dict, context)
-- 				local icon = level:match("error") and " " or " "
-- 				return " " .. icon .. count
-- 			end,
-- 			indicator = {
-- 				icon = '▎', -- this should be omitted if indicator style is not 'icon'
-- 				-- style = 'icon' | 'underline' | 'none',
-- 				style = "icon",
-- 			},
-- 			show_buffer_close_icons = false,
-- 			show_close_icon = false,
-- 			enforce_regular_tabs = true,
-- 			show_duplicate_prefix = false,
-- 			tab_size = 16,
-- 			padding = 0,
-- 			separator_style = "thick",
-- 		}
-- 	}
-- }
