-- lua/plugins/csscolor.lua
return {
    {
        "ap/vim-css-color",  -- Plugin repository
        lazy = false,         -- Load immediately when Neovim starts
        priority = 1000,      -- High priority to load early
        config = function()
            -- Optional: You can add custom configuration here if needed
            -- For example, you could disable the highlight group or change settings
            -- vim.g.css_color_enable_named_colors = 1
        end,
    }
}
