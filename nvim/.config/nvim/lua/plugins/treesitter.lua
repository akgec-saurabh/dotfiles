-- Install nvim-treesitter via native pack system
vim.pack.add({
  {
    src = "https://github.com/nvim-treesitter/nvim-treesitter",
    version = "main",
    build = ":TSUpdate",
  },
  
  'https://github.com/neovim/nvim-lspconfig',
})
require("nvim-treesitter").setup({
  ensure_installed = {
    'lua',
    'vim',
    'vimdoc',
    'rust',
    'c',
    'cpp',
    'go',
    'html',
    'tsx',
    'jsx',
    'css',
    'javascript',
    'json',
    'lua',
    'markdown',
    'python',
    'typescript',
    'bash',
	
  },
  auto_install = false,
  highlight = {
    enable = true,
    additional_vim_regex_highlighting = false,
  },
  indent = {
    enable = true,
  },
})

