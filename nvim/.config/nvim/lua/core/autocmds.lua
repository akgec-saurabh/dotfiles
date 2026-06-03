local augroup = vim.api.nvim_create_augroup
local autocmd = vim.api.nvim_create_autocmd

-- Editing feedback
autocmd('TextYankPost', {
  group = augroup('highlight-yank', { clear = true }),
  callback = function() vim.hl.on_yank() end,
})

-- Diagnostics
vim.diagnostic.config({
  update_in_insert = false,
  severity_sort = true,
  float = { border = 'rounded', source = 'if_many' },
  underline = { severity = { min = vim.diagnostic.severity.WARN } },
  virtual_text = false,
  virtual_lines = false,
  jump = { float = true },
})

-- File/session behavior
autocmd('BufReadPost', {
  group = augroup('restore-cursor', { clear = true }),
  callback = function()
    local mark = vim.api.nvim_buf_get_mark(0, '"')
    local lcount = vim.api.nvim_buf_line_count(0)
    if mark[1] > 0 and mark[1] <= lcount then
      pcall(vim.api.nvim_win_set_cursor, 0, mark)
    end
  end,
})

-- Layout behavior
autocmd('VimResized', {
  group = augroup('auto-resize', { clear = true }),
  callback = function() vim.cmd('tabdo wincmd =') end,
})

-- Temporary buffers
autocmd('FileType', {
  group = augroup('quick-close', { clear = true }),
  pattern = { 'help', 'qf', 'notify', 'lspinfo', 'checkhealth' },
  callback = function(event)
    vim.keymap.set('n', 'q', '<cmd>close<CR>', { buffer = event.buf, silent = true })
  end,
})

-- Web indentation
autocmd('FileType', {
  group = augroup('web-indent', { clear = true }),
  pattern = { 'javascript', 'javascriptreact', 'typescript', 'typescriptreact', 'css', 'html', 'json' },
  callback = function()
    vim.opt_local.tabstop = 2
    vim.opt_local.shiftwidth = 2
    vim.opt_local.expandtab = true
  end,
})

-- Autosave
autocmd({ 'FocusLost', 'BufLeave', 'WinLeave' }, {
  group = augroup('autosave-focus-change', { clear = true }),
  callback = function()
    if vim.bo.modified and vim.bo.buftype == '' and vim.fn.expand('%') ~= '' then
      vim.cmd('silent! write')
    end
  end,
})

-- JSX/TSX indentation
vim.api.nvim_create_autocmd("FileType", {
  pattern = { "javascriptreact", "typescriptreact", "javascript", "typescript" },
  callback = function()
    vim.opt_local.indentexpr = ""
    vim.opt_local.smartindent = true
    vim.opt_local.expandtab = true
    vim.opt_local.shiftwidth = 2
    vim.opt_local.tabstop = 2
  end,
})
