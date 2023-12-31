# telescope-urls.nvim

A minimal [telescope](https://github.com/nvim-telescope/telescope.nvim)
extension for fuzzy searching and launching URLs in your browser.

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

Command:

`:Telescope urls`

Lua API:

`require("telescope").extensions.urls.urls`

NeoVim keymapping:

```lua
vim.keymap.set( "n", "<leader>uu", require("telescope").extensions.urls.urls, { noremap = true, desc = "Telescope: URLs" })
```

## Related Projects

For a more robust Telescope extension, see [urlview.nvim](https://github.com/axieax/urlview.nvim).

## License

MIT
