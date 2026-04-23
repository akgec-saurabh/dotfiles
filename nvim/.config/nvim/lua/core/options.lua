-- Line numbers
vim.o.number = true
vim.o.relativenumber = true  -- relative makes jumping with 5j, 12k much faster

-- Indentation
vim.o.tabstop = 2
vim.o.shiftwidth = 2
vim.o.expandtab = true
vim.o.smartindent = true     -- auto indent on new line

-- Search
vim.o.ignorecase = true
vim.o.smartcase = true
vim.o.hlsearch = true        -- highlight all search matches
vim.o.incsearch = true       -- show match as you type

-- Appearance
vim.o.termguicolors = true
vim.o.cursorline = true
vim.o.signcolumn = 'yes'
vim.o.showmode = false
vim.o.wrap = false
vim.o.scrolloff = 10         -- keep 10 lines above/below cursor always
vim.o.sidescrolloff = 8      -- keep 8 cols left/right when scrolling horizontally
vim.o.colorcolumn = '100'    -- visual ruler at 100 chars (Next.js convention)

-- Splits
vim.o.splitright = true
vim.o.splitbelow = true

-- Performance
vim.o.updatetime = 250       -- faster CursorHold (affects gitsigns, LSP hover)
vim.o.timeoutlen = 300

-- Files
vim.o.undofile = true        -- persistent undo across sessions
vim.o.swapfile = false       -- no swap files (annoying, you have git)
vim.o.backup = false
vim.o.confirm = true         -- ask instead of failing on unsaved changes

-- Editing
vim.o.mouse = 'a'
vim.o.breakindent = true
vim.o.inccommand = 'split'   -- live preview of :s substitutions
vim.o.list = true
vim.opt.listchars = { tab = '» ', trail = '·', nbsp = '␣' }

-- Folds (native treesitter folding, nvim 0.12)
vim.o.foldmethod = 'expr'
vim.o.foldexpr = 'v:lua.vim.treesitter.foldexpr()'
vim.o.foldenable = false     -- all folds open by default

-- Completion menu behavior
vim.o.completeopt = 'menuone,noselect'  -- needed for nvim-cmp to work correctly

-- Clipboard
vim.schedule(function() vim.o.clipboard = 'unnamedplus' end)

-- Misc
vim.o.pumheight = 10         -- max 10 items in completion popup
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '
vim.g.have_nerd_font = true
vim.g.loaded_netrw = 1       -- disable netrw (using nvim-tree instead)
vim.g.loaded_netrwPlugin = 1

-- Add these:
vim.o.conceallevel = 0   -- don't hide quotes in JSON/markdown
vim.o.laststatus = 3     -- global statusline (one bar for all splits, cleaner)


vim.o.cindent = false
vim.o.smartindent = true
