# neovim-config
My personal neovim config based on [lazy.nvim](https://github.com/folke/lazy.nvim) package manager. Can be run on both Linux (default) and macOS. Additionally, Linux environment can be containerized using [Distrobox](https://github.com/89luca89/distrobox) in order to correctly run this in a containerized manner on an immutable Linux OS (e.g. Fedora Silverblue). \
Contains the following nvim plugins:
- [catppuccin](https://github.com/catppuccin/nvim) + toggle between light and dark on `<leader>tc`
- [airline](https://github.com/vim-airline/vim-airline)
- [coc](https://github.com/neoclide/coc.nvim) + language bindings:
```
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
```
- [commentary](https://github.com/tpope/vim-commentary)
- [vim-css-color](https://github.com/ap/vim-css-color)
- [vim-multiple-cursors](https://github.com/terryma/vim-multiple-cursors)
- [harpoon](https://github.com/ThePrimeagen/harpoon)
- [vim-surround](https://github.com/tpope/vim-surround)
- [tagbar](https://github.com/preservim/tagbar)
- [telescope](https://github.com/nvim-telescope/telescope.nvim)
- [nvim-tree](https://github.com/nvim-tree) + dev icons

## Installation:
### Linux (Native) / macOS:
1. Clone repo to `~/.config/nvim`
2. Install neovim via your package manager
3. Run `nvim`
4. Everything is done automatically

### Linux (Distrobox):
```
```

### Build from source (container):
1. Clone repo
2. Execute the following to build:
```
podman build -t neovim:latest .
distrobox create --image localhost/neovim:latest --name neovim
distrobox enter neovim
```

## Alias:
```bash
alias nvim="distrobox enter neovim -- nvim"
```

## Based on some work of these people:
- https://medium.com/@jogarcia/you-dont-need-tabs-in-neovim-c6ba5ee44e3e
- https://dev.to/slydragonn/ultimate-neovim-setup-guide-lazynvim-plugin-manager-23b7
