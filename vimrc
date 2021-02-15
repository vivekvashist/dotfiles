" Not vi compatible.
set nocompatible

" Turn on syntax highlighting.
syntax on

" Disable the default Vim startup message.
set shortmess+=I

" Show line numbers.
set number

" Display how far away each line is from the current one by default.
set relativenumber

" Always show the status line at the bottom, even if you only have one window open.
set laststatus=2

" Make backspace key more powerful.
set backspace=indent,eol,start

" Allow  auto-hiding of edited buffers.
set hidden

" Smart case-sensitive search.
set ignorecase
set smartcase

" Enable mouse mode.
set mouse+=a

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
filetype on

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
set scrolloff=5

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

" Visual selection highlight
:highlight Visual cterm=NONE ctermbg=0 ctermfg=NONE guibg=Grey40

" <Ctrl-l> redraws the screen and removes any search highlighting
nnoremap <silent> <C-l> :nohl<CR><C-l>

" Plugins
let need_to_install_plugins = 0
if empty(glob('~/.vim/autoload/plug.vim'))
    silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
        \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    let need_to_install_plugins = 1
endif

call plug#begin()
Plug 'tpope/vim-sensible'
Plug 'itchyny/lightline.vim'
Plug 'ap/vim-buftabline'
Plug 'airblade/vim-gitgutter'
Plug 'preservim/nerdtree'
Plug 'jistr/vim-nerdtree-tabs'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'jiangmiao/auto-pairs', { 'for': 'python' }
Plug 'dense-analysis/ale'
Plug 'majutsushi/tagbar'
Plug 'vim-scripts/indentpython.vim'
Plug 'lepture/vim-jinja'
Plug 'pangloss/vim-javascript'
Plug 'alvan/vim-closetag'
Plug 'maxmellon/vim-jsx-pretty'
Plug 'https://github.com/ycm-core/YouCompleteMe.git'
Plug 'morhetz/gruvbox'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
call plug#end()

if need_to_install_plugins == 1
    echo "Installing plugins..."
    silent! PlugInstall
    echo "Done!"
    q
endif

" Enable 256 colors
set t_Co=256

" Sane text files
set fileformat=unix
set encoding=utf-8
set fileencoding=utf-8

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
colorscheme gruvbox
" colorscheme dracula

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
noremap <silent> <Leader>w :call ToggleWrap()<CR>
function ToggleWrap()
    if &wrap
        echo "Wrap OFF"
        setlocal nowrap
        set virtualedit=all
        silent! nunmap <buffer> <Up>
        silent! nunmap <buffer> <Down>
        silent! nunmap <buffer> <Home>
        silent! nunmap <buffer> <End>
        silent! iunmap <buffer> <Up>
        silent! iunmap <buffer> <Down>
        silent! iunmap <buffer> <Home>
        silent! iunmap <buffer> <End>
    else
        echo "Wrap ON"
        setlocal wrap linebreak nolist
        set virtualedit=
        setlocal display+=lastline
        noremap  <buffer> <silent> <Up>   gk
        noremap  <buffer> <silent> <Down> gj
        noremap  <buffer> <silent> <Home> g<Home>
        noremap  <buffer> <silent> <End>  g<End>
        inoremap <buffer> <silent> <Up>   <C-o>gk
        inoremap <buffer> <silent> <Down> <C-o>gj
        inoremap <buffer> <silent> <Home> <C-o>g<Home>
        inoremap <buffer> <silent> <End>  <C-o>g<End>
    endif
endfunction

" File browser
let NERDTreeIgnore = ['\.pyc$', '__pycache__']
let NERDTreeMinimalUI = 1
let g:nerdtree_open = 0
map <leader>n :call NERDTreeToggle()<CR>
function NERDTreeToggle()
    NERDTreeTabsToggle
    if g:nerdtree_open == 1
        let g:nerdtree_open = 0
    else
        let g:nerdtree_open = 1
        wincmd p
    endif
endfunction

function! StartUp()
    if 0 == argc()
        NERDTree
    end
endfunction
autocmd VimEnter * call StartUp()

" Ale
map <C-e> <Plug>(ale_next_wrap)
map <C-r> <Plug>(ale_previous_wrap)

" Tags
map <leader>t :TagbarToggle<CR>

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
