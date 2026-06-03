vim.pack.add({
  { src = "https://github.com/sindrets/diffview.nvim" },
})

-- Keymaps live in core/keymaps.lua.
require("diffview").setup()
