syntax on

set expandtab       " Uses spaces instead of tabs
set tabstop=2       " Each tab is 2 spaces
set shiftwidth=2    " Sets the >> and << width
set autoindent
set nobackup        " remove backup files
set noswapfile      " remove swap files

set showcmd
set wildmenu        
set cursorline


set rtp+=/opt/homebrew/opt/fzf " allowed to use the fzf in vim


map ! :!

cnoremap W<CR> w<CR>
cnoremap Q<CR> q<CR>
cnoremap X<CR> x<CR>
cnoremap Sh<CR> sh<CR>
cnoremap sH<CR> sh<CR>
cnoremap SH<CR> sh<CR>

inoremap ii <esc>

noremap j  gj
noremap k  gk

map sl :set splitright<CR>:vsplit<CR>
map sh :set nosplitright<CR>:vsplit<CR>
map sk :set nosplitbelow<CR>:split<CR>
map sj :set splitbelow<CR>:split<CR>

map n nzz
map N Nzz

map sv <C-w>t<C-w>H<CR>
map sq <C-w>t<C-w>K<CR>

map tn :tabe<CR>
map tl :+tabnext<CR>
map th :-tabnex><CR>


map <C-k> <C-w>k
map <C-j> <C-w>j
map <C-l> <C-w>l
map <C-h> <C-w>h

""nnoremap   <silent>   <F7>    :FloatermNew<CR>
""tnoremap   <silent>   <F7>    <C-\><C-n>:FloatermNew<CR>
""nnoremap   <silent>   <F8>    :FloatermPrev<CR>
""tnoremap   <silent>   <F8>    <C-\><C-n>:FloatermPrev<CR>
""nnoremap   <silent>   <F9>    :FloatermNext<CR>
""tnoremap   <silent>   <F9>    <C-\><C-n>:FloatermNext<CR>
""nnoremap   <silent>   <F12>   :FloatermToggle<CR>
""tnoremap   <silent>   <F12>   <C-\><C-n>:FloatermToggle<CR>

set magic " 设置魔术
setlocal noswapfile " 不要生成swap文件
set bufhidden=hide " 当buffer被丢弃的时候隐藏它
set noerrorbells " 关闭错误信息响铃
set novisualbell " 关闭使用可视响铃代替呼叫
" colorscheme evening " 设定配色方案
set backupcopy=yes " 设置备份时的行为为覆盖
set autochdir " 自动切换当前目录为当前文件所在的目录
" nnoremap <space> @=((foldclosed(line('.')) < 0) ? 'zc' : 'zo')<CR> 
set rtp+=/opt/homebrew/opt/fzf
set noerrorbells 
set nocompatible
set noerrorbells visualbell t_vb=
set mouse-=a
set incsearch   "set relativenumber
set smartcase
set shortmess+=I
set encoding=utf-8
let &t_ut=' '
set tabstop=2
set shiftwidth=2
set laststatus=2
set statusline=\ %<%F[%1*%M%*%n%R%H]%=\ %y\ %0(%{&fileformat}\ %{&encoding}\ Ln\ %l,\ Col\ %c/%L%) " 设置在状态行显示的信息
set foldenable " 开始折叠
set foldmethod=syntax " 设置语法折叠
set foldcolumn=0 " 设置折叠区域的宽度
setlocal foldlevel=1 " 设置折叠层数为 1
set softtabstop=2
set backspace=indent,eol,start
au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif

set number

set ai
set hlsearch
set ruler
highlight Comment ctermfg=green


" Configuration example

" Set floaterm window's background to black
hi Floaterm guibg=black
" Set floating window border line color to cyan, and background to orange
hi FloatermBorder guibg=orange guifg=cyan


" ===
" === Goyo
" ===
map gy :Goyo<CR>

