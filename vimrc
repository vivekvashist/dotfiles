" Not vi compatible.
set nocompatible

" Turn on syntax highlighting.
syntax on

" Disable the default Vim startup message.
set shortmess+=I

" Show line numbers.
set number
set numberwidth=5

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

" No beeps.
set noerrorbells visualbell t_vb=

" enable mouse mode.
set mouse+=a

" show line and column number
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

" copy indent from current line when starting a new line
set autoindent

" show (partial) command in status line
set showcmd

" turn on "detection", "plugin" and "indent" at once
filetype plugin indent on

" enable filetype detection
filetype on

" sane text files
set fileformat=unix
set encoding=utf-8
set fileencoding=utf-8

" show matching braces when text indicator is over them
set showmatch

" incremental search (as string is being typed)
set incsearch

" highlight search
set hls

" line break
set lbr

" show lines above and below cursor (when possible)
set scrolloff=5

" hide mode
set noshowmode

" skip redrawing screen in some cases
set lazyredraw

" disable audible bell
set noerrorbells visualbell t_vb=

" makes things smoother, will probably be enabled by my terminal anyway.
set ttyfast

" no beeps
set noerrorbells

" don't use swapfile
set noswapfile

" don't create annoying backup files
set nobackup

" Split vertical windows right to the current windows
set splitright

" Split horizontal windows below to the current windows
set splitbelow

" Visual selection highlight
:highlight Visual cterm=NONE ctermbg=0 ctermfg=NONE guibg=Grey40

" <Ctrl-l> redraws the screen and removes any search highlighting
nnoremap <silent> <C-l> :nohl<CR><C-l>

" plugins
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
call plug#end()

if need_to_install_plugins == 1
    echo "Installing plugins..."
    silent! PlugInstall
    echo "Done!"
    q
endif

" enable 256 colors
set t_Co=256

" sane text files
set fileformat=unix
set encoding=utf-8
set fileencoding=utf-8

" sane editing
set colorcolumn=80

" auto-pairs
au FileType python let b:AutoPairs = AutoPairsDefine({"f'" : "'", "r'" : "'", "b'" : "'"})

" indent/unindent with tab/shift-tab
nmap <Tab> >>
nmap <S-tab> <<
imap <S-Tab> <Esc><<i
vmap <Tab> >gv
vmap <S-Tab> <gv

" mouse
set mouse=a
let g:is_mouse_enabled = 1
noremap <silent> <Leader>m :call ToggleMouse()<CR>
function ToggleMouse()
    if g:is_mouse_enabled == 1
        echo "Mouse OFF"
        set mouse=
        let g:is_mouse_enabled = 0
    else
        echo "Mouse ON"
        set mouse=a
        let g:is_mouse_enabled = 1
    endif
endfunction

" color scheme
colorscheme gruvbox

" Set background
set background=dark

" lightline
set noshowmode

" code folding
set foldmethod=indent
set foldlevel=99

" wrap toggle
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

" file browser
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

" ale
map <C-e> <Plug>(ale_next_wrap)
map <C-r> <Plug>(ale_previous_wrap)

" tags
map <leader>t :TagbarToggle<CR>

" disable autoindent when pasting text
" source: https://coderwall.com/p/if9mda/automatically-set-paste-mode-in-vim-when-pasting-in-insert-mode
let &t_SI .= "\<Esc>[?2004h"
let &t_EI .= "\<Esc>[?2004l"

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
