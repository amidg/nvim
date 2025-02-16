-- Lazy Nvim Configuration
require("config.lazy")
require("config.shortcuts")

-- Define the toggle_colorscheme function
function toggle_colorscheme()
  local current_colorscheme = vim.g.colors_name
  if current_colorscheme == "catppuccin-macchiato" then
    -- Switch to light variant
    vim.cmd("colorscheme catppuccin-latte")
  else
    -- Switch to dark variant
    vim.cmd("colorscheme catppuccin-macchiato")
  end
end

-- Set a keybinding to toggle colorscheme
vim.api.nvim_set_keymap('n', '<leader>tc', ':lua toggle_colorscheme()<CR>', { noremap = true, silent = true })
