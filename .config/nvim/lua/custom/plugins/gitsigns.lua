return {
  "lewis6991/gitsigns.nvim",
  opts = {},
  config = function()
    require("gitsigns").setup()
    local gs = require("gitsigns")

    vim.keymap.set("n", "<leader>hr", function()
      gs.reset_hunk()
    end, { desc = "Gitsigns Reset Hunk" })

    vim.keymap.set("n", "<leader>hb", function()
      gs.blame_line({ full = true })
    end, { desc = "Gitsigns Blame Line" })

    vim.keymap.set("n", "<leader>tb", function()
      gs.toggle_current_line_blame()
    end, { desc = "Gitsigns Toggle Line Blame" })

    vim.keymap.set("n", "]c", function()
      gs.next_hunk()
    end, { desc = "Gitsigns Next Change" })

    vim.keymap.set("n", "[c", function()
      gs.prev_hunk()
    end, { desc = "Gitsigns Previous Change" })

    vim.keymap.set("n", "<leader>hd", "<cmd>Gitsigns diffthis<CR>")
    vim.keymap.set("n", "<leader>hD", '<cmd>lua require"gitsigns".diffthis("~")<CR>')
  end,
}
