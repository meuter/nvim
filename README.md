# Neovim Configuration

This is my-own little attempt at a neovim configuration that turns neovim into
my own little '[PDE](https://www.youtube.com/watch?v=QMVIJhC9Veg&ab_channel=TJDeVries)'.
For a complete list of plugins, see [`lazy-lock.json`](lazy-lock.json). All plugin
configurations can be found in [`lua/plugins`](lua/plugins).

## Fuzzy Finding

Fuzzy finding using [snacks.picker](https://github.com/folke/snacks.nvim/blob/main/docs/picker.md).

## Language Support

Language support for C/C++, Rust, Python, Docker and more out of the box with
proper syntax highlighting using [treesitter](https://github.com/nvim-treesitter/nvim-treesitter)
and completion using [blink.cmp](https://github.com/Saghen/blink.cmp).

## Integrated Terminal

Integrated terminal using [toggleterm](https://github.com/akinsho/toggleterm.nvim).

## Git Integration

Git integration using [neotree](https://github.com/nvim-neo-tree/neo-tree.nvim) to
view modified, added or removed files and [vim-fugitive](https://github.com/tpope/vim-fugitive)
to commit.

## Installation

```bash
# don't forget to backup your config beforehand
git clone https://github.com/meuter/nvim ~/.config/nvim
cd ~/.config/nvim/
```

When Neovim starts, everything will be installed automatically:

- the package manager [`lazy.nvim`](https://github.com/folke/lazy.nvim).
- all plugins.
- all Treesitter grammars for all languages supported out of the box.
- all LSP servers for all languages supported out of the box.

## Font

You will need a [patched font](https://www.nerdfonts.com/) including the latest
[codicons](https://github.com/microsoft/vscode-codicons) glyphs.

For convenience, [Fira Code Regular Nerd Font Complete](font/Fira%20Code%20Regular%20Nerd%20Font%20Complete.ttf),
patched manually by yours truly is available in [`font`](font/)

## Trying it out

### Using Docker

You can try out this config side-by-side any other config and run it using the
`NVIM_APPNAME` environement variable:

```bash
git clone https://github.com/meuter/nvim ~/.config/meuter-nvim
NVIM_APPNAME=meuter-nvim nvim
```

## Shameless Plug

If you like the status bar, please take a look at
[`lualine-so-fancy.nvim`](https://github.com/meuter/lualine-so-fancy.nvim),
but you might also enjoy [`habamax-plus.nvim`](https://github.com/meuter/habamax-plus.nvim)
which is a custom fork of the awesome [`habamax`](https://github.com/habamax/vim-habamax),
built into neovim.

This config is part of my dotfiles that can be found [here](https://github.com/meuter/dotfiles).
