# nvim-07

Even on Neovim v0.7 we can have nice things.

This configuration is just a fun example of how we can use Neovim's `runtimepath` to make a modular setup.

## Requirements

* Neovim v0.7 or greater
* git.
* A `C` compiler. Can be `gcc`, `tcc` or `zig`.

## Installation

* Clone this repository in Neovim's configuration folder.

  If you don't know the location of that folder, use this command in your terminal.

  ```sh
  nvim --headless -c 'echo stdpath("config") | echo "" | quit'
  ```

* After you cloned the repository in Neovim's folder, start Neovim using this command in your terminal.

  ```sh
  nvim
  ```

  The plugin manager will be installed automatically. And then all the plugins will be installed.

## Plugin list

| Name                                                                                            | Description                                                           |
| ---                                                                                             | ---                                                                   |
| [bufferline.nvim](https://github.com/akinsho/bufferline.nvim)                                   | Show open files in the tabline.                                       |
| [mini.nvim](https://github.com/echasnovski/mini.nvim)                                           | Collection of independent lua modules that enhance Neovim's features. |
| [gitsigns.nvim](https://github.com/lewis6991/gitsigns.nvim)                                     | Shows indicators in gutter based on file changes detected by git.     |
| [vim-fugitive](https://github.com/tpope/vim-fugitive)                                           | Git integration into Neovim/Vim.                                      |
| [nvim-treesitter](https://github.com/nvim-treesitter/nvim-treesitter)                           | Configures treesitter parsers. Provides modules to manipulate code.   |
| [vim-repeat](https://github.com/tpope/vim-repeat)                                               | Add "repeat" support for plugins.                                     |
| [toggleterm.nvim](https://github.com/akinsho/toggleterm.nvim)                                   | Manage terminal windows easily.                                       |
| [nvim-tree.lua](https://github.com/kyazdani42/nvim-tree.lua)                                    | File explorer.                                                        |
| [nvim-lspconfig](https://github.com/neovim/nvim-lspconfig)                                      | Quickstart configs for Neovim's LSP client.                           |
| [nvim-cmp](https://github.com/hrsh7th/nvim-cmp)                                                 | Autocompletion engine.                                                |
| [cmp-buffer](https://github.com/hrsh7th/cmp-buffer)                                             | nvim-cmp source. Suggest words in the current buffer.                 |
| [cmp-path](https://github.com/hrsh7th/cmp-path)                                                 | nvim-cmp source. Show suggestions based on file system paths.         |
| [cmp-nvim-lsp](https://github.com/hrsh7th/cmp-nvim-lsp)                                         | nvim-cmp source. Show suggestions based on LSP servers queries.       |
| [cmp-vsnip](https://github.com/hrsh7th/cmp-vsnip)                                               | nvim-cmp source. Show suggestions based on installed snippets.        |
| [friendly-snippets](https://github.com/rafamadriz/friendly-snippets)                            | Collection of snippets.                                               |
| [vim-vsnip](https://github.com/hrsh7th/vim-vsnip)                                               | Snippet engine.                                                       |

