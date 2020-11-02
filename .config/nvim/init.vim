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
set tabstop=4
set shiftwidth=2
set softtabstop=2
set autoindent
set list
"set listchars=tab:\|\ ,trail:▫
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
set enc=utf-8
set fenc=utf-8
set fencs=utf-8,ucs-bom,gb18030,gbk,gb2312,cp936
set relativenumber
set pyxversion=3
set updatetime=100
set virtualedit=block
set pastetoggle=<F2>



silent !mkdir -p ~/.config/nvim/tmp/backup
silent !mkdir -p ~/.config/nvim/tmp/undo
"silent !mkdir -p ~/.config/nvim/tmp/sessions
set backupdir=~/.config/nvim/tmp/backup,.
set directory=~/.config/nvim/tmp/backup,.
if has('persistent_undo')
	set undofile
	set undodir=~/.config/nvim/tmp/undo,.
endif


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
nnoremap bn :bn<cr>
nnoremap bp :bp<cr>
nnoremap bc :bdelete<cr>

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
noremap <F5> :call CompileRunGcc()<CR>
func CompileRunGcc()
	exec "w"
	if &filetype == 'c'
		:AsyncRun -cwd=$(VIM_FILEDIR) -mode=4 "$(VIM_FILEDIR)/$(VIM_FILENOEXT)"
	elseif &filetype == 'cpp'
		:AsyncRun -cwd=$(VIM_FILEDIR) -mode=4 "$(VIM_FILEDIR)/$(VIM_FILENOEXT)"
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



" Compile function
"noremap <F4> :call CompileRun()<CR>
"function CompileRun()
"  :AsyncRun gcc -Wall -O2 "$(VIM_FILEPATH)" -o "$(VIM_FILEDIR)/$(VIM_FILENOEXT)"
"  :AsyncRun -raw -cwd=$(VIM_FILEDIR) "$(VIM_FILEDIR)/$(VIM_FILENOEXT)" <cr>
"
"endfunction


"===
"===AsyncRun
"===
" automatically open quickfix window when AsyncRun command is executed
"set the quickfix window 6 lines height.
let g:asyncrun_open = 6

" ring the bell to notify you job finished
let g:asyncrun_bell = 1

" F10 to toggle quickfix window
nnoremap <F10> :call asyncrun#quickfix_toggle(6)<cr>
let g:asyncrun_rootmarks = ['.svn', '.git', '.root', '_darcs', 'build.xml'] 

nnoremap <silent> <F9> :AsyncRun gcc -Wall -O2 "$(VIM_FILEPATH)" -o "$(VIM_FILEDIR)/$(VIM_FILENOEXT)" <cr>
nnoremap <silent> <F7> :AsyncRun -cwd=<root> make <cr>
nnoremap <silent> <F8> :AsyncRun -cwd=<root> -raw make run <cr>
nnoremap <silent> <F6> :AsyncRun -cwd=<root> -raw make test <cr>
"nnoremap <silent> <F5> :AsyncRun -cwd=$(VIM_FILEDIR) -mode=4 "$(VIM_FILEDIR)/$(VIM_FILENOEXT)" <cr>
nnoremap <silent> <F8> :AsyncRun -cwd=<root> -mode=4 make run <cr>
nnoremap <silent> <F4> :AsyncRun -cwd=<root> cmake . <cr>

"F4：使用 cmake 生成 Makefile
"F5：单文件：运行
"F6：项目：测试
"F7：项目：编译
"F8：项目：运行
"F9：单文件：编译
"F10：打开/关闭底部的 quickfix 窗口



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

"asyncrun
Plug 'skywind3000/asynctasks.vim'
Plug 'skywind3000/asyncrun.vim'

"leaderF
Plug 'Yggdroot/LeaderF', { 'do': './install.sh' }

"easymotion 快速跳转
Plug 'easymotion/vim-easymotion'

"commentary 快速注释
Plug ' tpope / vim-commentary '

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

Plug 'Raimondi/delimitMate'

"" NERDTree
"Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }
"Plug 'Xuyuanp/nerdtree-git-plugin'

"
"" Git
"Plug ' tpope / vim-fugitive '
"Plug 'theniceboy/vim-gitignore', { 'for': ['gitignore', 'vim-plug'] }
"Plug 'fszymanski/fzf-gitignore', { 'do': ':UpdateRemotePlugins' }
""Plug 'mhinz/vim-signify'
Plug 'airblade/vim-gitgutter'
"Plug 'cohama/agit.vim'


" Autoformat
Plug 'Chiel92/vim-autoformat'


" Python
Plug 'Vimjas/vim-python-pep8-indent', { 'for' :['python', 'vim-plug'] }
Plug 'numirias/semshi', { 'do': ':UpdateRemotePlugins', 'for' :['python', 'vim-plug'] }
Plug 'tweekmonster/braceless.vim', { 'for' :['python', 'vim-plug'] }



Plug 'tpope/vim-surround' " type yskw' to wrap the word with '' or type cs'` to change 'word' to `word`



call plug#end()




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
"===coc.nvim
"===
let g:coc_global_extensions=[
			\'coc-json',
			\'coc-marketplace',
			\'coc-vimlsp',
			\'coc-python',
			\'coc-translator',
			\'coc-syntax',
			\'coc-explorer']


" Use tab for trigger completion with characters ahead and navigate.
" " NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" " other plugin before putting this into your config.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
	  let col = col('.') - 1
		  return !col || getline('.')[col - 1]  =~# '\s'
		endfunction

" Use <c-o> to trigger completion.
inoremap <silent><expr> <c-o> coc#refresh()

" Use `[g` and `]g` to navigate diagnostics
" " Use `:CocDiagnostics` to get all diagnostics of current buffer in location list.
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)]

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use <space>+h to show documentation in preview window.
nnoremap <silent> <space>p :call <SID>show_documentation()<CR>
function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  elseif (coc#rpc#ready())
    call CocActionAsync('doHover')
  else
    execute '!' . &keywordprg . " " . expand('<cword>')
  endif
endfunction

" Applying codeAction to the selected region.
" Example: `<leader>aap` for current paragraph
" Remap for do codeAction of selected region
function! s:cocActionsOpenFromSelected(type) abort
  execute 'CocCommand actions.open ' . a:type
endfunction
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)

nmap tt :CocCommand explorer<CR>

nmap ts <Plug>(coc-translator-p)

"CocCommand
nnoremap <c-c> :CocCommand<CR>



"===
"=== eleline.vim
"===
let g:airline_powerline_fonts = 0

" ===
" === AutoFormat
" ===
nnoremap \f :Autoformat<CR>
let g:formatdef_custom_js = '"js-beautify -t"'
let g:formatters_javascript = ['custom_js']
au BufWrite *.js :Autoformat


"===
"===git
"===
nmap ]h <Plug>(GitGutterNextHunk)
nmap [h <Plug>(GitGutterPrevHunk)]


"===
"=== vim-easymotion
"===
let g:EasyMotion_do_mapping = 0
let g:EasyMotion_do_shade = 0
let g:EasyMotion_smartcase = 1 
