local cmd = vim.cmd

vim.opt.conceallevel = 2

vim.keymap.set({ "n", "i" }, "<a-f>", "<cmd>TexlabForward<cr>", { desc = "Forward search" })
vim.keymap.set({ "n", "i" }, "<a-b>", function()
  require("util.latex").format()
end, { desc = "Build" })

cmd([[
let g:tex_flavor='latex'
let g:vimtex_view_method='zathura'
let g:vimtex_quickfix_mode=0
set conceallevel=1
let g:tex_conceal='abdmg'
]])
