# My NeoVim config

Neovim config built on [LazyVim](https://github.com/LazyVim/LazyVim) (a
distro on top of [lazy.nvim](https://github.com/folke/lazy.nvim)) for Linux,
designed for immutable hosts (Bluefin / Fedora atomic). Nothing is layered
into the OS image — tools come from Homebrew, plugins and LSP servers from
`~/.local/share/nvim`.

## What's inside

- **Layout & buffers** — native splits, tmux-aware navigation via
  [smart-splits.nvim](https://github.com/mrjones2014/smart-splits.nvim);
  tab-like buffer switching via
  [bufferline](https://github.com/akinsho/bufferline.nvim)
- **Terminals** — [snacks.nvim](https://github.com/folke/snacks.nvim)
  terminal splits running your real shell (`/bin/bash`, full `.bashrc`)
- **LSP & completion** — LazyVim defaults: nvim-lspconfig, mason, treesitter,
  [blink.cmp](https://github.com/Saghen/blink.cmp) (pinned to v1)
- **Search** — [fzf-lua](https://github.com/ibhagwan/fzf-lua) with ripgrep/fd
- **AI** — [opencode.nvim](https://github.com/nickjvandyke/opencode.nvim)
  talking to the local `opencode` daemon
- **Theme** — catppuccin macchiato/latte

## Shortcut glossary

Only the keys this config adds or that are worth knowing up front.
Everything else: press `<leader>` and let which-key show you.

### Windows & tmux
| Key | Action |
|---|---|
| `<C-h/j/k/l>` | Move to split / tmux pane in that direction |
| `<A-h/j/k/l>` | Resize split / tmux pane |
| `<leader>ww` | Other window |
| `<leader>wd` | Close window |
| `<leader>-` / `<leader>\|` | Split below / right |

### Buffers (tab-like)
| Key | Action |
|---|---|
| `<S-h>` / `<S-l>` | Previous / next buffer |
| `[b` / `]b` | Previous / next buffer |
| `[B` / `]B` | Move buffer left / right in the tabline |
| `<leader>bb` | Switch to other (last) buffer |
| `<leader>bd` | Close buffer |
| `<leader>bj` | Pick buffer by letter |

### Terminals
| Key | Action |
|---|---|
| `<C-/>` | Toggle terminal (bottom split) |
| `<leader>th` | New terminal, bottom split |
| `<leader>tv` | New terminal, right split |
| `<leader>tf` | New terminal, floating |
| `<Esc><Esc>` | Leave terminal insert mode |

### Search & files
| Key | Action |
|---|---|
| `<leader><leader>` | Find file by name (root dir) |
| `<leader>/` | Live grep across the project |
| `<leader>sg` | Live grep across the project |
| `<leader>sw` | Grep word under cursor |
| `<leader>sb` | Open buffers |
| `<leader>ss` | Symbols in current file |
| `<leader>sr` | Search and replace |
| `<leader>fr` | Recent files |
| `/` | Search in current buffer |
| `s` | Jump to any visible match (flash) |

### LSP & code
| Key | Action |
|---|---|
| `gd` | Go to definition |
| `gr` | References |
| `K` | Hover docs |
| `<leader>ca` | Code action |
| `<leader>cf` | Format buffer |
| `<leader>cd` | Line diagnostics |
| `]d` / `[d` | Next / previous diagnostic |

### AI (opencode)
| Key | Action |
|---|---|
| `<leader>oa` | Ask OpenCode about selection/cursor (`@this`) |
| `<leader>os` | OpenCode menu (prompts, commands, session) |
| `go{motion}` | Send a motion/range to OpenCode |
| `<leader>gg` | Lazygit |

### Theme
| Key | Action |
|---|---|
| `<leader>tc` | Toggle catppuccin macchiato (dark) / latte (light) |

## Installation (Bluefin, immutable Fedora)

Bluefin already ships Homebrew, Neovim 0.12, git, curl/tar/gzip/unzip, tmux,
gcc, ripgrep, fzf, Nerd Fonts and `opencode`. Install the three missing tools:

```bash
brew install fd lazygit tree-sitter-cli
```

> `tree-sitter-cli` is the CLI; the `tree-sitter` formula is only the library.

Then:

1. Back up any existing config: `mv ~/.config/nvim{,.bak}`
2. Clone this repo to `~/.config/nvim`
3. Run `nvim` — plugins, LSP servers and parsers install into
   `~/.local/share/nvim` automatically

## tmux

Seamless navigation needs a block in `~/.tmux.conf` that forwards `C-h/j/k/l`
into nvim and selects panes otherwise. This is already configured in this
environment; the exact block lives in `~/.tmux.conf`:

```tmux
is_vim="ps -o state= -o comm= -t '#{pane_tty}' | grep -iqE '^[^TXZ ]+ +(\\S+\\/)?g?(view|n?vim?x?)(diff)?$'"
bind-key -n C-h if-shell "$is_vim" 'send-keys C-h' 'select-pane -L'
bind-key -n C-j if-shell "$is_vim" 'send-keys C-j' 'select-pane -D'
bind-key -n C-k if-shell "$is_vim" 'send-keys C-k' 'select-pane -U'
bind-key -n C-l if-shell "$is_vim" 'send-keys C-l' 'select-pane -R'
```

## Layout

```
init.lua
lua/config/          -- options, keymaps, autocmds, lazy bootstrap
lua/plugins/         -- one file per concern
  colorscheme.lua    -- catppuccin + light/dark toggle
  windows.lua        -- smart-splits, bufferline
  terminal.lua       -- snacks terminals
  editor.lua         -- fzf-lua extra, blink.cmp pin
  ai.lua             -- opencode.nvim
```

`SPEC.md` documents the intent behind each area.
