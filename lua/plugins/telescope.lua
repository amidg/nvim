-- lua/plugins/telescope.lua
return {
  "nvim-telescope/telescope.nvim",
  lazy = false,  -- Load lazily (on-demand) if true
  dependencies = {
    "nvim-lua/plenary.nvim",  -- Required by telescope.nvim
    "nvim-telescope/telescope-fzf-native.nvim",  -- Optional, FZF sorter (faster)
  },
  config = function()
    -- Telescope setup configuration
    local telescope = require("telescope")
    local actions = require("telescope.actions")

    -- Telescope setup
    telescope.setup({
      defaults = {
        prompt_prefix = " ",  -- Change prompt symbol
        selection_caret = " ",  -- Caret symbol
        layout_strategy = "horizontal",  -- Layout for preview
        layout_config = {
          horizontal = { preview_width = 0.6 },
          vertical = { preview_height = 0.5 },
        },
        file_sorter = require("telescope.sorters").get_fuzzy_file,
        generic_sorter = require("telescope.sorters").get_generic_fuzzy_sorter,
        mappings = {
          i = {
            ["<Esc>"] = actions.close,  -- Close on Escape
            ["<C-u>"] = false,  -- Disable default C-u
            ["<C-d>"] = false,  -- Disable default C-d
          },
          n = {
            ["<C-q>"] = actions.close,  -- Close with Ctrl-Q
          },
        },
      },
      pickers = {
        find_files = {
          theme = "dropdown",
          hidden = true,  -- Allow searching hidden files
        },
        live_grep = {
          theme = "ivy",
        },
      },
    })

    -- Load Telescope extensions, e.g., fzf
    pcall(function()
      require("telescope").load_extension("fzf")
    end)

    -- Key mappings for Telescope
    local keymap = vim.api.nvim_set_keymap
    local opts = { noremap = true, silent = true }

    -- Find files
    keymap('n', '<leader>ff', "<cmd>Telescope find_files<CR>", opts)
    -- Live grep
    keymap('n', '<leader>fg', "<cmd>Telescope live_grep<CR>", opts)
    -- Open buffers
    keymap('n', '<leader>fb', "<cmd>Telescope buffers<CR>", opts)
    -- Help tags
    keymap('n', '<leader>fh', "<cmd>Telescope help_tags<CR>", opts)
    -- Treesitter symbols
    keymap('n', '<leader>ft', "<cmd>Telescope treesitter<CR>", opts)
    -- LSP diagnostics
    keymap('n', '<leader>fd', "<cmd>Telescope diagnostics<CR>", opts)
    -- Find commits
    keymap('n', '<leader>fc', "<cmd>Telescope git_commits<CR>", opts)
    -- Git branches
    keymap('n', '<leader>gb', "<cmd>Telescope git_branches<CR>", opts)
  end,
}
