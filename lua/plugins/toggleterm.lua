-- lua/plugins/toggleterm.lua
return {
    "akinsho/toggleterm.nvim",  -- Plugin repository for toggleterm
    lazy = false,               -- Load immediately on startup
    priority = 1000,            -- High priority to load early
    config = function()
        -- Configure toggleterm
        require("toggleterm").setup({
            size = 20,           -- Default size of the terminal window
            open_mapping = [[<leader>t]],  -- Key to toggle terminal window
            direction = "float",  -- Open terminal in floating window
            hide_numbers = true,  -- Hide line numbers in the terminal
            shade_filetypes = {}, -- List of filetypes to apply shading
            shade_terminals = true,  -- Apply shading on terminal windows
            shading_factor = 2,       -- Shade intensity
            start_in_insert = true,  -- Start in insert mode when opening terminal
        })
        
        -- Key mapping for opening the terminal using <leader>t
        -- vim.api.nvim_set_keymap("n", "<leader>t", ":ToggleTerm<CR>", { noremap = true, silent = true })
        vim.api.nvim_set_keymap("n", "<leader>th", ":ToggleTerm direction=horizontal<CR>", { noremap = true, silent = true })
        vim.api.nvim_set_keymap("n", "<leader>tv", ":ToggleTerm direction=vertical<CR>", { noremap = true, silent = true })
    end,
}
