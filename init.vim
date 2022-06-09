call plug#begin('~/.config/nvim/plugged')
Plug 'morhetz/gruvbox'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'itchyny/lightline.vim'
call plug#end()

let mapleader=" "
set shortmess+=I
set guicursor=
set number
set relativenumber
set tabstop=4
set softtabstop=4
set shiftwidth=4
set nowrap
set noswapfile
set nobackup
set undofile
set scrolloff=8
set signcolumn=yes
set colorcolumn=80
set expandtab
set background=dark
set termguicolors
let g:gruvbox_contrast_dark='hard'
let g:gruvbox_contrast_light = "hard"
colorscheme gruvbox
set noshowmode " lightline

" Use h,j,k,l instead of arrow keys.
nnoremap <Left>  :echoe "Use h"<CR>
nnoremap <Right> :echoe "Use l"<CR>
nnoremap <Up>    :echoe "Use k"<CR>
nnoremap <Down>  :echoe "Use j"<CR>
" ...and in insert mode.
inoremap <Left>  <ESC>:echoe "Use h"<CR>
inoremap <Right> <ESC>:echoe "Use l"<CR>
inoremap <Up>    <ESC>:echoe "Use k"<CR>
inoremap <Down>  <ESC>:echoe "Use j"<CR>

" Find files using Telescope command-line sugar.
nnoremap <leader>ff <cmd>Telescope find_files<cr>
nnoremap <leader>fg <cmd>Telescope live_grep<cr>
nnoremap <leader>fb <cmd>Telescope buffers<cr>
nnoremap <leader>fh <cmd>Telescope help_tags<cr>

" Search mappings: These will make it so that going to the next one in a
" " search will center on the line it's found in.
nnoremap n nzzzv
nnoremap N Nzzzv
