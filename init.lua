
----------------
--- PLUGINS ---
----------------

-- Install package manager

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({

-- Colorscheme

  { 
    "ellisonleao/gruvbox.nvim", 
    priority = 1000, -- make sure to load this before all the other start plugins
    config = function ()
      require("gruvbox").setup({
        contrast = "hard"
      })
      vim.cmd([[colorscheme gruvbox]])
    end,
  },

-- Statusline

  { 
    "nvim-lualine/lualine.nvim",
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    config = function ()
      require("lualine").setup({
        options = { theme = 'gruvbox' },
        sections = {
          lualine_c = {
            {
              'filename',
              file_status = true, -- displays file status (readonly status, modified status)
              path = 2 -- 0 = just filename, 1 = relative path, 2 = absolute path
            }
          }
        }
      })
    end,
        -- fzf extension for telescope with better speed
  {
    "nvim-telescope/telescope-fzf-native.nvim", run = 'make' 
  },

  {'nvim-telescope/telescope-ui-select.nvim' },

  -- fuzzy finder framework
  {
    "nvim-telescope/telescope.nvim", 
    tag = '0.1.1',
    dependencies = { 
      "nvim-lua/plenary.nvim" ,
      "nvim-treesitter/nvim-treesitter",
      "nvim-tree/nvim-web-devicons",
    },
    config = function ()
      require("telescope").setup({
        extensions = {
          fzf = {
            fuzzy = true,                    -- false will only do exact matching
            override_generic_sorter = true,  -- override the generic sorter
            override_file_sorter = true,     -- override the file sorter
            case_mode = "smart_case",        -- or "ignore_case" or "respect_case"
                                             -- the default case_mode is "smart_case"
          }
        }
      })

      -- To get fzf loaded and working with telescope, you need to call
      -- load_extension, somewhere after setup function:
      require('telescope').load_extension('fzf')

      -- To get ui-select loaded and working with telescope, you need to call
      -- load_extension, somewhere after setup function:
      require("telescope").load_extension("ui-select")
    end,
  },

  },
   })

    
----------------
--- OPTIONS ---
----------------

vim.opt.termguicolors = true -- Enable 24-bit RGB colors
vim.opt.number = true -- Show line numbers
vim.opt.showmatch = true -- Highlight matching parenthesis
vim.opt.relativenumber = true -- Enable relative line numbers
vim.opt.mouse = 'a' -- Enable mouse support
vim.opt.guicursor = "" -- GUI: settings for cursor shape and blinking
vim.opt.tabstop = 4  -- Number of spaces that <Tab> in file uses
vim.opt.softtabstop = 4 -- Number of spaces that <Tab> uses while editing
vim.opt.shiftwidth = 4 --  Number of spaces to use for (auto)indent step
vim.opt.expandtab = true -- Use spaces with <Tab> is inserted
vim.opt.smartindent = true -- Use smart indenting
vim.opt.wrap = false -- Long lines wrap and continue on the next line
vim.opt.swapfile = false -- Don't use swapfile for a buffers
vim.opt.hlsearch = true -- Enable highlight matches with last search pattern (already enabled in Neovim)
vim.opt.incsearch = true -- Enable hightlight match while typing search pattern
vim.opt.scrolloff = 8 -- Minimum number of lines above and below cursor
vim.opt.updatetime = 50 -- After this many milliseconds flush swap file
vim.opt.colorcolumn = "81" -- Column to highlight
vim.opt.clipboard = 'unnamedplus' -- Copy/paste to system clipboard
vim.opt.breakindent = true -- Enable break indent
vim.opt.undofile = true -- Save undo history
vim.opt.ignorecase = true -- Ignore case in search patterns
vim.opt.smartcase = true -- No ignore case when pattern has uppercase
vim.opt.completeopt = 'menuone,noselect,noinsert'  -- Set completeopt to have a better completion experience
vim.opt.showmode = false -- Don't show -- INSERT -- anymore
vim.wo.signcolumn = 'yes' -- Keep signcolumn on by default


----------------
--- REMAPS ---
----------------

-- Remove search highlight
vim.keymap.set('n', '<ESC><ESC>', ':nohlsearch<CR>') 

-- telescope
local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>gf', builtin.git_files, {})
vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
vim.keymap.set('n', '<leader>ds', builtin.lsp_document_symbols, {})
vim.keymap.set('n', '<leader>td', builtin.diagnostics, {})
vim.keymap.set('n', '<leader>gs', builtin.grep_string, {})
vim.keymap.set('n', '<leader>gg', builtin.live_grep, {})
