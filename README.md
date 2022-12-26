# Neovim Configuration

This is my-own little attempt at a neovim configuration that turns neovim into
an 'IDE'. For a complete list of plugins, see
[`lazy-lock.json`](lazy-lock.json). All plugin configurations can be found in
[`lua/plugins`](lua/plugins) and all language specific configuration can be
found in [`lua/plugins/languages`](lua/plugins/languages).

## LSP Support

![Screenshot](screenshots/lsp-integration.jpg)

For a complete list of supported languages, see
[`languages.lua`](lua/user/languages.lua)

## Fuzzy Finding

![Screenshot](screenshots/telescope.jpg)

## Integrated Terminal

![Screenshot](screenshots/toggleterm.jpg)

## Git Integration

![Screenshot](screenshots/git-integration.jpg)

## Debugging

![Screenshot](screenshots/dap-integration.jpg)

## Installation

```bash
# don't forget to backup your config beforehand
git clone https://github.com/meuter/nvim ~/.config/nvim 
cd ~/.config/nvim/
make install
```

The install script will take care of

*   installing the package manager [`lazy.nvim`](https://github.com/folke/lazy.nvim).
*   installing all plugins.
*   installing all Treesitter grammars for all supported languages.
*   installing all LSP servers for all supported languages.

## Trying it out

If you simply want to test this config without messing up your own, you can do
so in the provided Docker container:

```bash
git clone https://github.com/meuter/nvim /tmp/test
cd /tmp/test
make test
```

## Prerequisite

See [`Dockerfile`](Dockerfile) for the list of required packages (based on Ubuntu 20.04).
Adapt to your distro accordingly.
