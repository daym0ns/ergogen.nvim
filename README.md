# ergogen.nvim

## Installation

```lua
{
  'daym0ns/ergogen.nvim',
  config = function()
    require("ergogen").setup({})
  end
}
```

## Usage
Open your `input.yaml` file in neovim. Use the `:Ergogen` command to preview the svg.
There is no configuration needed other than calling the setup function with no arguments.
