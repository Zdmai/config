local cmd = vim.cmd
local map = vim.keymap.set
local g   = vim.g

vim.opt.conceallevel = 2

map({ "n", "i" }, "<a-f>", "<cmd>TexlabForward<cr>", { desc = "Forward search" })
map({ "n", "i" }, "<a-b>",
  function()
    require("util.latex").format()
  end, { desc = "Build" })


cmd([[
let g:vimtex_quickfix_mode=0
set conceallevel=1
let g:tex_conceal='abdmg'
let g:vimtex_view_method = 'sioyek'
let g:tex_flavor = 'latex'
]])
-- let g:vimtex_view_zathura_options = '-reuse-instance'
-- let g:vimtex_view_general_viewer = 'zathura'
-- let g:tex_flavor='latex'
-- let g:vimtex_compiler_progname='nvr'

