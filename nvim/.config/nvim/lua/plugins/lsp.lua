vim.pack.add({
  { src = "https://github.com/neovim/nvim-lspconfig" },
})

vim.diagnostic.config({
  virtual_text = true,
  signs = true,
  underline = true,
  update_in_insert = false,
  severity_sort = true,
  float = {
    border = "rounded",
    source = "if_many",
  },
})

local keymap = vim.keymap
local blink = require("blink.cmp")
local capabilities = blink.get_lsp_capabilities()

vim.api.nvim_create_autocmd("LspAttach", {
  callback = function(args)
    local opts = { buffer = args.buf }

    keymap.set("n", "K", vim.lsp.buf.hover, opts)
    keymap.set("n", "gd", vim.lsp.buf.definition, opts)
    keymap.set("n", "gD", vim.lsp.buf.declaration, opts)
    keymap.set("n", "gi", vim.lsp.buf.implementation, opts)
    keymap.set("n", "gr", vim.lsp.buf.references, opts)
    keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)
    keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, opts)

    keymap.set("n", "<leader>f", function()
      vim.lsp.buf.format({ async = true })
    end, opts)

    keymap.set("n", "[d", vim.diagnostic.goto_prev, opts)
    keymap.set("n", "]d", vim.diagnostic.goto_next, opts)
    keymap.set("n", "<leader>e", vim.diagnostic.open_float, opts)
  end,
})

-- TypeScript / JavaScript
vim.lsp.config("ts_ls", {
  capabilities = capabilities,
  filetypes = {
    "javascript",
    "javascriptreact",
    "typescript",
    "typescriptreact",
  },
})
vim.lsp.enable("ts_ls")

-- HTML
vim.lsp.config("html", {
  capabilities = capabilities,
})
vim.lsp.enable("html")

-- CSS
vim.lsp.config("cssls", {
  capabilities = capabilities,
})
vim.lsp.enable("cssls")

-- JSON
vim.lsp.config("jsonls", {
  capabilities = capabilities,
  settings = {
    json = {
      validate = { enable = true },
      schemas = {
        {
          fileMatch = { "package.json" },
          url = "https://json.schemastore.org/package.json",
        },
      },
    },
  },
})
vim.lsp.enable("jsonls")

-- ESLint
-- vim.lsp.config("eslint", {
  -- capabilities = capabilities,
-- })
-- vim.lsp.enable("eslint")

-- Tailwind CSS
vim.lsp.config("tailwindcss", {
  capabilities = capabilities,
})
vim.lsp.enable("tailwindcss")

-- Lua
vim.lsp.config("lua_ls", {
  capabilities = capabilities,
  settings = {
    Lua = {
      diagnostics = {
        globals = { "vim" },
      },
      workspace = {
        checkThirdParty = false,
      },
      telemetry = {
        enable = false,
      },
    },
  },
})
vim.lsp.enable("lua_ls")

-- Emmet
vim.lsp.config("emmet_language_server", {
  capabilities = capabilities,
  filetypes = {
    "html",
    "css",
    "scss",
    "javascriptreact",
    "typescriptreact",
  },
})
vim.lsp.enable("emmet_language_server")
