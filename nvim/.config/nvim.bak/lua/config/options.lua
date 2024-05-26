local cmd = vim.cmd
local opt = vim.opt
local g   = vim.g


cmd("set expandtab")
cmd("set tabstop=2")
cmd("set softtabstop=2")
cmd("set shiftwidth=2")
-- cmd("highlight Normal")

-- vim.cmd("set termguicolors")
vim.opt.completeopt = "menuone,noselect"


g.tex_flavor = "latex"

-- Fix markdown indentation settings
vim.g.markdown_recommended_style = 0

opt.listchars = 'tab:»·,nbsp:+,trail:·,extends:→,precedes:←'
opt.fillchars = {
  stl = ' ',
  stlnc = '-',
  msgsep = ' ',
  foldopen = '',
  foldclose = '',
  fold = ' ',
  foldsep = ' ',
  diff = '╱',
  eob = ' ',
}

-- disable netrw at the very start of your init.lua
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- LSP Server to use for Python.
-- Set to "basedpyright" to use basedpyright instead of pyright.
vim.g.lazyvim_python_lsp = "pyright"
-- vim.g.lazyvim_python_ruff = "ruff_lsp"


-- quick load the nvim
vim.loader.enable()

opt.clipboard = "unnamed"
opt.backup = false
opt.relativenumber = true
opt.fillchars = { eob = " " }
opt.number = true
opt.signcolumn = "yes"
opt.numberwidth = 2
opt.smartindent = true
-- opt.timeoutlen = 400
opt.undofile = true
opt.spell = false -- enable spell check
opt.spelllang    = { "en", "cjk" } -- set language: english and chinese
opt.spelloptions = "camel" -- Enable camel caseopt
opt.termguicolors = true -- True color support
-- opt.timeoutlen = 500 -- Set wait time

opt.signcolumn = "yes"
opt.showmode = false
-- opt.background = "dark"

vim.wo.number = true

-- vim.cmd("set colorcolumn=80")

if vim.fn.has("nvim-0.9.0") == 1 then
	opt.splitkeep = "screen"
	opt.shortmess:append({ C = true })
end


-- vim.api.nvim_create_autocmd({ 'BufRead', 'BufNewFile', 'FileType' }, {
--   pattern = { 'c', 'cpp', 'txt', 'c.snippets', 'cpp.snippets' },
--   callback = function()
--     vim.opt_local.tabstop = 4
--     vim.opt_local.shiftwidth = 4
--     vim.opt_local.softtabstop = 4
--   end,
-- })


vim.api.nvim_create_autocmd('BufReadPost', {
  callback = function()
    local pos = vim.fn.getpos("'\"")
    if pos[2] > 0 and pos[2] <= vim.fn.line('$') then
      vim.api.nvim_win_set_cursor(0, { pos[2], pos[3] - 1 })
    end
  end
})
