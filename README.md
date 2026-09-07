# Neovim configuration

- Plugins are managed with [lazy.nvim](https://github.com/folke/lazy.nvim); plugin specs live in `lua/plugins/`.
- Options, keymaps, and the lazy.nvim bootstrap take effect via `init.lua`.
- Run `:Lazy` in Neovim to view, install, or update plugins.

## Minimal mode

A plugin-free setup that loads only options and keymaps (no lazy.nvim, no plugins):

```sh
NVIM_MINIMAL=1 nvim
```