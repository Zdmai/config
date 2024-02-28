return {
  {
    "akinsho/bufferline.nvim",
    version = "*",
    priority = 1,
    dependencies = "nvim-tree/nvim-web-devicons",
    config = function()
      local options = {
        indicator = { style = "icon", icon = "▎" },
        number = "none",
        close_command = "bdelete! %d",
        right_mouse_command = "bdelete! %d",
        left_mouse_command = "buffer %d",
        backup = false,
        -- separator_style = { "", "" },
        buffer_close_icon = "",
        modified_icon = "●",
        close_icon = "X",
        left_trunc_marker = "",
        right_trunc_marker = "",
        max_name_length = 20,
        max_prefix_length = 15, -- prefix used when a buffer is de-duplicated
        tab_size = 22,
        show_buffer_close_icons = true,
        show_close_icon = true,
        always_show_bufferline = true,
        diagnostics = "nvim_lsp",
        diagnostics_indicator = function(count, level, diagnostics_dict, context)
          local icon = level:match("error") and " " or " "
          return " " .. icon .. count
        end,
        padding = 0,
      }

      require("bufferline").setup({ options = options })
    end,
  },
}
