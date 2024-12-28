-- lua/plugins/harpoon.lua
return {
  "ThePrimeagen/harpoon",  -- Harpoon plugin
  lazy = false,
  config = function()
    -- Harpoon setup
    local mark = require("harpoon.mark")
    local ui = require("harpoon.ui")

    -- Key mappings for Harpoon
    local keymap = vim.api.nvim_set_keymap
    local opts = { noremap = true, silent = true }

    -- Add file to Harpoon marks
    keymap('n', '<leader>ha', "<cmd>lua require('harpoon.mark').add_file()<CR>", opts)  -- Add current file to Harpoon marks

    -- Navigate to next/previous Harpoon mark
    keymap('n', '<leader>hn', "<cmd>lua require('harpoon.ui').nav_next()<CR>", opts)  -- Go to next file in Harpoon marks
    keymap('n', '<leader>hp', "<cmd>lua require('harpoon.ui').nav_prev()<CR>", opts)  -- Go to previous file in Harpoon marks

    -- Open Harpoon UI
    keymap('n', '<leader>hl', "<cmd>lua require('harpoon.ui').toggle_quick_menu()<CR>", opts)  -- Toggle the Harpoon menu

    -- Open specific Harpoon marks (1-4)
    keymap('n', '<leader>h1', "<cmd>lua require('harpoon.ui').nav_file(1)<CR>", opts)  -- Open the first Harpoon mark
    keymap('n', '<leader>h2', "<cmd>lua require('harpoon.ui').nav_file(2)<CR>", opts)  -- Open the second Harpoon mark
    keymap('n', '<leader>h3', "<cmd>lua require('harpoon.ui').nav_file(3)<CR>", opts)  -- Open the third Harpoon mark
    keymap('n', '<leader>h4', "<cmd>lua require('harpoon.ui').nav_file(4)<CR>", opts)  -- Open the fourth Harpoon mark
  end,
}
