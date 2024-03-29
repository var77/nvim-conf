local lsp = require('lsp-zero')
lsp.preset('recommended')
lsp.ensure_installed({
  'tsserver',
  'eslint',
  'lua_ls',
  'rust_analyzer',
  'pyright'
})

lsp.set_preferences({
  suggest_lsp_servers = false,
})

lsp.setup()

vim.diagnostic.config({
  virtual_text = true,
  signs = true,
  update_in_insert = false,
  underline = true,
  severity_sort = false,
  float = true,
})
vim.opt.signcolumn = 'yes'
-- prettier
vim.g.neoformat_try_node_exe = 1
