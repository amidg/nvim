-- lua/plugins/cursors.lua
return {
    "terryma/vim-multiple-cursors",  -- Plugin repository for vim-multiple-cursors
    lazy = false,                    -- Load immediately on startup
    priority = 1000,                 -- High priority to load early
    config = function()
        -- Enable key mappings for vim-multiple-cursors
        -- You can customize these mappings based on your preference
    end,
}
