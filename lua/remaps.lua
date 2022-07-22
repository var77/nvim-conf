local vimp = require("vimp")

-- Quick fix list
vimp.nnoremap("<leader>ql", ":copen<CR>")

-- My personal mappings
vimp.xnoremap("H", "^")
vimp.xnoremap("L", "$")
vimp.onoremap("in(", "<c-u>normal! f(vi(<cr>")
vimp.inoremap("jk", "<esc>")

-- removing bad habbits
-- vimp.inoremap("<esc>", "<nop>")
-- vimp.inoremap("<Left>", "<nop>")
-- vimp.inoremap("<Right>", "<nop>")
-- vimp.inoremap("<Up>", "<nop>")
-- vimp.inoremap("<Down>", "<nop>")

-- Window management
vimp.nnoremap("<leader>h", ":wincmd h<CR>")
vimp.nnoremap("<leader>j", ":wincmd j<CR>")
vimp.nnoremap("<leader>k", ":wincmd k<CR>")
vimp.nnoremap("<leader>l", ":wincmd l<CR>")

-- Undo tree
vimp.nnoremap("<leader>u", ":UndotreeShow<CR>")

-- Vimrc related
vimp.nnoremap("<leader>ev", ":vsplit $MYVIMRC<cr>")
vimp.nnoremap("<leader>sv", ":luafile $MYVIMRC<CR>")
