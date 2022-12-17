require("telescope").setup {
  extensions = {
    fzf = {
      fuzzy = true, -- false will only do exact matching
      override_generic_sorter = false, -- override the generic sorter
      override_file_sorter = true, -- override the file sorter
      case_mode = "smart_case" -- or "ignore_case" or "respect_case"
      -- the default case_mode is "smart_case"
    }
  }
}
-- To get fzf loaded and working with telescope, you need to call
-- load_extension, somewhere after setup function:
require("telescope").load_extension("fzf")
require("telescope").load_extension("neoclip")

-- TELECSOPE bindings
vim.keymap.set("n", "<C-P>", ":lua require('telescope.builtin').find_files({ path_display = { shorten = 5 } })<cr>")
vim.keymap.set("n", "<leader>fg", "<cmd>Telescope live_grep<cr>")
vim.keymap.set("n", "<leader>fb", "<cmd>Telescope buffers<cr>")
vim.keymap.set("n", "<leader>fh", "<cmd>Telescope help_tags<cr>")
vim.keymap.set("n", "<leader>fs", "<cmd>Telescope search_history<cr>")
vim.keymap.set("n", "<leader>fu", "<cmd>Telescope grep_string<cr>")
vim.keymap.set("n", "<leader>fc", "<cmd>Telescope neoclip<cr>")
