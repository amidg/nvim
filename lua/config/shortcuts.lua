-- lua/plugins/shortcuts.lua
local map = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }

-- Telescope
-- Find files
map('n', '<leader>ff', "<cmd>Telescope find_files<CR>", opts)
-- Live grep
map('n', '<leader>fg', "<cmd>Telescope live_grep<CR>", opts)
-- Open buffers
map('n', '<leader>fb', "<cmd>Telescope buffers<CR>", opts)
-- Help tags
map('n', '<leader>fh', "<cmd>Telescope help_tags<CR>", opts)
-- Treesitter symbols
map('n', '<leader>ft', "<cmd>Telescope treesitter<CR>", opts)
-- LSP diagnostics
map('n', '<leader>fd', "<cmd>Telescope diagnostics<CR>", opts)
-- Find commits
map('n', '<leader>fc', "<cmd>Telescope git_commits<CR>", opts)
-- Git branches
map('n', '<leader>gb', "<cmd>Telescope git_branches<CR>", opts)


-- Tree
-- Map shortcut to open or toggle NvimTree
map("n", "<leader>ne", ":NvimTreeToggle<CR>", opts)
-- Key mapping to focus on NvimTree window
map('n', '<leader>nf', ':NvimTreeFocus<CR>', opts)


-- Surround
map('n', 'ds', '<Plug>Dsurround', opts)


-- Tagbar
map("n", "<leader>tb", ":TagbarToggle<CR>", opts)
map("n", "<leader>tr", ":TagbarRefresh<CR>", opts)


-- Formatting
map("n", "<leader>fm", ":Format<CR>", opts)
map("n", "<leader>FM", ":FormatWrite<CR>", opts)


-- Commentary
map('n', 'gc', '<Plug>Commentary', opts)


-- Cursors
-- Start multiple cursors with <C-d>
-- (for example, add a cursor to the next occurrence)
map("n", "<C-d>", "<Plug>(MultipleCursorsNext)", opts)
-- Start multiple cursors in the opposite direction with <C-a>
map("n", "<C-a>", "<Plug>(MultipleCursorsPrev)", opts)
-- Start a multiple cursor selection for the word under the cursor
map("n", "<leader>mc", "<Plug>(MultipleCursorsStart)", opts)
-- Remove the current cursor (can be used during multi-cursor editing)
map("n", "<leader>md", "<Plug>(MultipleCursorsRemove)", opts)
-- Remove all cursors
map("n", "<leader>mD", "<Plug>(MultipleCursorsRemoveAll)", opts)
-- Visual mode: Select all occurrences of the word under the cursor
map("v", "<leader>mc", "<Plug>(MultipleCursorsStart)", opts)
-- Support for adding multiple cursors from visual mode (select region)
map("v", "<leader>md", "<Plug>(MultipleCursorsRemove)", opts)


----------------------
-- Harpoon -----------
----------------------
-- Add file to Harpoon marks
map('n', '<leader>ha', "<cmd>lua require('harpoon.mark').add_file()<CR>", opts)  -- Add current file to Harpoon marks
-- Navigate to next/previous Harpoon mark
map('n', '<leader>hn', "<cmd>lua require('harpoon.ui').nav_next()<CR>", opts)  -- Go to next file in Harpoon marks
map('n', '<leader>hp', "<cmd>lua require('harpoon.ui').nav_prev()<CR>", opts)  -- Go to previous file in Harpoon marks
-- Open Harpoon UI
map('n', '<leader>hl', "<cmd>lua require('harpoon.ui').toggle_quick_menu()<CR>", opts)  -- Toggle the Harpoon menu
-- Open specific Harpoon marks (1-4)
map('n', '<leader>h1', "<cmd>lua require('harpoon.ui').nav_file(1)<CR>", opts)  -- Open the first Harpoon mark
map('n', '<leader>h2', "<cmd>lua require('harpoon.ui').nav_file(2)<CR>", opts)  -- Open the second Harpoon mark
map('n', '<leader>h3', "<cmd>lua require('harpoon.ui').nav_file(3)<CR>", opts)  -- Open the third Harpoon mark
map('n', '<leader>h4', "<cmd>lua require('harpoon.ui').nav_file(4)<CR>", opts)  -- Open the fourth Harpoon mark
