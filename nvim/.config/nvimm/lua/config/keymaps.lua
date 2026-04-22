-- ============================
-- KEYMAPS FILE (keymaps.lua)
-- ============================

vim.g.mapleader = " "

local keymap = vim.keymap
local opts = { noremap = true, silent = true }

-- ============================
-- BASIC
-- ============================

keymap.set("i", "jk", "<Esc>", opts)

keymap.set("n", "<leader>w", "<cmd>w<CR>", opts)
keymap.set("n", "<leader>q", "<cmd>q<CR>", opts)
keymap.set("n", "<leader>wq", "<cmd>wq<CR>", opts)
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

keymap.set("n", "<leader>bd", function()
  require("mini.bufremove").delete(0, false)
end, { desc = "Delete buffer" })

keymap.set("n", "<leader>bD", function()
  require("mini.bufremove").delete(0, true)
end, { desc = "Force delete buffer" })

keymap.set("n", "<leader>bo", "<cmd>%bd|e#|bd#<CR>", opts)

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
  require("conform").format({ async = true, lsp_fallback = true })
end, opts)

keymap.set("n", "[d", vim.diagnostic.goto_prev, opts)
keymap.set("n", "]d", vim.diagnostic.goto_next, opts)
keymap.set("n", "<leader>ds", vim.diagnostic.open_float, opts)

-- ============================
-- VISUAL MODE
-- ============================

keymap.set("v", "<", "<gv", opts)
keymap.set("v", ">", ">gv", opts)

keymap.set("v", "J", ":m '>+1<CR>gv=gv", opts)
keymap.set("v", "K", ":m '<-2<CR>gv=gv", opts)

-- ============================
-- QUICK
-- ============================

keymap.set("n", "<leader>a", "ggVG", opts)
