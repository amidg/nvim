return {
  {
    "stevearc/conform.nvim",
    opts = {
      formatters_by_ft = {
        python = { "ruff_organize_imports", "ruff_format" },
        c = { "clang-format" },
        cpp = { "clang-format" },
      },
    },
  },
}
