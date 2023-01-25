vim.g.mapleader = " "
vim.keymap.set("n", "<leader>wq", ":wq<CR>")
vim.keymap.set("n", "<leader>w", ":w<CR>")
vim.keymap.set("n", "<leader>q", ":q!<CR>")

vim.keymap.set({ "n", "v" }, "<Up>", "<Nop>")
vim.keymap.set({ "n", "v" }, "<Down>", "<Nop>")
vim.keymap.set({ "n", "v" }, "<Left>", "<Nop>")
vim.keymap.set({ "n", "v" }, "<Right>", "<Nop>")

vim.keymap.set({ "n", "v" }, ",p", '"0p')
vim.keymap.set({ "n", "v" }, ",P", '"0P')
vim.keymap.set({ "n" }, "<leader>f", ':LspZeroFormat<CR>')
vim.keymap.set({ "n" }, "<leader>r", '<cmd>lua vim.lsp.buf.rename()<CR>')
vim.keymap.set({ "n" }, "<leader>tg", ':Telescope git_status<CR>')
vim.keymap.set({ "n" }, "<leader>gdf", ':Gvdiff<CR>')
