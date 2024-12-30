FROM fedora:latest

ENV APP_PATH=/app
ENV NVIM_PATH=$APP_PATH/nvim

# update dnf and install neovim and lua
RUN dnf upgrade -y && \
    dnf install -y \
    neovim \
    nodejs \
    python3 \
    python3-pip \
    git \
    lua \
    luarocks \
    ctags \
    global-ctags \
    clang \
    clang-tools-extra

# install language server prerequisites
RUN npm install --global yarn && \
    pip3 install pynvim

# copy local config to the container
RUN mkdir -p $NVIM_PATH
RUN ls -la /app/nvim
COPY init.lua $NVIM_PATH/init.lua
COPY lua $NVIM_PATH/lua
