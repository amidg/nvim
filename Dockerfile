FROM fedora:latest

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
    global-ctags

# install language server prerequisites
RUN npm install --global yarn && \
    pip3 install pynvim

# copy local config to the container
#RUN mkdir -p /nvim
#COPY . /nvim/
#
#ENTRYPOINT ["nvim", "-u", "/nvim/init.lua"]
