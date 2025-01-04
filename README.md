# My NeoVim config:
Neovim config based on [lazy.nvim](https://github.com/folke/lazy.nvim) package manager. Can be run on both Linux (default) and macOS. Additionally, Linux environment can be containerized using [Distrobox](https://github.com/89luca89/distrobox) in order to correctly run this in a containerized manner on an immutable Linux OS (e.g. Fedora Silverblue). \
Contains the following nvim plugins:
- [catppuccin](https://github.com/catppuccin/nvim) + toggle between light and dark on `<leader>tc`
- [airline](https://github.com/vim-airline/vim-airline)
- [coc](https://github.com/neoclide/coc.nvim) + bindings:
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
1. Install prerequisites: \
Fedora:
```bash
sudo dnf install -y neovim \
    nodejs \
    python3 \
    python3-pip \
    git \
    lua \
    luarocks \
    ctags \
    global-ctags
sudo npm install --global yarn
pip3 install --user --upgrade pynvim
```

macOS:
- After installing dependencies, set Nerd Font as your default in terminal application (e.g. iTerm2 it is Profiles -> Text -> Font)
- macOS config uses system-wide python located at `/usr/local/bin/python3`, not the `.pyenv` or `conda`. Please adjust accordingly
```zsh
brew install \
    ctags \
    universal-ctags \
    node \
    git \
    lua \
    luarocks \
    neovim \
    font-hack-nerd-font

sudo npm install --global yarn
/usr/local/bin/python3 -m pip install --user --upgrade pynvim
```
2. Clone repo to `~/.config/nvim`
3. Install neovim via your package manager
4. Run `nvim`
5. Everything is done automatically

### Linux (Distrobox):
This installation method provides fully isolated way of running neovim inside the Distrobox (podman) container. Configs are already installed and ready-to-go out of the box.
```bash
distrobox create --image ghcr.io/amidg/neovim:latest --name neovim --init-hooks "chmod 777 -R /app"
```

### Alternative: build container from source:
1. Install prerequisites as shown above.
2. Clone repo
3. Execute the following to build:
```bash
podman build -t neovim:latest .
distrobox create --image localhost/neovim:latest --name neovim --init-hooks "chmod 777 -R /app"
```

## Alias (DISTROBOX ONLY):
In order to preserve entire neovim environment inside the container, default paths are changed. These variables are changed only inside the container and do not affect user's shell configuration. Default path as stated in [documentation](https://neovim.io/doc/user/starting.html#_standard-paths):
```bash
XDG_CONFIG_HOME=~/.config/nvim
XDG_DATA_HOME=~/.local/share/nvim
```

New path:
```bash
XDG_CONFIG_HOME=/app/nvim
XDG_DATA_HOME=/app/nvim/data
```

Add this to your shell, e.g. `~/.bashrc`:
```bash
alias nvim="distrobox enter --additional-flags '--env XDG_CONFIG_HOME=/app/' --additional-flags '--env XDG_DATA_HOME=/app/data' neovim -- nvim"
```

## Based on some work of these people:
- https://medium.com/@jogarcia/you-dont-need-tabs-in-neovim-c6ba5ee44e3e
- https://dev.to/slydragonn/ultimate-neovim-setup-guide-lazynvim-plugin-manager-23b7
