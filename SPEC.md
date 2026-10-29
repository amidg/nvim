# Spec for my nvim environment

Intent-first spec. It describes what the environment must do and why; exact
plugins and keymaps may change during implementation as long as the intent is
kept. Written based on the state of the Neovim ecosystem as of late 2026.

## Context

Rebuild from scratch. The current config is an old-style hand-rolled
`lazy.nvim` setup built around coc.nvim, airline, telescope and vimscript-era
plugins, which predates native `vim.lsp.config` (Neovim 0.11+) and the current
ecosystem. The rebuild starts from the **LazyVim** distro and layers overrides
on top, in the same style the existing repo already uses (`lua/plugins/*.lua`
override files) — this preserves muscle memory of a per-concern file layout
while inheriting sane, maintained defaults.

Non-goals (explicitly out of scope):

- avante.nvim / codecompanion.nvim — the opencode integration covers the AI
  workflow.
- vim-tmux-navigator — superseded by smart-splits (goal 1).
- Inline token-level LLM autocompletion — optional future item (goal 3).
- Session persistence frameworks — later, if needed.
- coc.nvim — replaced by native LSP + blink.cmp.

## Goal 1 — Multi-window layout, inside and across tmux

The environment is a window manager: any number of vertical and horizontal
splits, freely mixed, plus terminals sharing the same space. Navigation must
be effortless, that is the point — not the number of splits.

Intent:

- Nvim-native splits and tabs are the primary layout tool; no layout framework
  gets in the way.
- When running under tmux, pane navigation must cross the nvim/tmux boundary
  with the same keys: moving past the edge of an nvim split lands in the next
  tmux pane and vice versa.
- Same-key resize and window/buffer swapping are part of this, not extras.
- Terminal windows are first-class citizens in this navigation.
- Open buffers are switchable tab-style, over all open buffers — not a
  hand-curated pin list (the old harpoon-style restriction is explicitly
  rejected): cycle prev/next with two dedicated keys, jump to a buffer by a
  quick pick gesture, and reorder — without dropping into a picker for the
  common case. A picker remains the fallback for the full buffer list, and a
  single "last buffer" key covers two-file toggling.

Preferred approach: smart-splits.nvim plus a matching block in `~/.tmux.conf`
(the tmux side must be updated for this to work — the spec calls this out as a
required companion change), and bufferline-style tab switching via LazyVim's
default bufferline plugin — cycling keys only, no new plugin needed.

## Goal 2 — Real terminal sessions inside nvim

Terminals inside nvim must be real, daily-driver shell sessions, not toy
popups: full `.bashrc` (aliases, prompt, environment), persistent while the
session lives, multiple at once, toggleable, and navigable like any other
window (goal 1 applies to them).

Intent:

- One key toggles a default terminal (bottom split); extra terminals can be
  opened as additional splits (horizontal or vertical) or floats.
- Running `opencode` (and similar TUI agents) inside these terminals must work
  like a normal terminal — the agent session is just another pane next to
  code windows.
- Leaving terminal insert-mode back to nvim must be easy and never fight the
  agent's own keys.

Preferred approach: snacks.nvim terminal, split windows with winbar titles.

## Goal 3 — Language server + autocomplete, optional AI layer

Autocompletion must come from a language server by default, feel instant, and
support the languages actually used: lua, python, ts/js, css/html (list is
extendable; servers install themselves on first open of a filetype).

Intent:

- LSP, completion, formatting, snippets and treesitter work out of the box
  from LazyVim defaults (nvim-lspconfig + mason + blink.cmp). Config code for
  this should be near zero — only language lists and small tweaks.
- The optional layer: editor-aware AI through opencode. Send prompts with
  context (`@this` selection/cursor, `@buffer`, `@diagnostics`) from inside
  nvim to the running opencode daemon (OpenCode Go provider); review agent
  edits as diffs with per-hunk accept/reject; buffers reload automatically
  when the agent edits files.

Preferred approach: opencode.nvim. A blink.cmp LLM-completion source is
parked as a future optional add-on, not part of the v1 build. blink.cmp is
pinned to `version = "1.*"`: v1 ships prebuilt binaries (glibc), while v2
requires Neovim 0.12+ and an in-nvim Cargo build — re-evaluate after Neovim
0.12 is stable in the home package manager.

## Goal 4 — Search: buffer, repo, files-by-name

Three searches, each with a default, fast path:

- In open buffer: native `/` search plus labeled multi-cursor-style jumping
  (flash.nvim, already part of LazyVim).
- In all files of the repo: live grep across the project with a picker;
  grep-the-word-under-cursor as the most common entry point.
- Find file by name: fuzzy file finder that gets me from a substring to a file
  instantly; recently opened files weighted up.

Preferred approach: fzf-lua as the single picker for repo jumps; native for
buffer search; flash for movement. Note: LazyVim 16 ships no picker by default
— pickers moved to opt-in extras, so the fzf extra must be imported from
`lua/config/lazy.lua` (imports from `lua/plugins/*` are ignored for extras).

## Dependency installation (Bluefin / immutable Fedora)

The host is Bluefin (bootc image); nothing is layered into the image. Command
line tools live in Homebrew, which Bluefin ships and preconfigures out of the
box. Verified against the actual machine (not docs):

Already present on the host image — do **not** install:
`nvim 0.12.6`, `git 2.56`, `curl`, `tar`, `gzip`, `unzip`, `tmux 3.8`,
`gcc 16.2` (visible as `gcc`, so no `cc`-alias quirk), `make`, `ripgrep 15.2`,
`fzf 0.74.5` (≥ 0.25.1), `wl-clipboard`, Nerd Fonts (COPR layer), `brew`,
and `opencode v2.1.4` (already via the ublue tap — no separate installer).

To install via brew (the only delta):
- `fd` (file finder for the picker)
- `lazygit` (git UI used by LazyVim extras)
- `tree-sitter-cli` (CLI required by nvim-treesitter's main branch; the
  `tree-sitter` brew formula is only the library)

Intent:

- Everything outside the image stays under Homebrew or inside nvim's own data
  dir (mason-managed servers, treesitter parsers).
- Neovim version. The image already carries 0.12.6. blink.cmp therefore stays
  pinned to `version = "1.*"` until its v2 stabilizes — v1's prebuilt glibc
  binary works as-is; v2 would additionally need a Cargo build step.
- Opacity to updates: mason servers and parsers live under
  `~/.local/share/nvim` and survive image rebase.

## Migration steps

1. Install dependencies via the home-filesystem package manager (see
   "Dependency installation").
2. Back up and archive the current config: `~/.config/nvim`,
   `~/.local/share/nvim`, `~/.local/state/nvim`.
3. Install a fresh LazyVim starter here; keep `catppuccin` (macchiato/latte
   toggle) from the old config.
4. Implement goals as a small number of override files mirroring the goal
   structure: windows (goal 1), terminal (goal 2), ai/opencode (goal 3),
   editor/search (goal 4).
5. Update `~/.tmux.conf` with the navigation block (goal 1 requirement).
6. Verify with `:Lazy sync`, `:checkhealth`; migrate harpoon-style file
   pinning from the old config only if the bufferline tab workflow proves
   insufficient (goal 1).

## Success criteria

- A keymap cheat-sheet documents every non-default key introduced by this
  spec; nothing else needs memorizing.
- Goal checks: can open 4+ arbitrary splits incl. two terminals, navigate all
  of them without touching the mouse; completion is LSP-backed and instant;
  `opencode` edits flow back into open buffers as reviewable diffs; a filename
  substring opens any repo file in under a second.
