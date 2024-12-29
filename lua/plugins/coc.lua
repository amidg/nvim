return {
  {
    "neoclide/coc.nvim",
    branch = "release",
    config = function()
      local g = vim.g
      local fn = vim.fn

      -- Global Extensions
      g.coc_global_extensions = {
          "coc-clangd",
          "coc-css",
          "coc-diagnostic",
          "coc-eslint",
          "coc-html",
          "coc-json",
          "coc-lua",
          "coc-prettier",
          "coc-python",
          "coc-toml",
          "coc-pyright",
          "coc-snippets",
          "coc-tsserver",
          "coc-yaml",
      }

      -- Global Functions
      function _G.check_back_space()
          local col = fn.col(".") - 1
          return col == 0 or fn.getline("."):sub(col, col):match("%s")
      end

      function _G.show_docs()
          local cw = fn.expand("<cword>")
          if fn.index({ "vim", "help" }, vim.bo.filetype) >= 0 then
              vim.cmd("h " .. cw)
          elseif vim.fn.eval("coc#rpc#ready()") then
              fn.CocActionAsync("doHover")
          else
              vim.cmd("!" .. vim.o.keywordprg .. " " .. cw)
          end
      end

      -- Mappings
      local mappings = {
          i = {
              -- Use <TAB> for navigating in completion list, fallback to insert a tab if no completion is available
              {
                "<TAB>",
                'pumvisible() ? "<C-N>" : v:lua.check_back_space() ? "<TAB>" : coc#refresh()',
                { expr = true }
              },
              -- Shift-Tab to navigate backwards through the completion list
              {
                "<S-TAB>",
                'pumvisible() ? "<C-P>" : "<C-H>"',
                { expr = true }
              },
          },
          n = {
              -- Show docs for the word under the cursor in Normal mode
              { "K", "<CMD>lua _G.show_docs()<CR>", { silent = true } },
              -- Go to definition
              { "gd", "<Plug>(coc-definition)", { noremap = false } },
          },
      }

      -- Register Mappings
      for mode, mode_mappings in pairs(mappings) do
          for _, mapping in ipairs(mode_mappings) do
              local options = mapping[3] or { silent = true, noremap = true }
              vim.keymap.set(mode, mapping[1], mapping[2], options)
          end
      end

      -- Commands
      vim.cmd([[
          command! -nargs=0 Format :call CocAction('format')
          command! -nargs=0 OR :call CocAction('runCommand', 'editor.action.organizeImport')
      ]])
    end,
  },
}
