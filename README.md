# telescope-urls.nvim

A [telescope](https://github.com/nvim-telescope/telescope.nvim) extension for
fuzzy searching and launching URLs in your browser.

## Install

Install using your favorite neovim plugin manager.

Example using [Lazy](https://github.com/folke/lazy.nvim):

```lua
require("lazy").setup({
    {
        "https://github.com/nvim-telescope/telescope.nvim",
        branch = "0.1.x",
        dependencies = {
          "https://github.com/pbnj/telescope-urls.nvim",
        },
        config = function()
          pcall(require("telescope").load_extension, "urls")
        end,
    }
})
```

## Usage

`:Telescope urls`

## License

MIT
