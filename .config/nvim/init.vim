
"===
"===system
"===

let mapleader=" "

syntax on

set number
set relativenumber
set cursorline
set hidden
set noexpandtab
set tabstop=2
set shiftwidth=2
set softtabstop=2
set autoindent
set list
set listchars=tab:\|\ ,trail:▫
set scrolloff=4
set ttimeoutlen=0
set notimeout
set viewoptions=cursor,folds,slash,unix
set wrap
set tw=0
set indentexpr=
set foldmethod=indent
set foldlevel=99
set foldenable
set formatoptions-=tc
set splitright
set splitbelow
set noshowmode
set showcmd
set wildmenu
set ignorecase
set smartcase
set shortmess+=c
set inccommand=split
set completeopt=longest,noinsert,menuone,noselect,preview
set ttyfast "should make scrolling faster
set lazyredraw "same as above
set visualbell
set encoding=utf-8
set relativenumber
set pyxversion=3





silent !mkdir -p ~/.config/nvim/tmp/backup
silent !mkdir -p ~/.config/nvim/tmp/undo
silent !mkdir -p ~/.config/nvim/tmp/sessions
set backupdir=~/.config/nvim/tmp/backup,.
set directory=~/.config/nvim/tmp/backup,.
if has('persistent_undo')
	set undofile
	set undodir=~/.config/nvim/tmp/undo,.
endif

set updatetime=100
set virtualedit=block

set pastetoggle=<F10>


filetype on
filetype indent on
filetype plugin on
filetype plugin indent on
set mouse=a
set encoding=utf-8
let &t_ut=''
let &t_SI = "\<Esc>]50;CursorShape=1\x7"
let &t_SR = "\<Esc>]50;CursorShape=2\x7"
let &t_EI = "\<Esc>]50;CursorShape=0\x7"
set laststatus=2
au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal!g'\"" | endif



"open vimrc anywhere
map <LEADER>rc :e ~/.config/nvim/init.vim<CR>

"===
"===按键设置
"===


"  会递归的映射
map S :w<CR>  
map R :source $MYVIMRC<CR>
map sl :set splitright<CR>:vsplit<CR>
map sh :set nosplitright<CR>:vsplit<CR>
map sk :set nosplitbelow<CR>:split<CR>
map sj :set splitbelow<CR>:split<CR>

map <LEADER>k <C-w>k
map <LEADER>j <C-w>j
map <LEADER>h <C-w>h
map <LEADER>l <C-w>l
map <LEADER><up> :res +5<CR>
map <LEADER><down> :res -5<CR>
map <LEADER><left> :vertical resize-5<CR>
map <LEADER><right> :vertical resize+5<CR>
map tk :tabe<CR>
map th :-tabnext<CR>
map tl :+tabnext<CR>


"  不会递归的映射
noremap K 5k
noremap J 5j
noremap H 6h
noremap L 6l
noremap Q :q<CR>
noremap <C-q> :qa<CR>
noremap <LEADER><CR> :nohlsearch<CR>
noremap <C-h> ^
noremap <C-l> $
inoremap jk <Esc>

"狠人模式"
inoremap <Up> <Nop>
nnoremap <Up> <Nop>
inoremap <Down> <Nop>       
nnoremap <Down> <Nop>    
inoremap <Left> <Nop>  
nnoremap <Left> <Nop>    
inoremap <Right> <Nop>    
nnoremap <Right> <Nop>    
vmap ;y : !/mnt/c/Windows/System32/clip.exe<cr>u''
" Compile function
noremap r :call CompileRunGcc()<CR>
func! CompileRunGcc()
	exec "w"
	if &filetype == 'c'
		exec "!g++ % -o %<"
		exec "!time ./%<"
	elseif &filetype == 'cpp'
		set splitbelow
		exec "!g++ -std=c++11 % -Wall -o %<"
		:sp
		:res -15
		:term ./%<
	elseif &filetype == 'java'
		exec "!javac %"
		exec "!time java %<"
	elseif &filetype == 'sh'
		:!time bash %
	elseif &filetype == 'python'
		set splitbelow
		:sp
		:term python3 %
	elseif &filetype == 'html'
		silent! exec "!".g:mkdp_browser." % &"
	elseif &filetype == 'markdown'
		exec "InstantMarkdownPreview"
	elseif &filetype == 'tex'
		silent! exec "VimtexStop"
		silent! exec "VimtexCompile"
	elseif &filetype == 'dart'
		exec "CocCommand flutter.run -d ".g:flutter_default_device
		silent! exec "CocCommand flutter.dev.openDevLog"
	elseif &filetype == 'javascript'
		set splitbelow
		:sp
		:term export DEBUG="INFO,ERROR,WARNING"; node --trace-warnings .
	elseif &filetype == 'go'
		set splitbelow
		:sp
		:term go run .
	endif
