vim.pack.add({
  { src = "https://github.com/hrsh7th/nvim-cmp" },
  { src = "https://github.com/hrsh7th/cmp-nvim-lsp" },
  { src = "https://github.com/hrsh7th/cmp-buffer" },
  { src = "https://github.com/hrsh7th/cmp-path" },
  { src = "https://github.com/L3MON4D3/LuaSnip" },
  { src = "https://github.com/saadparwaiz1/cmp_luasnip" },
  { src = "https://github.com/rafamadriz/friendly-snippets" },
})

local cmp = require("cmp")
local luasnip = require("luasnip")

require("luasnip.loaders.from_vscode").lazy_load()

cmp.setup({
  snippet = {
    expand = function(args)
      luasnip.lsp_expand(args.body)
    end,
  },

  mapping = cmp.mapping.preset.insert({
    ["<C-n>"]     = cmp.mapping.select_next_item(),
    ["<C-p>"]     = cmp.mapping.select_prev_item(),
    ["<C-Space>"] = cmp.mapping.complete(),
    ["<C-e>"]     = cmp.mapping.abort(),
    ["<CR>"]      = cmp.mapping.confirm({ select = true }),
    ["<Tab>"]     = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_next_item()
      elseif luasnip.expand_or_jumpable() then
        luasnip.expand_or_jump()
      else
        fallback()
      end
    end, { "i", "s" }),
    ["<S-Tab>"]   = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_prev_item()
      elseif luasnip.jumpable(-1) then
        luasnip.jump(-1)
      else
        fallback()
      end
    end, { "i", "s" }),
  }),

  sorting = {
    priority_weight = 2,
    comparators = {
      require("cmp.config.compare").offset,
      require("cmp.config.compare").exact,
      require("cmp.config.compare").score,
      require("cmp.config.compare").recently_used,
      require("cmp.config.compare").locality,
      require("cmp.config.compare").kind,
      require("cmp.config.compare").length,
      require("cmp.config.compare").order,
    },
  },

  sources = cmp.config.sources({
    {
      name = "nvim_lsp",
      priority = 1000,
      entry_filter = function(entry, _)
        -- Let LuaSnip own snippets instead of showing duplicate LSP snippet items.
        return require("cmp.types").lsp.CompletionItemKind[entry:get_kind()] ~= "Snippet"
      end,
    },
    { name = "path",    priority = 750 },
    { name = "buffer",  priority = 500 },
    { name = "luasnip", priority = 250 },
  }),

  formatting = {
    format = function(entry, vim_item)
      -- Show the completion source in the menu column.
      vim_item.menu = ({
        nvim_lsp = "[LSP]",
        luasnip  = "[Snip]",
        buffer   = "[Buf]",
        path     = "[Path]",
      })[entry.source.name]
      return vim_item
    end,
  },

  window = {
    completion    = cmp.config.window.bordered(),
    documentation = cmp.config.window.bordered(),
  },

  experimental = {
    ghost_text = true, -- shows inline preview of completion
  },
})
