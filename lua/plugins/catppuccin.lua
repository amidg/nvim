return {
  "catppuccin/nvim",
  name = "catppuccin",
  priority = 1000, -- Ensure it loads before other plugins
  config = function()
    require("catppuccin").setup({
      flavour = "macchiato", -- Options: latte, frappe, macchiato, mocha
      integrations = {
        treesitter = true,
        cmp = true,
        gitsigns = true,
        nvimtree = true,
        telescope = true,
        lsp_trouble = true,
        which_key = true,
      },
    })

    -- Set the colorscheme
    vim.cmd.colorscheme("catppuccin")
  end,
}