endfunc


"===========
"====插件
"===========

"===
"===plug
"===

call plug#begin('~/.config/nvim/plugged')


" Pretty Dress
Plug 'bling/vim-bufferline'
Plug 'bpietravalle/vim-bolt'
Plug 'theniceboy/vim-deus'
Plug 'connorholyday/vim-snazzy'
Plug 'vim-airline/vim-airline'


" 语法高亮
Plug 'sheerun/vim-polyglot'


" 语法检查
Plug 'scrooloose/syntastic'

" 文件查找

"coc

Plug 'neoclide/coc.nvim', {'branch': 'release'}

"" General Highlighter
"Plug 'RRethy/vim-hexokinase', { 'do': 'make hexokinase' }
"Plug 'RRethy/vim-illuminate'
"
"" Markdown
"Plug 'suan/vim-instant-markdown', {'for': 'markdown'}
"Plug 'dhruvasagar/vim-table-mode', { 'on': 'TableModeToggle', 'for': ['text', 'markdown', 'vim-plug'] }
"Plug 'mzlogin/vim-markdown-toc', { 'for': ['gitignore', 'markdown', 'vim-plug'] }
""Plug 'dkarter/bullets.vim'
"
"fzf
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'


Plug 'Raimondi/delimitMate'

" NERDTree
Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }


"
"" Git
"Plug 'theniceboy/vim-gitignore', { 'for': ['gitignore', 'vim-plug'] }
"Plug 'fszymanski/fzf-gitignore', { 'do': ':UpdateRemotePlugins' }
""Plug 'mhinz/vim-signify'
"Plug 'airblade/vim-gitgutter'
"Plug 'cohama/agit.vim'
"


" Python
" Plug 'tmhedberg/SimpylFold', { 'for' :['python', 'vim-plug'] }
Plug 'Vimjas/vim-python-pep8-indent', { 'for' :['python', 'vim-plug'] }
Plug 'numirias/semshi', { 'do': ':UpdateRemotePlugins', 'for' :['python', 'vim-plug'] }
"Plug 'vim-scripts/indentpython.vim', { 'for' :['python', 'vim-plug'] }
"Plug 'plytophogy/vim-virtualenv', { 'for' :['python', 'vim-plug'] }
Plug 'tweekmonster/braceless.vim', { 'for' :['python', 'vim-plug'] }

"" Taglist
"Plug 'liuchengxu/vista.vim'
"
"" File navigation
"Plug 'Xuyuanp/nerdtree-git-plugin'
"Plug 'junegunn/fzf.vim'
"Plug 'Yggdroot/LeaderF', { 'do': './install.sh' }
"Plug 'kevinhwang91/rnvimr'
"Plug 'airblade/vim-rooter'
""Plug 'pechorin/any-jump.vim'


Plug 'tpope/vim-surround' " type yskw' to wrap the word with '' or type cs'` to change 'word' to `word`



call plug#end()


"source $HOME/.config/nvim/plugged/coc.vim




" ===
" === Dress up my vim
" ===
set termguicolors " enable true colors support
let $NVIM_TUI_ENABLE_TRUE_COLOR=1
"set background=dark
"let ayucolor="mirage"
"let g:oceanic_next_terminal_bold = 1
"let g:oceanic_next_terminal_italic = 1
"let g:one_allow_italics = 1

"color dracula
"color one
"color deus
 color snazzy
"let ayucolor="light"
"color ayu
"color xcodelighthc
"set background=light
"set cursorcolumn

hi NonText ctermfg=gray guifg=grey10
"hi SpecialKey ctermfg=blue guifg=grey70


"===
"===NERDTree
"===
map tt :NERDTreeToggle<CR>

" ==
" == NERDTree-git
" ==
let g:NERDTreeIndicatorMapCustom = {
    \ "Modified"  : "✹",
    \ "Staged"    : "✚",
    \ "Untracked" : "✭",
    \ "Renamed"   : "➜",
    \ "Unmerged"  : "═",
    \ "Deleted"   : "✖",
    \ "Dirty"     : "✗",
    \ "Clean"     : "✔︎",
    \ "Unknown"   : "?"
    \ }

"===
"===delimitMate
"===

"let delimitMate_expand_cr = 1

