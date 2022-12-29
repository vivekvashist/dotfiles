vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)

use ('wbthomason/packer.nvim')

use {'nvim-telescope/telescope.nvim', tag = '0.1.0', requires = { {'nvim-lua/plenary.nvim'} } }

use ("ellisonleao/gruvbox.nvim")

use ('nvim-treesitter/nvim-treesitter', {run = ':TSUpdate'})
use {'nvim-treesitter/nvim-treesitter-textobjects', after = 'nvim-treesitter',}

use ('tpope/vim-fugitive')

use ('j-hui/fidget.nvim')

use {'VonHeikemen/lsp-zero.nvim', requires = {
    {'neovim/nvim-lspconfig'},
    {'williamboman/mason.nvim'},
    {'williamboman/mason-lspconfig.nvim'},
    {'hrsh7th/nvim-cmp'},
    {'hrsh7th/cmp-buffer'},
    {'hrsh7th/cmp-path'},
    {'saadparwaiz1/cmp_luasnip'},
    {'hrsh7th/cmp-nvim-lsp'},
    {'hrsh7th/cmp-nvim-lua'},
    {'L3MON4D3/LuaSnip'},
    {'rafamadriz/friendly-snippets'},
  }
}
use {'nvim-lualine/lualine.nvim', requires = { 'kyazdani42/nvim-web-devicons', opt = true} }
use {'nvim-telescope/telescope-fzf-native.nvim', run = 'make', cond = vim.fn.executable 'make' == 1}
use {'folke/neodev.nvim'}
end)
