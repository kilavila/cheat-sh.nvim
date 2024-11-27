# cheat-sh.nvim

**cheat-sh.nvim** allows you to search the [cht.sh](https://cht.sh) website directly from Neovim,
enabling you to get code examples and documentation without leaving your editor.

## Installation

To install **cheat-sh.nvim**, add the following to your Neovim configuration:

```lua
{ 'kilavila/cheat-sh.nvim' }
```

## Configuration

Add keybinding:

```lua
vim.keymap.set('n', '<leader>sc', '<cmd>lua require("cheat-sh").search()<cr>')
vim.keymap.set('n', '<leader>sx', '<cmd>lua require("cheat-sh").get_cursor_word(true)<cr>')
-- [[
    get_cursor_word(true) will open the search window so you can edit the query
    without or set to false will run the search on cursor word
]]
```

## Usage

Open the search window, type f.ex: `lua/:learn` and press enter.

You can also learn about cht.sh while using this plugin,
try searching for `:intro`, `:list` and `:help`.

## TODO

- [ ] Add completion for search field(using /:list)
- [ ] Language detection for syntax highlighting
