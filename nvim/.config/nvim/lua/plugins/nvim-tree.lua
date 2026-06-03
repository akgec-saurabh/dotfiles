vim.pack.add({
  { src = "https://github.com/nvim-tree/nvim-web-devicons" }, -- optional icons
  { src = "https://github.com/nvim-tree/nvim-tree.lua" },
})

local config = {
  sort = {
    sorter = "case_sensitive",
  },
  view = {
    width = 30,
  },
  renderer = {
    group_empty = true,
  },
  filters = {
    dotfiles = true,
  },
  git = {
    ignore = true,
  },
}

require("nvim-tree").setup(config)
