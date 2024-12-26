# neovim-config
My personal neovim config. Drop it to the ~/.local/config/

## How to run?
```
podman build -t neovim:latest .
distrobox create --image localhost/neovim:latest --name neovim
distrobox enter neovim
```
