" Not vi compatible.
" set nocompatible

" Turn on syntax highlighting.
" syntax on

" Disable the default Vim startup message.
set shortmess+=I

" Show line numbers.
" set number

" Display how far away each line is from the current one by default.
" set relativenumber

" Always show the status line at the bottom, even if you only have one window open.
set laststatus=2

" Make backspace key more powerful.
set backspace=indent,eol,start

" Allow  auto-hiding of edited buffers.
" set hidden

" Smart case-sensitive search.
set ignorecase
set smartcase

" Show line and column number
set ruler

" Use h,j,k,l instead of arrow keys.
nnoremap <Left>  :echoe "Use h"<CR>
nnoremap <Right> :echoe "Use l"<CR>
nnoremap <Up>    :echoe "Use k"<CR>
nnoremap <Down>  :echoe "Use j"<CR>
" ...and in insert mode
inoremap <Left>  <ESC>:echoe "Use h"<CR>
inoremap <Right> <ESC>:echoe "Use l"<CR>
inoremap <Up>    <ESC>:echoe "Use k"<CR>
inoremap <Down>  <ESC>:echoe "Use j"<CR>

" Convert all tabs that are typed into spaces.
set expandtab

" Tab indentation levels every four columns.
set tabstop=4
set softtabstop=4

" Indent/outdent by four columns.
set shiftwidth=4

" Copy indent from current line when starting a new line
set autoindent

" Show (partial) command in status line
set showcmd

" Turn on "detection", "plugin" and "indent" at once
filetype plugin indent on

" Enable filetype detection
" filetype on

" Sane text files
set fileformats=unix,mac,dos " Handle Mac and DOS line-endings but prefer Unix encodings.
set encoding=utf-8
set fileencoding=utf-8

" Show matching braces when text indicator is over them
set showmatch

" Incremental search (as string is being typed)
set incsearch

" Highlight search
set hlsearch

" Line break
set lbr

" Show lines above and below cursor (when possible)
set scrolloff=8

" Hide mode
set noshowmode

" Skip redrawing screen in some cases
set lazyredraw

" Makes things smoother, will probably be enabled by my terminal anyway.
set ttyfast

" No beeps
set noerrorbells visualbell t_vb=

" Don't use swapfile
set noswapfile

" Don't create annoying backup files
set nobackup

" Split vertical windows right to the current windows
set splitright

" Split horizontal windows below to the current windows
set splitbelow

" Turn on autoindenting of blocks
set smartindent

" Retain indentation on next line
set autoindent

" Show how many matches when searching with / or ?
set shortmess-=S

" Increment/decrement alphabetic characters
set nrformats+=alpha

" Set up undodir ~/.vim/undodir
set undodir=~/.vim/undodir
set undofile

" Visual selection highlight
:highlight Visual cterm=NONE ctermbg=0 ctermfg=NONE guibg=Grey40

" <esc><esc> redraws the screen and removes any search highlighting
nnoremap <esc><esc> :noh<return><esc>

" Plugins
let need_to_install_plugins = 0
if empty(glob('~/.vim/autoload/plug.vim'))
    silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
        \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    let need_to_install_plugins = 1
endif

call plug#begin()
Plug 'https://github.com/ycm-core/YouCompleteMe.git'
Plug 'morhetz/gruvbox'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'tpope/vim-sensible'
Plug 'itchyny/lightline.vim'
Plug 'ap/vim-buftabline'
Plug 'airblade/vim-gitgutter'
Plug 'jiangmiao/auto-pairs', { 'for': 'python' }
Plug 'dense-analysis/ale'
Plug 'majutsushi/tagbar'
Plug 'vim-scripts/indentpython.vim'
Plug 'alvan/vim-closetag'
Plug 'maxmellon/vim-jsx-pretty'
call plug#end()

if need_to_install_plugins == 1
    echo "Installing plugins..."
    silent! PlugInstall
    echo "Done!"
    q
endif

" Enable 256 colors
set t_Co=256

" Sane editing
set colorcolumn=80

" Auto-pairs
au FileType python let b:AutoPairs = AutoPairsDefine({"f'" : "'", "r'" : "'", "b'" : "'"})

" Indent/unindent with tab/shift-tab
nmap <Tab> >>
nmap <S-tab> <<
imap <S-Tab> <Esc><<i
vmap <Tab> >gv
vmap <S-Tab> <gv

" Enable mouse mode
set mouse=a

" color scheme
let g:gruvbox_contrast_dark = 'hard'
colorscheme gruvbox

" Set background
set background=dark

" Lightline
set noshowmode

" Code folding
set foldmethod=indent
set foldlevel=99

" No wrap
set nowrap

" Wrap toggle
setlocal nowrap

" YouCompleteMe settings
let g:ycm_collect_identifiers_from_comments_and_strings = 0
" Enter the first character to start completion @2018-07-19 Change to 1, otherwise a bunch of meaningless prompts will pop up when you move the cursor
let g:ycm_min_num_of_chars_for_completion=1
"It is forbidden to cache matches and regenerate matches every time
let g:ycm_cache_omnifunc=0
" Turn on semantic completion
let g:ycm_seed_identifiers_with_syntax=1
" Can also be completed in comment input
let g:ycm_complete_in_comments = 1
" Can be completed in string input
let g:ycm_complete_in_strings = 1
let g:ycm_autoclose_preview_window_after_completion = 1
let g:ycm_autoclose_preview_window_after_insertion = 1
" let g:ycm_filetype_whitelist = { 'python': 1 }
let g:ycm_python_binary_path = 'python3'
map <C-G>  :YcmCompleter GoToDefinitionElseDeclaration<CR>
"  fix .cpp error: ValueError: Still no compile flags, no completions yet.
let g:ycm_global_ycm_extra_conf = '~/.vim/plugged/YouCompleteMe/third_party/ycmd/cpp/ycm/.ycm_extra_conf.py'
" Vim's autocomplete is excruciatingly slow
" http://stackoverflow.com/questions/2169645/vims-autocomplete-is-excruciatingly-slow
set complete-=i

" Disable annoying message
let g:ycm_confirm_extra_conf = 0

" YCM key bindings
nnoremap <silent> <Leader>gd :YcmCompleter GoTo<CR>

" Ale Linting
let g:ale_sign_column_always=1
let g:ale_lint_on_enter=1
let g:ale_lint_on_text_changed='always'
let g:ale_echo_msg_error_str='E'
let g:ale_echo_msg_warning_str='W'
let g:ale_echo_msg_format='[%linter%] %s [%severity%]: [%...code...%]'
let g:ale_linters={'python': ['flake8','mypy']}
let g:ale_fixers={'python': ['black']}
let g:ale_fix_on_save = 1
let g:ale_python_auto_pipenv = 1

"http://stackoverflow.com/questions/20186975/vim-mac-how-to-copy-to-clipboard-without-pbcopy
set clipboard^=unnamed
set clipboard^=unnamedplus

" Leader is space
let mapleader=" "

" remove extra help information
let g:netrw_browse_split=2
let g:netrw_banner=0

" Move between windows
map <leader>h :wincmd h<CR>
map <leader>j :wincmd j<CR>
map <leader>k :wincmd k<CR>
map <leader>l :wincmd l<CR>

" Explorer window
nnoremap <leader>pv :wincmd v<bar> :wincmd h<bar> :Ex <bar> :vertical resize 30<CR>

" Act like D and C
nnoremap Y y$

" Search mappings: These will make it so that going to the next one in a
" " search will center on the line it's found in.
nnoremap n nzzzv
nnoremap N Nzzzv
