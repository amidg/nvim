:set number
:set autoindent
:set tabstop=4 shiftwidth=4 expandtab
:set smarttab
:set softtabstop=4
:set mouse=a
:set termguicolors
:syntax enable

call plug#begin()

Plug 'https://github.com/vim-airline/vim-airline'
Plug 'https://github.com/preservim/nerdtree'
Plug 'https://github.com/tpope/vim-surround'
Plug 'https://github.com/tpope/vim-commentary'
Plug 'https://github.com/ap/vim-css-color'
Plug 'https://github.com/rafi/awesome-vim-colorschemes'
Plug 'https://github.com/ryanoasis/vim-devicons'
Plug 'https://github.com/tc50cal/vim-terminal'
Plug 'https://github.com/terryma/vim-multiple-cursors'
Plug 'https://github.com/preservim/tagbar' 
Plug 'https://github.com/neoclide/coc.nvim'
Plug 'https://github.com/daschw/leaf.nvim'
Plug 'https://github.com/rebelot/kanagawa.nvim.git'
Plug 'https://github.com/folke/tokyonight.nvim.git'
Plug 'catppuccin/nvim', { 'as': 'catppuccin' }

set encoding=UTF-8

set clipboard=unnamedplus

nmap <F8> :TagbarToggle<CR>

:set completeopt-=preview

call plug#end()

nnoremap <C-n> :NERDTree<CR>
nnoremap <C-t> :NERDTreeToggle<CR>
