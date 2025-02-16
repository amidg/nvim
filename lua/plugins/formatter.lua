return {
    "mhartington/formatter.nvim",
    config = function()
        -- Formatter configuration
        require("formatter").setup({
            logging = true,
            log_level = vim.log.levels.WARN,
            filetype = {
                lua = {
                    -- LuaFormatter configuration
                    function()
                        return {
                            exe = "stylua",
                            args = { "--search-parent-directories", "--stdin-filepath", vim.fn.fnameescape(vim.api.nvim_buf_get_name(0)), "-" },
                            stdin = true,
                        }
                    end,
                },
                python = {
                    -- Python Formatter (e.g., Black)
                    function()
                        return {
                            exe = "black",
                            args = { "--fast", "-" },
                            stdin = true,
                        }
                    end,
                },
                -- Add more filetypes here
            },
        })
    end,
}
