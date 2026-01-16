require 'nvim-treesitter'.setup {
  install_dir = vim.fn.stdpath('data') .. '/site',
}
require 'nvim-treesitter'.install { 'go', 'rust', 'markdown', 'json', 'bash', 'lua' }

vim.api.nvim_create_autocmd('FileType', {
  pattern = { 'go', 'rs', 'md', 'lua', 'markdown' },
  callback = function() vim.treesitter.start() end,
})
