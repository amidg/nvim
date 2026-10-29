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

## Keyboard reference

`<leader>` is **Space**. Press `<leader>` alone and wait — which-key lists
every group. The tables below are the complete set of bindings from the live
config.

### Most used

| Key | Action |
|---|---|
| `<C-h>` `<C-j>` `<C-k>` `<C-l>` | Move to split / tmux pane in that direction |
| `<M-h>` `<M-j>` `<M-k>` `<M-l>` | Resize split / tmux pane |
| `<leader>-` / `<leader>\|` | Split below / right |
| `<leader>wd` | Close window |
| `<S-h>` / `<S-l>` | Previous / next buffer |
| `[b` / `]b` | Previous / next buffer |
| `[B` / `]B` | Move buffer left / right in the tabline |
| `<leader>bb` | Switch to other (last) buffer |
| `<leader>bd` | Close buffer |
| `<leader>bj` | Pick buffer by letter |
| `<C-/>` | Toggle terminal (bottom split) |
| `<leader>th` / `<leader>tv` / `<leader>tf` | New terminal: bottom / right / floating |
| `<Esc><Esc>` | Leave terminal insert mode (inside a snacks terminal) |
| `<leader><leader>` | Find file by name |
| `<leader>/` or `<leader>sg` | Live grep the project |
| `<leader>sw` | Grep word under cursor |
| `<leader>sb` | Open buffers |
| `<leader>ss` | Symbols in current file |
| `<leader>sr` | Search and replace |
| `<leader>fr` | Recent files |
| `/` | Search in current buffer |
| `s` | Jump to any visible match (flash) |
| `gd` / `gr` / `K` | Definition / references / hover docs |
| `<leader>ca` | Code action |
| `<leader>cf` | Format buffer |
| `<leader>cd` | Line diagnostics |
| `]d` / `[d` | Next / previous diagnostic |
| `<leader>oa` | Ask OpenCode about selection/cursor (`@this`) |
| `<leader>os` | OpenCode menu (prompts, commands, sessions) |
| `go{motion}` | Send a motion/range to OpenCode |
| `<leader>gg` | Lazygit |
| `<leader>tc` | Toggle catppuccin macchiato (dark) / latte (light) |

### Full map

#### Leader: direct keys

