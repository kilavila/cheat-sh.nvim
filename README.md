# cheat-sh.nvim

**cheat-sh.nvim** allows you to search the [cht.sh](https://cht.sh) website directly from Neovim,
enabling you to get code examples and documentation without leaving your editor.

## Installation

To install **cheat-sh.nvim**, add the following to your Neovim configuration:

```lua
{ 'git@codeberg.org:kilavila/cheat-sh.nvim' }
```

## Configuration

Add keybinding:

```lua
vim.keymap.set('n', '<leader>sc', '<cmd>lua require("cheat-sh").search()<cr>')
```

## Usage

Open the search window, type f.ex: `lua/:learn` and press enter.

You can also learn about cht.sh while using this plugin,
try searching for `:intro`, `:list` and `:help`.

## TODO

- [ ] Add completion for search field(using /:list)
- [ ] Language detection for syntax highlighting
