return {
  {
    "mrjones2014/smart-splits.nvim",
    lazy = false,
    opts = {},
    keys = {
      { "<C-h>", function() require("smart-splits").move_cursor_left() end, desc = "Go to left split/pane" },
      { "<C-j>", function() require("smart-splits").move_cursor_down() end, desc = "Go to lower split/pane" },
      { "<C-k>", function() require("smart-splits").move_cursor_up() end, desc = "Go to upper split/pane" },
      { "<C-l>", function() require("smart-splits").move_cursor_right() end, desc = "Go to right split/pane" },
      { "<A-h>", function() require("smart-splits").resize_left() end, desc = "Resize split left" },
      { "<A-j>", function() require("smart-splits").resize_down() end, desc = "Resize split down" },
      { "<A-k>", function() require("smart-splits").resize_up() end, desc = "Resize split up" },
      { "<A-l>", function() require("smart-splits").resize_right() end, desc = "Resize split right" },
    },
  },
  {
    -- tab-like switch over all open buffers (LazyVim default plugin)
    "akinsho/bufferline.nvim",
    opts = { options = { always_show_bufferline = true } },
  },
}