| Key | Action |
|---|---|
| `<leader>,` | Switch Buffer |
| `<leader>-` | Split Window Below |
| `<leader>.` | Toggle Scratch Buffer |
| `<leader>/` | Grep (Root Dir) |
| `<leader>:` | Command History |
| `<leader><leader>` | Find Files (Root Dir) |
| `<leader><Tab><Tab>` | New Tab |
| `<leader><Tab>[` | Previous Tab |
| `<leader><Tab>]` | Next Tab |
| `<leader><Tab>d` | Close Tab |
| `<leader><Tab>f` | First Tab |
| `<leader><Tab>l` | Last Tab |
| `<leader><Tab>o` | Close Other Tabs |
| `<leader>?` | Buffer Keymaps (which-key) |
| `` <leader>` `` | Switch to Other Buffer |
| `<leader>E` | Explorer Snacks (cwd) |
| `<leader>e` | Explorer Snacks (root dir) |
| `<leader>K` | Keywordprg |
| `<leader>l` | Lazy |
| `<leader>L` | LazyVim Changelog |
| `<leader>n` | Notification History |
| `<leader>S` | Select Scratch Buffer |
| `<leader>|` | Split Window Right |

#### AI / OpenCode

| Key | Action |
|---|---|
| `<leader>oa` | Ask OpenCode |
| `<leader>os` | OpenCode menu |

#### Buffers

| Key | Action |
|---|---|
| `<leader>bb` | Switch to Other Buffer |
| `<leader>bd` | Delete Buffer |
| `<leader>bD` | Delete Buffer and Window |
| `<leader>bi` | Delete Invisible Buffers |
| `<leader>bj` | Pick Buffer |
| `<leader>bl` | Delete Buffers to the Left |
| `<leader>bo` | Delete Other Buffers |
| `<leader>bP` | Delete Non-Pinned Buffers |
| `<leader>bp` | Toggle Pin |
| `<leader>br` | Delete Buffers to the Right |

#### Code

| Key | Action |
|---|---|
| `<leader>cd` | Line Diagnostics |
| `<leader>cf` | Format |
| `<leader>cF` | Format Injected Langs |
| `<leader>cm` | Mason |
| `<leader>cS` | LSP references/definitions/... (Trouble) |
| `<leader>cs` | Symbols (Trouble) |

#### Debug

| Key | Action |
|---|---|
| `<leader>dph` | Toggle Profiler Highlights |
| `<leader>dpp` | Toggle Profiler |
| `<leader>dps` | Profiler Scratch Buffer |

#### Find / files

| Key | Action |
|---|---|
| `<leader>fb` | Buffers |
| `<leader>fB` | Buffers (all) |
| `<leader>fc` | Find Config File |
| `<leader>fE` | Explorer Snacks (cwd) |
| `<leader>fe` | Explorer Snacks (root dir) |
| `<leader>ff` | Find Files (Root Dir) |
| `<leader>fF` | Find Files (cwd) |
| `<leader>fg` | Find Files (git-files) |
| `<leader>fn` | New File |
| `<leader>fr` | Recent |
| `<leader>fR` | Recent (cwd) |
| `<leader>ft` | Terminal (Root Dir) |
| `<leader>fT` | Terminal (cwd) |

#### Git

| Key | Action |
|---|---|
| `<leader>gb` | Git Blame Line |
| `<leader>gB` | Git Browse (open) |
| `<leader>gc` | Commits |
| `<leader>gd` | Git Diff (files) |
| `<leader>gf` | Git Current File History |
| `<leader>gg` | Lazygit (Root Dir) |
| `<leader>gG` | Lazygit (cwd) |
| `<leader>gl` | Commits |
| `<leader>gL` | Git Log (cwd) |
| `<leader>gS` | Git Stash |
| `<leader>gs` | Status |
| `<leader>gY` | Git Browse (copy) |

#### Session / quit

| Key | Action |
|---|---|
| `<leader>qd` | Don't Save Current Session |
| `<leader>ql` | Restore Last Session |
| `<leader>qq` | Quit All |
| `<leader>qs` | Restore Session |
| `<leader>qS` | Select Session |

#### Search

| Key | Action |
|---|---|
| `<leader>s"` | Registers |
| `<leader>s/` | Search History |
| `<leader>sa` | Auto Commands |
| `<leader>sb` | Buffer Lines |
| `<leader>sc` | Command History |
| `<leader>sC` | Commands |
| `<leader>sD` | Buffer Diagnostics |
| `<leader>sd` | Diagnostics |
| `<leader>sg` | Grep (Root Dir) |
| `<leader>sG` | Grep (cwd) |
| `<leader>sh` | Help Pages |
| `<leader>sH` | Search Highlight Groups |
| `<leader>sj` | Jumplist |
| `<leader>sk` | Key Maps |
| `<leader>sl` | Location List |
| `<leader>sm` | Jump to Mark |
| `<leader>sM` | Man Pages |
| `<leader>sn` | +noice |
| `<leader>sna` | Noice All |
| `<leader>snd` | Dismiss All |
| `<leader>snh` | Noice History |
| `<leader>snl` | Noice Last Message |
| `<leader>snt` | Noice Picker (Telescope/FzfLua) |
| `<leader>sq` | Quickfix List |
| `<leader>sR` | Resume |
| `<leader>sr` | Search and Replace |
| `<leader>ss` | Goto Symbol |
| `<leader>sS` | Goto Symbol (Workspace) |
| `<leader>st` | Todo |
| `<leader>sT` | Todo/Fix/Fixme |
| `<leader>sw` | Selection (Root Dir) *(visual)* |
| `<leader>sW` | Selection (cwd) *(visual)* |
| `<leader>sw` | Word (Root Dir) |
| `<leader>sW` | Word (cwd) |

#### Terminal / theme

| Key | Action |
|---|---|
| `<leader>tc` | Toggle catppuccin light/dark |
| `<leader>tf` | New terminal (float) |
| `<leader>th` | New terminal (bottom) |
| `<leader>tv` | New terminal (right) |

#### UI toggles

| Key | Action |
|---|---|
| `<leader>ua` | Toggle Animations |
| `<leader>uA` | Toggle Tabline |
| `<leader>ub` | Toggle Dark Background |
| `<leader>uC` | Colorscheme with Preview |
| `<leader>uc` | Toggle Conceal Level |
| `<leader>ud` | Toggle Diagnostics |
| `<leader>uD` | Toggle Dimming |
| `<leader>uF` | Toggle Auto Format (Buffer) |
| `<leader>uf` | Toggle Auto Format (Global) |
| `<leader>ug` | Toggle Indent Guides |
| `<leader>uh` | Toggle Inlay Hints |
| `<leader>ui` | Inspect Pos |
| `<leader>uI` | Inspect Tree |
| `<leader>ul` | Toggle Line Numbers |
| `<leader>uL` | Toggle Relative Number |
| `<leader>un` | Dismiss All Notifications |
| `<leader>up` | Toggle Mini Pairs |
| `<leader>ur` | Redraw / Clear hlsearch / Diff Update |
| `<leader>uS` | Toggle Smooth Scroll |
| `<leader>us` | Toggle Spelling |
| `<leader>uT` | Toggle Treesitter Highlight |
| `<leader>uw` | Toggle Wrap |
| `<leader>uz` | Toggle Zen Mode |
| `<leader>uZ` | Toggle Zoom Mode |

#### Windows

| Key | Action |
|---|---|
| `<leader>wd` | Delete Window |
| `<leader>wm` | Toggle Zoom Mode |

#### Diagnostics / quickfix

| Key | Action |
|---|---|
| `<leader>xl` | Location List |
| `<leader>xL` | Location List (Trouble) |
| `<leader>xq` | Quickfix List |
| `<leader>xQ` | Quickfix List (Trouble) |
| `<leader>xt` | Todo (Trouble) |
| `<leader>xT` | Todo/Fix/Fixme (Trouble) |
| `<leader>xX` | Buffer Diagnostics (Trouble) |
| `<leader>xx` | Diagnostics (Trouble) |

