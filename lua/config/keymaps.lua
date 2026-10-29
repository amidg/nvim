-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

vim.keymap.set("n", "<leader>tc", function()
  vim.cmd.colorscheme(vim.g.colors_name == "catppuccin-macchiato" and "catppuccin-latte" or "catppuccin-macchiato")
end, { desc = "Toggle catppuccin light/dark" })
