-- lua/plugins/commentary.lua
return {
    {
        "tpope/vim-commentary", -- Plugin repository
        lazy = false,           -- Load immediately when Neovim starts
        priority = 1000,        -- High priority to load early
        config = function()
            -- You can add custom configuration here if needed
        end,
    }
}
