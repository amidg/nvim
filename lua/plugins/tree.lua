-- lua/plugins/tree.lua
return {
    {
        "nvim-tree/nvim-tree.lua",  -- Plugin repository for Nvim Tree
        dependencies = {             -- Specify dependencies for nvim-tree
            "nvim-tree/nvim-web-devicons",  -- Required for icons
        },
        lazy = false,                -- Load immediately when Neovim starts
        priority = 1000,             -- High priority to load early
        config = function()
            -- Configure nvim-tree
            require("nvim-tree").setup({
                -- Example setup: You can customize this as needed
                renderer = {
                    icons = {
                        glyphs = {
                            default = "",
                            symlink = "",
                            folder = {
                                arrow_open = "",
                                arrow_closed = "",
                            },
                        },
                    },
                },
            })
        end,
    }
}
