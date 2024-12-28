-- lua/plugins/tagbar.lua
return {
    "preservim/tagbar",  -- Tagbar plugin repository
    lazy = false,        -- Load immediately on startup
    priority = 1000,     -- High priority to load early
    config = function()
        -- You can configure Tagbar here. For example:
        vim.g.tagbar_autoclose = 1     -- Automatically close Tagbar when leaving the buffer
        vim.g.tagbar_ctags_bin = "ctags"  -- Define the ctags binary if necessary

        -- Add key mappings for opening and closing Tagbar
        -- vim.api.nvim_set_keymap("n", "<leader>n", ":TagbarOpen<CR>", { noremap = true, silent = true })
        vim.api.nvim_set_keymap("n", "<leader>tb", ":TagbarToggle<CR>", { noremap = true, silent = true })
        vim.api.nvim_set_keymap("n", "<leader>tr", ":TagbarRefresh<CR>", { noremap = true, silent = true })
    end,
}
