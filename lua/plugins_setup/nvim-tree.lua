local vimp = require("vimp")

local tree_cb = require "nvim-tree.config".nvim_tree_callback
vimp.nnoremap("<c-b>", ":NvimTreeToggle<CR>")
vimp.nnoremap("<leader>tf", ":NvimTreeFindFile<CR>")
vimp.nnoremap("<leader>=", ":NvimTreeResize 100<CR>")
vimp.nnoremap("<leader>-", ":NvimTreeResize 40<CR>")

require "nvim-tree".setup {
  update_cwd = true,
  view = {
    relativenumber = true,
    mappings = {
      list = {
        {key = "s", cb = tree_cb("vsplit")},
        {key = "h", cb = tree_cb("split")}
      }
    }
  },
  renderer = {
    highlight_opened_files = 'all',
    highlight_git = true,
    add_trailing = true,
    group_empty = true
  }
}
