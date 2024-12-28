-- lua/plugins/cursors.lua
return {
    "terryma/vim-multiple-cursors",  -- Plugin repository for vim-multiple-cursors
    lazy = false,                    -- Load immediately on startup
    priority = 1000,                 -- High priority to load early
    config = function()
        -- Enable key mappings for vim-multiple-cursors
        -- You can customize these mappings based on your preference

        -- Start multiple cursors with <C-d> (for example, add a cursor to the next occurrence)
        vim.api.nvim_set_keymap("n", "<C-d>", "<Plug>(MultipleCursorsNext)", { noremap = true, silent = true })

        -- Start multiple cursors in the opposite direction with <C-a>
        vim.api.nvim_set_keymap("n", "<C-a>", "<Plug>(MultipleCursorsPrev)", { noremap = true, silent = true })

        -- Start a multiple cursor selection for the word under the cursor
        vim.api.nvim_set_keymap("n", "<leader>mc", "<Plug>(MultipleCursorsStart)", { noremap = true, silent = true })

        -- Remove the current cursor (can be used during multi-cursor editing)
        vim.api.nvim_set_keymap("n", "<leader>md", "<Plug>(MultipleCursorsRemove)", { noremap = true, silent = true })

        -- Remove all cursors
        vim.api.nvim_set_keymap("n", "<leader>mD", "<Plug>(MultipleCursorsRemoveAll)", { noremap = true, silent = true })

        -- Visual mode: Select all occurrences of the word under the cursor
        vim.api.nvim_set_keymap("v", "<leader>mc", "<Plug>(MultipleCursorsStart)", { noremap = true, silent = true })

        -- Support for adding multiple cursors from visual mode (select region)
        vim.api.nvim_set_keymap("v", "<leader>md", "<Plug>(MultipleCursorsRemove)", { noremap = true, silent = true })
    end,
}
