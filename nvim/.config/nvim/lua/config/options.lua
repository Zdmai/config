local cmd = vim.cmd
local opt = vim.opt
local g   = vim.g


cmd("set expandtab")
cmd("set tabstop=2")
cmd("set softtabstop=2")
cmd("set shiftwidth=2")

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

opt.clipboard = "unnamed"
opt.backup = false
opt.relativenumber = true
opt.smartindent = true
opt.fillchars = { eob = " " }
opt.number = true
opt.numberwidth = 2
opt.signcolumn = "yes"
-- opt.timeoutlen = 400
opt.undofile = true
opt.spell = true -- enable spell check
opt.spelllang    = { "en", "cjk" } -- set language: english and chinese
opt.spelloptions = "camel" -- Enable camel caseopt
opt.termguicolors = true -- True color support
-- opt.timeoutlen = 500 -- Set wait time


vim.wo.number = true

-- vim.cmd("set colorcolumn=80")

if vim.fn.has("nvim-0.9.0") == 1 then
	opt.splitkeep = "screen"
	opt.shortmess:append({ C = true })
end


vim.api.nvim_create_autocmd({ 'BufRead', 'BufNewFile', 'FileType' }, {
  pattern = { 'c', 'cpp', 'txt', 'c.snippets', 'cpp.snippets' },
  callback = function()
    vim.opt_local.tabstop = 4
    vim.opt_local.shiftwidth = 4
    vim.opt_local.softtabstop = 4
  end,
})

vim.api.nvim_create_autocmd('BufReadPost', {
  callback = function()
    local pos = vim.fn.getpos("'\"")
    if pos[2] > 0 and pos[2] <= vim.fn.line('$') then
      vim.api.nvim_win_set_cursor(0, { pos[2], pos[3] - 1 })
    end
  end
})

vim.api.nvim_create_autocmd('TextYankPost', {
  callback = function()
    vim.highlight.on_yank({ higroup = 'Visual', timeout = 200 })
  end
})
