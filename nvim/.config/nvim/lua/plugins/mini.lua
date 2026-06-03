vim.pack.add({
  { src = "https://github.com/nvim-mini/mini.nvim" },
})

-- Keep the mini.nvim modules explicit so each enabled feature is easy to scan.
require("mini.ai").setup({})
require("mini.comment").setup({})
require("mini.move").setup({})
require("mini.pairs").setup({})
require("mini.surround").setup({})
require("mini.tabline").setup({})
require("mini.icons").setup({})
require("mini.indentscope").setup({})
require("mini.trailspace").setup({})
require("mini.notify").setup({})
require("mini.cursorword").setup({})
require("mini.bufremove").setup({})
