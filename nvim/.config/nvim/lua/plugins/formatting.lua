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
    -- Use Prettier only for filetypes Biome does not handle here.
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
