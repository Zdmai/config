local map = vim.keymap.set

-- map('n', '<leader>h', ':nohlsearch<CR>')

if vim.fn.has("nvim-0.9.0") == 1 then
	vim.opt.splitkeep = "screen"
	vim.opt.shortmess:append({ C = true })
end

-- This file is automatically loaded by init.lua

local util = require("util")

map({ "i", "v" }, "ii", "<ESC>", {})

-- Paste over currently selected text without yanking it
map("v", "p", '"_dP', {silent = true})

-- better movement
map("n", "j", "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })
map("n", "k", "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
-- map({ "n", "v", "o" }, "H", "^", { desc = "Use 'H' as '^'" })
-- map({ "n", "v", "o" }, "L", "$", { desc = "Use 'L' as '$'" })

-- move Lines
-- map("n", "<A-j>", "<cmd>m .+1<cr>==", { desc = "Move down" })
-- map("n", "<A-k>", "<cmd>m .-2<cr>==", { desc = "Move up" })
-- map("i", "<A-j>", "<esc><cmd>m .+1<cr>==gi", { desc = "Move down" })
-- map("i", "<A-k>", "<esc><cmd>m .-2<cr>==gi", { desc = "Move up" })
-- map("v", "<A-j>", ":m '>+1<cr>gv=gv", { desc = "Move down" })
-- map("v", "<A-k>", ":m '<-2<cr>gv=gv", { desc = "Move up" })

-- move to window using the <ctrl> hjkl keys
-- map("n", "<C-h>", "<C-w>h", { desc = "Go to left window" })
-- map("n", "<C-j>", "<C-w>j", { desc = "Go to lower window" })
-- map("n", "<C-k>", "<C-w>k", { desc = "Go to upper window" })
-- map("n", "<C-l>", "<C-w>l", { desc = "Go to right window" })

vim.cmd([[
function! TmuxYabaiOrSplitSwitch(wincmd, direction)
  let previous_winnr = winnr()
  silent! execute "wincmd " . a:wincmd
  if previous_winnr == winnr()
    call system("tmux-yabai.sh " . a:direction)
  endif
endfunction

nnoremap <C-h> :call TmuxYabaiOrSplitSwitch('h', 'west')<cr>
nnoremap <C-j> :call TmuxYabaiOrSplitSwitch('j', 'south')<cr>
nnoremap <C-k> :call TmuxYabaiOrSplitSwitch('k', 'north')<cr>
nnoremap <C-l> :call TmuxYabaiOrSplitSwitch('l', 'east')<cr>
]])

-- windows resize and split
map("n", "<Up>", "<cmd>resize +2<cr>", { desc = "Increase window height" })
map("n", "<Down>", "<cmd>resize -2<cr>", { desc = "Decrease window height" })
map("n", "<Left>", "<cmd>vertical resize -2<cr>", { desc = "Decrease window width" })
map("n", "<Right>", "<cmd>vertical resize +2<cr>", { desc = "Increase window width" })
map("n", "<leader>-", "<C-W>s", { desc = "Split window below" })
map("n", "<leader>|", "<C-W>v", { desc = "Split window right" })

-- 

-- buffers
-- ===
-- map({ "n" }, "H", "<cmd>BufferLineCyclePrev<cr>", { desc = "Prev buffer" })
-- map({ "n" }, "L", "<cmd>BufferLineCycleNext<cr>", { desc = "Next buffer" })
map("n", "<leader>k", "<cmd>BufferLineCyclePrev<cr>", { desc = "Prev buffer" })
map("n", "<leader>j", "<cmd>BufferLineCycleNext<cr>", { desc = "Next buffer" })

-- ===
-- Delete window in `mini.bufremove`
map("n", "<leader>D", "<C-W>c", { desc = "Delete window" })

-- search
map({ "i", "n" }, "<esc>", "<cmd>noh<cr><esc>", { desc = "Escape and clear hlsearch" })
-- map({ "n", "x" }, "gw", "*N", { desc = "Search word under cursor" })

-- https://github.com/mhinz/vim-galore#saner-behavior-of-n-and-n
map("n", "n", "'Nn'[v:searchforward]", { expr = true, desc = "Next search result" })
map("x", "n", "'Nn'[v:searchforward]", { expr = true, desc = "Next search result" })
map("o", "n", "'Nn'[v:searchforward]", { expr = true, desc = "Next search result" })
map("n", "N", "'nN'[v:searchforward]", { expr = true, desc = "Prev search result" })
map("x", "N", "'nN'[v:searchforward]", { expr = true, desc = "Prev search result" })
map("o", "N", "'nN'[v:searchforward]", { expr = true, desc = "Prev search result" })

-- add undo break-points
map("i", ",", ",<c-g>u")
map("i", ".", ".<c-g>u")
map("i", ";", ";<c-g>u")

-- better indenting
map("v", "<", "<gv")
map("v", ">", ">gv")
map("n", "<", "v<g")
map("n", ">", "v>g")

-- toggle options
-- ===
-- map("n", "<leader>uf", require("lazyvim.plugins.lsp.format").toggle, { desc = "Toggle format on Save" })
-- ===
-- map("n", "<leader>us", function() util.toggle("spell") end, { desc = "Toggle Spelling" })
-- map("n", "<leader>uw", function() util.toggle("wrap") end, { desc = "Toggle Word Wrap" })
-- map("n", "<leader>ud", util.toggle_diagnostics, { desc = "Toggle Diagnostics" })
-- local conceallevel = vim.o.conceallevel > 0 and vim.o.conceallevel or 3
-- map("n", "<leader>uc", function() util.toggle("conceallevel", false, {0, conceallevel}) end, { desc = "Toggle Conceal" })

-- Others
map("n", "<leader>l", "<cmd>:Lazy<cr>", { desc = "Lazy" })

