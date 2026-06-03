vim.pack.add({
  { src = "https://github.com/lewis6991/gitsigns.nvim" },
})

require("gitsigns").setup({
  signs = {
    -- Use a compact left gutter indicator for changed lines.
    add          = { text = "▎" },
    change       = { text = "▎" },
    delete       = { text = "" },
    topdelete    = { text = "" },
    changedelete = { text = "▎" },
  },
  on_attach = function(bufnr)
    local gs = package.loaded.gitsigns
    local map = function(mode, l, r, desc)
      vim.keymap.set(mode, l, r, { buffer = bufnr, desc = desc })
    end

    -- Hunk navigation
    map("n", "]h", gs.next_hunk, "Next hunk")
    map("n", "[h", gs.prev_hunk, "Prev hunk")

    -- Hunk actions
    map("n", "<leader>hs", gs.stage_hunk, "Stage hunk")
    map("n", "<leader>hr", gs.reset_hunk, "Reset hunk")
    map("n", "<leader>hp", gs.preview_hunk, "Preview hunk")
    map("n", "<leader>hb", gs.blame_line, "Blame line")
    map("n", "<leader>hd", gs.diffthis, "Diff this")
    map("n", "<leader>tb", gs.toggle_current_line_blame, "Toggle blame")
  end,
})
