## Setup
- Install `neovim` https://neovim.io/
- Clone this repo under `~/.config/nvim`
- Open `neovim` and run `:PackerSync` to sync plugins

## Keybindings

### General
<leader> - space

<leader>pv - :wq!

<leader>q - :q!

<leader>w - :w!

,p - "p0 (paste last yanked buffer)

," - ""0 (paste last yanked buffer above the line)

<C-i> - next cursor position

<C-o> - prev cursor position

### Telescope
<C-p> (ctrl+p) - telescope find files (like in vscode)

<leader>fg - telescope search for text in files

<leader>tg - show git status in telescope

<leader>fc - find in clipboard history (then <cr> will copy to yank register and <c-p> will paste under cursor)

### Git
<leader>gdf - Git diff of current file

<leader>tg - show git status in telescope

### File Tree
<C-b> (ctrl+b) - toggle tree

a - create new file

r - rename file

d - delete file

c - copy file

p - paste file

### Undo tree
<leader>u - toggle undo tree

### Multi Cursor
<c-n> (ctrl+n) - select next accurance of text under cursor or selected

### LSP
<leadr>r - rename variable under cursor

gd - go to definition of variable under the cursor

gr - show implementations of variable under the cursor

<leader>f - format text with :LspZeroFormat
