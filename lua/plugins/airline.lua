-- lua/plugins/airline.lua
return {
    {
        "vim-airline/vim-airline",
        lazy = false,
        priority = 1000,
        dependencies = {
            { "vim-airline/vim-airline-themes" },
            { "ryanoasis/vim-devicons" },
        },
        config = function()
            -- Enable powerline fonts
            vim.g.airline_powerline_fonts = 1

            -- Set the theme for vim-airline
            vim.g.airline_theme = 'dark' -- Replace 'dark' with your preferred theme

            -- Example: Enable tabline for buffers
            vim.g["airline#extensions#tabline#enabled"] = 1

            -- Example: Enable vim-devicons support
            vim.g["airline#extensions#tabline#formatter"] = 'unique_tail'
        end,
    }
}

