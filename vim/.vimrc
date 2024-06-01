" syntax on
syntax enable
set background=dark
colorscheme DarkModeReloaded

" the diffience between the map use :help map-modes
inoremap jk <esc>
vnoremap jk <esc>

map ! :!


noremap j  gj
noremap k  gk

" map sl :set splitright<CR>:vsplit<CR>
" map sh :set nosplitright<CR>:vsplit<CR>
" map sk :set nosplitbelow<CR>:split<CR>
" map sj :set splitbelow<CR>:split<CR>

" let the searched string display in the middle of the window
map n nzz
map N Nzz

map sv <C-w>t<C-w>H<CR>
map sq <C-w>t<C-w>K<CR>

" move between the diffient tab
" map tn :tabe<CR>
map t- :-tabnext<CR>
map t= :+tabnext<CR>

map <leader>e :Ex<CR>
let g:netrw_browse_split=2

" move focus
function! TmuxYabaiOrSplitSwitch(wincmd, direction)
  let previous_winnr = winnr()
  silent! execute "wincmd " . a:wincmd
  if previous_winnr == winnr()
    call system("tmux-yabai.sh " . a:direction)
  endif
endfunction

nnoremap <silent> <C-h> :call TmuxYabaiOrSplitSwitch('h', 'west')<cr>
nnoremap <silent> <C-j> :call TmuxYabaiOrSplitSwitch('j', 'south')<cr>
nnoremap <silent> <C-k> :call TmuxYabaiOrSplitSwitch('k', 'north')<cr>
nnoremap <silent> <C-l> :call TmuxYabaiOrSplitSwitch('l', 'east')<cr>


"------------------------------------------------------------------"


" set the leaderkey
let mapleader=' '

" set expandtab       " Uses spaces instead of tabs
set tabstop=2       " Each tab is 2 spaces
set softtabstop=2
set shiftwidth=2    " Sets the >> and << width
set autoindent

set nobackup        " remove backup files
set backupcopy=yes " 设置备份时的行为为覆盖

set noswapfile      " remove swap files
setlocal noswapfile " keeeeep away from swap file

set showcmd
set wildmenu        
set cursorline


" set rtp+=/opt/homebrew/opt/fzf " allowed to use the fzf in vim


set magic " set the magic
set bufhidden=hide " 当buffer被丢弃的时候隐藏它
set noerrorbells " 关闭错误信息响铃
set novisualbell " 关闭使用可视响铃代替呼叫
" colorscheme evening " 设定配色方案
" set autochdir " 自动切换当前目录为当前文件所在的目录
" nnoremap <space> @=((foldclosed(line('.')) < 0) ? 'zc' : 'zo')<CR> 
set noerrorbells 
set nocompatible
set noerrorbells visualbell t_vb=
set mouse+=a
set incsearch   "set relativenumber
set smartcase
set shortmess+=I
set encoding=utf-8
let &t_ut=' '
set shiftwidth=2
set laststatus=2
set statusline=\ %<%F[%1*%M%*%n%R%H]%=\ %y\ %0(%{&fileformat}\ %{&encoding}\ Ln\ %l,\ Col\ %c/%L%) " 设置在状态行显示的信息


" set foldenable " 开始折叠
" set foldmethod=syntax " 设置语法折叠
" set foldcolumn=0 " 设置折叠区域的宽度
" setlocal foldlevel=1 " 设置折叠层数为 1
set backspace=indent,eol,start		" backspace
au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif


set clipboard=unnamed " pipe the clipboard with the unname register
set scrolloff=4       " display more contents

" Configuration example


" Set floaterm window's background to black
hi Floaterm guibg=black
" Set floating window border line color to cyan, and background to orange
hi FloatermBorder guibg=orange guifg=cyan


"------------------------------------------------------------------"


"----------------------------Goerge Hotz's config--------------------------"
set number

set ai
set hlsearch
set ruler
highlight Comment ctermfg=green
"----------------------------Goerge Hotz's config--------------------------"



"--------------------------Plugin------------------------"

call plug#begin('~/.vim/plugged')
" The default plugin directory will be as follows:
"   - Vim (Linux/macOS): '~/.vim/plugged'
"   - Vim (Windows): '~/vimfiles/plugged'
"   - Neovim (Linux/macOS/Windows): stdpath('data') . '/plugged'
" You can specify a custom plugin directory by passing it as the argument
"   - e.g. `call plug#begin('~/.vim/plugged')`
"   - Avoid using standard Vim directory names like 'plugin'

" Make sure you use single quotes

" Any valid git URL is allowed
Plug 'https://github.com/junegunn/vim-github-dashboard.git'

" Plugin outside ~/.vim/plugged with post-update hook
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }


Plug 'davidhalter/jedi-vim'

Plug 'benjaminjamesxyz/darkmodereloaded'

" deoplete 

" Initialize plugin system
" - Automatically executes `filetype plugin indent on` and `syntax enable`.
call plug#end()
" You can revert the settings after the call like so:
"   filetype indent off   " Disable file-type-specific indentation

"-------------------plugin configure--------------------"

" deoplete config
" let g:deoplete#enable_at_startup = 1
" :help deoplete-options

" fzf config

noremap <leader><leader> :FZF<CR>

" jedi config 
" *:help jedi-vim* to see the doc
"


let g:jedi#completions_command = "<C-N>"
let g:jedi#goto_command = '<leader>d'

let g:jedi#goto_assignments_command = '<leader>g'
let g:jedi#goto_stubs_command = '<leader>s'
let g:jedi#goto_definitions_command = ''
let g:jedi#documentation_command = 'K'
let g:jedi#usages_command = '<leader>n'
let g:jedi#rename_command = '<leader>r'
let g:jedi#rename_command_keep_name = '<leader>R'


"-------------------plugin configure--------------------"

