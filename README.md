# WezTerm Neovim integration

Navigate out of Neovim into WezTerm panes allowing free navigation between Neovim and WezTerm panes.

## Installation

With [lazy.nvim](https://github.com/folke/lazy.nvim)

```lua
{
  'ianhomer/wezterm.nvim'
}
```

With [LazyVim](https://www.lazyvim.org/)

```lua
return {
  "ianhomer/wezterm.nvim",
  keys = function()
    return require("wezterm").keys()
  end,
  opts = {},
}
```

## Thanks

Inspiration and influence from <https://github.com/numToStr/Navigator.nvim>.
