return {
  'akinsho/toggleterm.nvim',
  version = "*",
  config = function()
    require("toggleterm").setup({
      start_in_insert = false,
      close_on_exit = true,
      open_mapping = [[<c-\>]],
      direction = "float",
      size = 30,
      hide_numbers = true,
      -- direction = "horizontal",
      shade_terminals = true,
      auto_scroll = false,
      persist_size = false,
      float_opts = {
        border = "curved",
        winblend = 0,
      }
    })
  end
  --     on_create = function(term)
  --       vim.bo[term.bufnr].filetype = "terminal"
  --       local win
  --       vim.api.nvim_create_autocmd("BufEnter", {
  --         buffer = term.bufnr,
  --         callback = function()
  --           win = vim.api.nvim_get_current_win()
  --         end,
  --       })
  --       vim.api.nvim_create_autocmd("TermClose", {
  --         buffer = term.bufnr,
  --         once = true,
  --         callback = function()
  --           -- when leaving, open another terminal buffer in the same window
  --           local terms = vim
  --               .iter(vim.api.nvim_list_bufs())
  --               :filter(function(buf)
  --                 return vim.bo[buf].buftype == "terminal" and buf ~= term.bufnr
  --               end)
  --               :totable()
  --
  --           local win_bufs = vim
  --               .iter(vim.api.nvim_list_wins())
  --               :map(vim.api.nvim_win_get_buf)
  --               :fold({}, function(acc, v)
  --                 acc[v] = v
  --                 return acc
  --               end)
  --
  --           local target
  --           for _, t in ipairs(terms) do
  --             -- fall back to the first term if no hidden terms are found
  --             target = target or t
  --             if win_bufs[t] == nil then
  --               target = t -- use the first hidden term if found
  --               break
  --             end
  --           end
  --
  --           if win and target and vim.api.nvim_buf_is_valid(target) then
  --             vim.api.nvim_win_set_buf(win, target)
  --             vim.api.nvim_create_autocmd("WinEnter", {
  --               once = true,
  --               callback = vim.schedule_wrap(function()
  --                 if win and vim.api.nvim_win_is_valid(win) then
  --                   vim.api.nvim_set_current_win(win)
  --                   win = nil
  --                 end
  --               end),
  --             })
  --           end
  --         end,
  --       })
  --     end,
  --   })
  -- end
}


-- local status_ok, toggleterm = pcall(require, "toggleterm")
-- if not status_ok then
-- 	return
-- end
--
-- toggleterm.setup({
-- 	size = 20,
-- 	open_mapping = [[<c-\>]],
-- 	hide_numbers = true,
-- 	shade_filetypes = {},
-- 	shade_terminals = true,
-- 	shading_factor = 2,
-- 	start_in_insert = true,
-- 	insert_mappings = true,
-- 	persist_size = true,
-- 	direction = "float",
-- 	close_on_exit = true,
-- 	shell = vim.o.shell,
-- 	float_opts = {
-- 		border = "curved",
-- 		winblend = 0,
-- 		highlights = {
-- 			border = "Normal",
-- 			background = "Normal",
-- 		},
-- 	},
-- })
--
-- function _G.set_terminal_keymaps()
--   local opts = {noremap = true}
--   vim.api.nvim_buf_set_keymap(0, 't', '<esc>', [[<C-\><C-n>]], opts)
--   vim.api.nvim_buf_set_keymap(0, 't', 'jk', [[<C-\><C-n>]], opts)
--   vim.api.nvim_buf_set_keymap(0, 't', '<C-h>', [[<C-\><C-n><C-W>h]], opts)
--   vim.api.nvim_buf_set_keymap(0, 't', '<C-j>', [[<C-\><C-n><C-W>j]], opts)
--   vim.api.nvim_buf_set_keymap(0, 't', '<C-k>', [[<C-\><C-n><C-W>k]], opts)
--   vim.api.nvim_buf_set_keymap(0, 't', '<C-l>', [[<C-\><C-n><C-W>l]], opts)
-- end
--
-- vim.cmd('autocmd! TermOpen term://* lua set_terminal_keymaps()')
--
-- local Terminal = require("toggleterm.terminal").Terminal
-- local lazygit = Terminal:new({ cmd = "lazygit", hidden = true })
--
-- function _LAZYGIT_TOGGLE()
-- 	lazygit:toggle()
-- end
--
-- local node = Terminal:new({ cmd = "node", hidden = true })
--
-- function _NODE_TOGGLE()
-- 	node:toggle()
-- end
--
-- local ncdu = Terminal:new({ cmd = "ncdu", hidden = true })
--
-- function _NCDU_TOGGLE()
-- 	ncdu:toggle()
-- end
--
-- local htop = Terminal:new({ cmd = "htop", hidden = true })
--
-- function _HTOP_TOGGLE()
-- 	htop:toggle()
-- end
--
-- local python = Terminal:new({ cmd = "python", hidden = true })
--
-- function _PYTHON_TOGGLE()
-- 	python:toggle()
-- end
