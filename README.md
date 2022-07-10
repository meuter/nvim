# Neovim Configuration

This is my-own little attempt at neovim configuration that turns neovim into an 'IDE'. 
This configuration has basic support for LSP, Debugging and other goodies for most programming 
languages I use: C/C++, python, Rust, Go, Lua, Dockerfile, bash, etc.

Tested on neovim 0.7 on Linux.

## Installation

```bash
git clone https://github.com/meuter/nvim ~/.config/nvim
nvim --headless -u ~/.config/nvim/install.lua
```

By default all plugins are pinned to commits referenced in 
[`packer_lock.lua`](https://github.com/meuter/nvim/blob/main/lua/user/packer_lock.lua).
To install all plugins from HEAD, set environment variable `NVIM_CONFIG_INSTALL_ALL_FROM_MASTER` to `1`:

```bash
git clone https://github.com/meuter/nvim ~/.config/nvim
NVIM_CONFIG_INSTALL_ALL_FROM_MASTER=1 nvim --headless -u ~/.config/nvim/install.lua
```

This will update [`packer_lock.lua`](https://github.com/meuter/nvim/blob/main/lua/user/packer_lock.lua) 
with newly pinned commits.

## Testing

You can test out the configuration in a Docker container:
```bash
mkdir /tmp/test
cd /tmp/test
git clone https://github.com/meuter/nvim /tmp/test
cd /tmp/test
make test
```

## Prerequisite

See [`Dockerfile`](https://github.com/meuter/nvim/blob/main/Dockerfile) on Ubuntu 22.04. Adapt accordingly to your distro.


