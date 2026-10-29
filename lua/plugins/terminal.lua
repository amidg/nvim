return {
  {
    "folke/snacks.nvim",
    opts = { terminal = { win = { style = "terminal" } } },
    keys = {
      { "<leader>th", function() Snacks.terminal.open(nil, { cwd = LazyVim.root(), win = { position = "bottom" } }) end, desc = "New terminal (bottom)" },
      { "<leader>tv", function() Snacks.terminal.open(nil, { cwd = LazyVim.root(), win = { position = "right" } }) end, desc = "New terminal (right)" },
      { "<leader>tf", function() Snacks.terminal.open(nil, { cwd = LazyVim.root(), win = { position = "float" } }) end, desc = "New terminal (float)" },
    },
  },
}
