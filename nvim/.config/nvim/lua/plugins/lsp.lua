vim.pack.add({
  { src = "https://github.com/neovim/nvim-lspconfig" },
  { src = "https://github.com/williamboman/mason.nvim" },
  { src = "https://github.com/williamboman/mason-lspconfig.nvim" },
  { src = "https://github.com/rachartier/tiny-inline-diagnostic.nvim" },
})

require("mason").setup()

-- Install and enable the language servers used most often in this config.
require("mason-lspconfig").setup({
  ensure_installed = {
    "ts_ls",
    "biome",
    "tailwindcss",
    "cssls",
    "html",
    "jsonls",
    "emmet_ls",
    "lua_ls",
  },
  automatic_enable = true,
})

-- Neovim's Lua runtime exposes `vim` as a global.
vim.lsp.config("lua_ls", {
  settings = {
    Lua = {
      diagnostics = {
        globals = { "vim" },
      },
    },
  },
})

-- Buffer-local LSP keymaps.
vim.api.nvim_create_autocmd("LspAttach", {
  callback = function(event)
    local map = function(keys, func, desc)
      vim.keymap.set("n", keys, func, { buffer = event.buf, desc = "LSP: " .. desc })
    end

    map("gd", vim.lsp.buf.definition, "Go to Definition")
    map("gD", vim.lsp.buf.declaration, "Go to Declaration")
    map("gr", vim.lsp.buf.references, "References")
    map("K", vim.lsp.buf.hover, "Hover Docs")
    map("<leader>rn", vim.lsp.buf.rename, "Rename")
    map("<leader>ca", vim.lsp.buf.code_action, "Code Action")
    map("<leader>gf", function()
      -- Prefer Conform when loaded, but keep native LSP formatting as fallback.
      local ok, conform = pcall(require, "conform")
      if ok then
        conform.format({ async = true, lsp_fallback = true })
      else
        vim.lsp.buf.format({ async = true })
      end
    end, "Format File")
  end,
})

-- Inline diagnostics keep warnings visible without virtual text noise.
require("tiny-inline-diagnostic").setup()
