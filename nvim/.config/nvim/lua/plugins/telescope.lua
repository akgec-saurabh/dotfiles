-- install plugins
vim.pack.add({
  { src = 'https://github.com/nvim-lua/plenary.nvim' }, -- required
  { src = 'https://github.com/nvim-telescope/telescope.nvim' },
})

-- load safely
local ok, telescope = pcall(require, 'telescope')
if not ok then return end

-- setup
telescope.setup({
  defaults = {
    layout_strategy = 'horizontal',
    layout_config = {
      prompt_position = 'top',
    },
    sorting_strategy = 'ascending',
    winblend = 0,
  },
})

-- keymaps
local builtin = require('telescope.builtin')

vim.keymap.set('n', '<leader>ff', builtin.find_files, { desc = 'Find files' })
vim.keymap.set('n', '<leader>fg', builtin.live_grep, { desc = 'Live grep' })
vim.keymap.set('n', '<leader>fb', builtin.buffers, { desc = 'Buffers' })
vim.keymap.set('n', '<leader>fh', builtin.help_tags, { desc = 'Help tags' })
