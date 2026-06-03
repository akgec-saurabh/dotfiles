local map = function(mode, lhs, rhs, opts)
  opts = opts or {}
  opts.silent = opts.silent ~= false -- silent by default
  vim.keymap.set(mode, lhs, rhs, opts)
end

-- General
map('n', '<Esc>', '<cmd>nohlsearch<CR>') -- clear search highlight
map('n', '<C-s>', '<cmd>w<CR>', { desc = 'Save' })
map('i', '<C-s>', '<Esc><cmd>w<CR>', { desc = 'Save from insert' })
map('n', '<C-z>', '<cmd>undo<CR>', { desc = 'Undo' })
map('n', '<leader>tw', '<cmd>set wrap!<CR>', { desc = 'Toggle line wrap' })

-- better paste (don't overwrite register when pasting over selection)
map('x', 'p', '"_dP', { desc = 'Paste without yanking' })

-- stay in visual mode after indent
map('v', '<', '<gv', { desc = 'Indent left' })
map('v', '>', '>gv', { desc = 'Indent right' })

-- move lines up/down in visual mode (works great with mini.move too)
map('v', 'J', ":m '>+1<CR>gv=gv", { desc = 'Move lines down' })
map('v', 'K', ":m '<-2<CR>gv=gv", { desc = 'Move lines up' })

-- keep cursor centered when jumping
map('n', '<C-d>', '<C-d>zz', { desc = 'Scroll down centered' })
map('n', '<C-u>', '<C-u>zz', { desc = 'Scroll up centered' })
map('n', 'n', 'nzzzv', { desc = 'Next match centered' })
map('n', 'N', 'Nzzzv', { desc = 'Prev match centered' })

-- join line without moving cursor
map('n', 'J', 'mzJ`z', { desc = 'Join line' })

-- Windows and splits
map('n', '<C-h>', '<C-w><C-h>', { desc = 'Focus left window' })
map('n', '<C-l>', '<C-w><C-l>', { desc = 'Focus right window' })
map('n', '<C-j>', '<C-w><C-j>', { desc = 'Focus lower window' })
map('n', '<C-k>', '<C-w><C-k>', { desc = 'Focus upper window' })

map('n', '<leader>sv', '<cmd>vsplit<CR>', { desc = 'Split vertical' })
map('n', '<leader>sh', '<cmd>split<CR>', { desc = 'Split horizontal' })
map('n', '<leader>sx', '<cmd>close<CR>', { desc = 'Close split' })

-- resize splits with arrow keys
map('n', '<Up>', '<cmd>resize +2<CR>', { desc = 'Resize up' })
map('n', '<Down>', '<cmd>resize -2<CR>', { desc = 'Resize down' })
map('n', '<Left>', '<cmd>vertical resize -2<CR>', { desc = 'Resize left' })
map('n', '<Right>', '<cmd>vertical resize +2<CR>', { desc = 'Resize right' })

-- Buffers
map('n', '<Tab>', '<cmd>bnext<CR>', { desc = 'Next buffer' })
map('n', '<S-Tab>', '<cmd>bprevious<CR>', { desc = 'Prev buffer' })
map('n', '<leader>x', function() require('mini.bufremove').delete() end, { desc = 'Close buffer' })
map('n', '<leader>X', function() require('mini.bufremove').delete(0, true) end, { desc = 'Force close buffer' })
map('n', '<leader>ba', '<cmd>%bdelete<CR>', { desc = 'Close all buffers' })
map('n', '<leader><Tab>', '<C-^>', { desc = 'Switch to last buffer' })

-- File tree
map('n', '<leader>e', '<cmd>NvimTreeToggle<CR>', { desc = 'Toggle file tree' })
map('n', '<leader>ef', '<cmd>NvimTreeFindFile<CR>', { desc = 'Find current file in tree' })
map('n', '<leader>ec', function()
  require('nvim-tree.api').tree.collapse_all()
end, { desc = 'Collapse all folders' })

-- Telescope
map('n', '<leader>ff', function() require('telescope.builtin').find_files() end, { desc = 'Find files' })
map('n', '<leader>fg', function() require('telescope.builtin').live_grep() end, { desc = 'Live grep' })
map('n', '<leader>fb', function() require('telescope.builtin').buffers() end, { desc = 'Buffers' })
map('n', '<leader>fh', function() require('telescope.builtin').help_tags() end, { desc = 'Help tags' })
map('n', '<leader>fd', function() require('telescope.builtin').diagnostics() end, { desc = 'Diagnostics' })
map('n', '<leader>fr', function() require('telescope.builtin').oldfiles() end, { desc = 'Recent files' })
map('n', '<leader>fc', function() require('telescope.builtin').current_buffer_fuzzy_find() end,
  { desc = 'Search in file' })
map('n', '<leader>fk', function() require('telescope.builtin').keymaps() end, { desc = 'Find keymaps' })
map('n', '<leader>gs', function() require('telescope.builtin').git_status() end, { desc = 'Git status' })
map('n', '<leader>gc', function() require('telescope.builtin').git_commits() end, { desc = 'Git commits' })

-- Diagnostics fallbacks
map('n', '[d', vim.diagnostic.goto_prev, { desc = 'Prev diagnostic' })
map('n', ']d', vim.diagnostic.goto_next, { desc = 'Next diagnostic' })
map('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Diagnostic list' })

-- Terminal
map('t', '<Esc><Esc>', '<C-\\><C-n>', { desc = 'Exit terminal mode' })
map('n', '<leader>tt', '<cmd>terminal<CR>', { desc = 'Open terminal' })

-- React / web helpers
map('n', '<leader>cl', function()
  local word = vim.fn.expand('<cword>')
  local line = string.format("console.log('%s', %s)", word, word)
  vim.api.nvim_put({ line }, 'l', true, true)
end, { desc = 'Console.log word' })

-- Quick selections
map('n', '<leader>a', 'ggVG', { desc = 'Select buffer' })

-- Diagnostics
map('n', '<leader>d', vim.diagnostic.open_float, { desc = 'Show diagnostic' })

-- Search and replace
map('n', '<leader>sr', ':%s/<C-r><C-w>/<C-r><C-w>/gI<Left><Left><Left>', { desc = 'Replace word under cursor' })

-- Quickfix
map('n', '<leader>qo', '<cmd>copen<CR>', { desc = 'Open quickfix' })
map('n', '<leader>qc', '<cmd>cclose<CR>', { desc = 'Close quickfix' })
map('n', ']q', '<cmd>cnext<CR>', { desc = 'Next quickfix item' })
map('n', '[q', '<cmd>cprev<CR>', { desc = 'Prev quickfix item' })

-- Misc
map('n', '<leader>oc', '<cmd>e ~/.config/nvim/init.lua<CR>', { desc = 'Open config' })
map('n', '<leader>ft', '<cmd>TodoTelescope<CR>', { desc = 'Find TODOs' })

-- Diffview
map('n', '<leader>gd', '<cmd>DiffviewOpen<CR>', { desc = 'Git diff' })
map('n', '<leader>gh', '<cmd>DiffviewFileHistory %<CR>', { desc = 'File git history' })
map('n', '<leader>gx', '<cmd>DiffviewClose<CR>', { desc = 'Close diff' })
