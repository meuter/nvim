# Neovim Configuration

This is my-own little attempt at a neovim configuration that turns neovim into
my own little '[PDE](https://www.youtube.com/watch?v=QMVIJhC9Veg&ab_channel=TJDeVries)'.
For a complete list of plugins, see [`lazy-lock.json`](lazy-lock.json). All plugin
configurations can be found in [`lua/plugins`](lua/plugins).

## Fuzzy Finding

![Screenshot](screenshots/telescope.png)

## LSP Support

![Screenshot](screenshots/lsp.png)

## Integrated Terminal

![Screenshot](screenshots/terminal.png)

## Git Integration

![Screenshot](screenshots/git-diff.png)
![Screenshot](screenshots/git-commit.png)

## Debugging

![Screenshot](screenshots/debug.png)

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
- all [`nvim-dap`](https://github.com/mfussenegger/nvim-dap) debuggers.

## Font

You will need a [patched font](https://www.nerdfonts.com/) including the latest
[codicons](https://github.com/microsoft/vscode-codicons) glyphs. All screenshots were taken using
[Fira Code Regular Nerd Font Complete](font/Fira%20Code%20Regular%20Nerd%20Font%20Complete.ttf),
patched manually by yours truly and [Windows Terminal](https://apps.microsoft.com/store/detail/windows-terminal/9N0DX20HK701).

## Trying it out

If you simply want to test this config without messing up your own, you can do
so in the provided Docker container:

```bash
git clone https://github.com/meuter/nvim /tmp/test
cd /tmp/test
make test
```

This will compile the docker container and run nvim inside it.

## Shameless Plug

If you like the status bar, please take a look at [`lualine-so-fancy.nvim`](https://github.com/meuter/lualine-so-fancy.nvim).
If you like the color scheme, please take a look at [`habamax-plus.nvim`](https://github.com/meuter/habamax-plus.nvim) which
is a custom spin of fork of the awesome [`habamax`](https://github.com/habamax/vim-habamax), built into neovim.

## Prerequisite

See [`Dockerfile`](Dockerfile) for the list of required packages (based on Ubuntu 20.04).
Adapt to your distro accordingly.
