local lsp = require('lsp-zero')

lsp.preset('recommended')


-- Setup lua server for neovim
require('lspconfig').sumneko_lua.setup(
  lsp.build_options('sumneko_lua', lsp.defaults.nvim_workspace())
  )
-- Add neovim api source to nvim-cmp
local cmp_sources = lsp.defaults.cmp_sources()
table.insert(cmp_sources, {name = 'nvim_lua'})
require('cmp').setup.filetype('lua', {sources = cmp_sources})

lsp.setup()
