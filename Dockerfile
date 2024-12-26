FROM fedora:latest

# update dnf and install neovim and lua
RUN dnf upgrade -y && \
    dnf install -y \
    neovim \
    lua

# copy local config to the container
RUN mkdir -p /config/nvim
COPY . /config/nvim/
