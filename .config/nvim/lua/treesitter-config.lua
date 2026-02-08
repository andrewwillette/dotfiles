require 'nvim-treesitter'.setup {
  install_dir = vim.fn.stdpath('data') .. '/site',
}
require 'nvim-treesitter'.install { 'go', 'rust', 'markdown', 'json', 'bash', 'lua', 'gomod', 'python' }

vim.api.nvim_create_autocmd('FileType', {
  pattern = { 'go', 'rs', 'md', 'lua', 'markdown', 'gomod', 'python' },
  callback = function() vim.treesitter.start() end,
})
