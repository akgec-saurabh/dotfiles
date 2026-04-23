vim.pack.add({
  { src = "https://github.com/stevearc/conform.nvim" },
})

require("conform").setup({
  formatters_by_ft = {
    javascript      = { "biome" },
    javascriptreact = { "biome" },
    typescript      = { "biome" },
    typescriptreact = { "biome" },
    css             = { "biome" },
    json            = { "biome" },
    jsonc           = { "biome" },
    -- keep prettier only for things biome doesn't handle
    html            = { "prettier" },
    markdown        = { "prettier" },
  },
  format_on_save = {
    timeout_ms = 1000, -- biome is fast but give it room
    lsp_fallback = true,
  },
})

vim.keymap.set({ "n", "v" }, "<leader>gf", function()
  require("conform").format({ async = true, lsp_fallback = true })
end, { desc = "Format file" })
