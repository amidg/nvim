-- lua/plugins/surround.lua
return {
    {
        "tpope/vim-surround", -- Plugin repository
        lazy = false,          -- Install immediately when Neovim starts
        priority = 1000,       -- High priority to load early
        config = function()
            -- You can add custom configuration here if needed
            -- Example: Set key mappings or options for surround
        end,
    }
}
