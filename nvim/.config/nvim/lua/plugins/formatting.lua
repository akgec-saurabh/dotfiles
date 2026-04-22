vim.pack.add({
  { src = "https://github.com/stevearc/conform.nvim" },
})

require("conform").setup({
  formatters_by_ft = {
    javascript      = { "prettier" },
    javascriptreact = { "prettier" },
    typescript      = { "prettier" },
    typescriptreact = { "prettier" },
    css             = { "prettier" },
    html            = { "prettier" },
    json            = { "prettier" },
    markdown        = { "prettier" },
  },
  format_on_save = {
    timeout_ms = 500,
    lsp_fallback = true,
  },
})

vim.keymap.set({ "n", "v" }, "<leader>gf", function()
  require("conform").format({ async = true, lsp_fallback = true })
end, { desc = "Format file" })
