-- ============================
-- KEYMAPS FILE (keymaps.lua)
-- ============================

-- Leader key
vim.g.mapleader = " "

local keymap = vim.keymap
local opts = { noremap = true, silent = true }

-- ============================
-- BASIC
-- ============================

-- Exit insert mode
keymap.set("i", "jk", "<Esc>", opts)

-- Save file
keymap.set("n", "<leader>w", "<cmd>w<CR>", opts)

-- Quit window
keymap.set("n", "<leader>q", "<cmd>q<CR>", opts)

-- Save and quit
keymap.set("n", "<leader>wq", "<cmd>wq<CR>", opts)

-- Clear search highlight
keymap.set("n", "<leader>nh", "<cmd>nohlsearch<CR>", opts)

-- ============================
-- WINDOW NAVIGATION
-- ============================

keymap.set("n", "<C-h>", "<C-w>h", opts)
keymap.set("n", "<C-j>", "<C-w>j", opts)
keymap.set("n", "<C-k>", "<C-w>k", opts)
keymap.set("n", "<C-l>", "<C-w>l", opts)

-- ============================
-- WINDOW RESIZING
-- ============================

keymap.set("n", "<C-Up>", "<cmd>resize +2<CR>", opts)
keymap.set("n", "<C-Down>", "<cmd>resize -2<CR>", opts)
keymap.set("n", "<C-Left>", "<cmd>vertical resize -2<CR>", opts)
keymap.set("n", "<C-Right>", "<cmd>vertical resize +2<CR>", opts)

-- ============================
-- BUFFER NAVIGATION
-- ============================

keymap.set("n", "<Tab>", "<cmd>bnext<CR>", opts)
keymap.set("n", "<S-Tab>", "<cmd>bprevious<CR>", opts)

keymap.set("n", "<leader>bn", "<cmd>bnext<CR>", opts)
keymap.set("n", "<leader>bp", "<cmd>bprevious<CR>", opts)
keymap.set("n", "<leader>bd", "<cmd>bdelete<CR>", opts)
keymap.set("n", "<leader>bo", "<cmd>%bd|e#|bd#<CR>", opts) -- close all except current

-- ============================
-- NVIM TREE
-- ============================

keymap.set("n", "<leader>e", "<cmd>NvimTreeToggle<CR>", opts)
keymap.set("n", "<leader>o", "<cmd>NvimTreeFocus<CR>", opts)
keymap.set("n", "<leader>fr", "<cmd>NvimTreeRefresh<CR>", opts)
keymap.set("n", "<leader>fc", "<cmd>NvimTreeFindFile<CR>", opts)

-- ============================
-- TELESCOPE
-- ============================

local builtin = require("telescope.builtin")

keymap.set("n", "<leader>ff", builtin.find_files, { desc = "Find files" })
keymap.set("n", "<leader>fg", builtin.live_grep, { desc = "Live grep" })
keymap.set("n", "<leader>fb", builtin.buffers, { desc = "Find buffers" })
keymap.set("n", "<leader>fh", builtin.help_tags, { desc = "Help tags" })
keymap.set("n", "<leader>fo", builtin.oldfiles, { desc = "Recent files" })

-- ============================
-- LSP
-- ============================

keymap.set("n", "K", vim.lsp.buf.hover, opts)
keymap.set("n", "gd", vim.lsp.buf.definition, opts)
keymap.set("n", "gD", vim.lsp.buf.declaration, opts)
keymap.set("n", "gi", vim.lsp.buf.implementation, opts)
keymap.set("n", "gr", vim.lsp.buf.references, opts)

keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)
keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, opts)
keymap.set("n", "<leader>lf", function()
  vim.lsp.buf.format({ async = true })
end, opts)

keymap.set("n", "[d", vim.diagnostic.goto_prev, opts)
keymap.set("n", "]d", vim.diagnostic.goto_next, opts)
keymap.set("n", "<leader>ds", vim.diagnostic.open_float, opts)

-- ============================
-- VISUAL MODE
-- ============================

-- Better indenting in visual mode
keymap.set("v", "<", "<gv", opts)
keymap.set("v", ">", ">gv", opts)

-- Move selected lines up/down
keymap.set("v", "J", ":m '>+1<CR>gv=gv", opts)
keymap.set("v", "K", ":m '<-2<CR>gv=gv", opts)

-- ============================
-- QUICK
-- ============================

-- Select all
keymap.set("n", "<leader>a", "ggVG", opts)
