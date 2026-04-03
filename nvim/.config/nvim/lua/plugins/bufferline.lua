vim.pack.add({
  { src = "https://github.com/akinsho/bufferline.nvim" },
  { src = "https://github.com/nvim-tree/nvim-web-devicons" },
})

require("bufferline").setup({
  options = {
    mode = "buffers", -- or "tabs"
    numbers = "none",
    close_command = "bdelete! %d",
    right_mouse_command = "bdelete! %d",

    diagnostics = "nvim_lsp", -- show LSP errors on tabs

    offsets = {
      {
        filetype = "NvimTree",
        text = "File Explorer",
        highlight = "Directory",
        separator = true,
      },
    },

    show_buffer_close_icons = true,
    show_close_icon = false,
    separator_style = "slant",
  },
})
