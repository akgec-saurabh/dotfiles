vim.pack.add({
  { src = "https://github.com/nvim-lua/plenary.nvim" },
  { src = "https://github.com/nvim-telescope/telescope.nvim" },
})

require("telescope").setup({
  defaults = {
    prompt_prefix = "   ",
    selection_caret = " ",
    entry_prefix = "  ",
    sorting_strategy = "ascending",
    layout_config = {
      horizontal = {
        prompt_position = "top",
        preview_width = 0.55,
      },
    },
    border = true,
    borderchars = { "─", "│", "─", "│", "╭", "╮", "╯", "╰" },
  },
})
