call plug#begin('~/.config/nvim/plugged')
Plug 'morhetz/gruvbox'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'itchyny/lightline.vim'
Plug 'neovim/nvim-lspconfig'
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

" Better split switching
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l

" <esc><esc> redraws the screen and removes any search highlighting
nnoremap <esc><esc> :noh<return><esc>

" python LSP
lua << EOF
require'lspconfig'.pyright.setup{
on_attach = function()
vim.keymap.set('n', 'K', vim.lsp.buf.hover, {buffer=0})
vim.keymap.set('n', 'gd', vim.lsp.buf.definition, {buffer=0})
end
}
EOF