#### LSP (attached buffers)

| Key | Action |
|---|---|
| `<a-n>` | Next reference (select) |
| `<a-p>` | Prev reference (select) |
| `<C-k>` | Signature help (insert) |
| `<leader>ca` | Code action |
| `<leader>cA` | Source action |
| `<leader>cC` | Refresh codelens |
| `<leader>cc` | Run codelens |
| `<leader>cd` | Line diagnostics |
| `<leader>cf` | Format buffer |
| `<leader>cl` | LSP info |
| `<leader>co` | Organize imports |
| `<leader>cR` | Rename file |
| `<leader>cr` | Rename symbol |
| `[[` | Prev reference |
| `]]` | Next reference |
| `gD` | Goto declaration |
| `gd` | Goto definition |
| `gI` | Goto implementation |
| `gK` | Signature help |
| `gr` | References |
| `gy` | Goto type definition |
| `K` | Hover docs |

#### Keys outside leader

| Key | Action |
|---|---|
| `<C-/>` | Terminal (Root Dir) |
| `<C-B>` | Scroll Backward |
| `<C-Down>` | Decrease Window Height |
| `<C-F>` | Scroll Forward |
| `<C-H>` | Go to left split/pane |
| `<C-J>` | Go to lower split/pane |
| `<C-K>` | Go to upper split/pane |
| `<C-L>` | Go to right split/pane |
| `<C-Left>` | Decrease Window Width |
| `<C-Right>` | Increase Window Width |
| `<C-S>` | Save File |
| `<C-Space>` | Treesitter Incremental Selection |
| `<C-Up>` | Increase Window Height |
| `<C-W><C-D>` | Show diagnostics under the cursor |
| `<C-W><Space>` | Window Hydra Mode (which-key) |
| `<C-W>d` | Show diagnostics under the cursor |
| `<Down>` | Down |
| `<Esc>` | Escape and Clear hlsearch |
| `<M-h>` | Resize split left |
| `<M-j>` | Move Down *(visual)* |
| `<M-j>` | Resize split down |
| `<M-k>` | Move Up *(visual)* |
| `<M-k>` | Resize split up |
| `<M-l>` | Resize split right |
| `<S-Tab>` | vim.snippet.jump if active, otherwise <S-Tab> |
| `<Tab>` | vim.snippet.jump if active, otherwise <Tab> |
| `<Up>` | Up |
| `[<C-L>` | :lpfile |
| `[<C-Q>` | :cpfile |
| `[<C-T>` | :ptprevious |
| `[<Space>` | Add empty line above cursor |
| `[a` | :previous |
| `[A` | :rewind |
| `[B` | Move buffer prev |
| `[b` | Prev Buffer |
| `[D` | Jump to the first diagnostic in the current buffer |
| `[d` | Prev Diagnostic |
| `[e` | Prev Error |
| `[l` | :lprevious |
| `[L` | :lrewind |
| `[n` | Select previous node *(visual)* |
| `[N` | Select previous sibling node *(visual)* |
| `[Q` | :crewind |
| `[q` | Previous Trouble/Quickfix Item |
| `[T` | :trewind |
| `[t` | Previous Todo Comment |
| `[w` | Prev Warning |
| `]<C-L>` | :lnfile |
| `]<C-Q>` | :cnfile |
| `]<C-T>` | :ptnext |
| `]<Space>` | Add empty line below cursor |
| `]A` | :last |
| `]a` | :next |
| `]B` | Move buffer next |
| `]b` | Next Buffer |
| `]D` | Jump to the last diagnostic in the current buffer |
| `]d` | Next Diagnostic |
| `]e` | Next Error |
| `]L` | :llast |
| `]l` | :lnext |
| `]n` | Select next node *(visual)* |
| `]N` | Select next sibling node *(visual)* |
| `]Q` | :clast |
| `]q` | Next Trouble/Quickfix Item |
| `]T` | :tlast |
| `]t` | Next Todo Comment |
| `]w` | Next Warning |
| `a` | Around textobject *(visual)* |
| `al` | Around last textobject *(visual)* |
| `an` | Around next textobject *(visual)* |
| `g[` | Move to left "around" |
| `g]` | Move to right "around" |
| `gc` | Toggle comment |
| `gcc` | Toggle comment line |
| `gcO` | Add Comment Above |
| `gco` | Add Comment Below |
| `go` | Send range to OpenCode |
| `grx` | vim.lsp.codelens.run() |
| `gx` | Opens filepath or URI under cursor with the system handler (file explorer, web browser, …) |
| `H` | Prev Buffer |
| `i` | Inside textobject *(visual)* |
| `il` | Inside last textobject *(visual)* |
| `in` | Inside next textobject *(visual)* |
| `j` | Down |
| `k` | Up |
| `L` | Next Buffer |
| `n` | Next Search Result |
| `N` | Prev Search Result |
| `R` | Treesitter Search *(visual)* |
| `s` | Flash |
| `S` | Flash Treesitter |

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
