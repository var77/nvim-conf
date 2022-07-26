 require("formatter").setup(
   {
     logging = false,
     filetype = {
       javascript = {
         -- prettier
         function()
           print(vim.fn.getcwd())
           return {
             exe = vim.fn.getcwd() .. "/node_modules/.bin/prettier",
             args = {"--stdin-filepath", vim.api.nvim_buf_get_name(0), "--single-quote"},
             stdin = true
           }
         end
       },
       typescript = {
         -- prettier
         function()
           print(vim.fn.getcwd())
           return {
             exe = vim.fn.getcwd() .. "/node_modules/.bin/prettier",
             args = {"--stdin-filepath", vim.api.nvim_buf_get_name(0), "--single-quote"},
             stdin = true
           }
         end
       },
       typescriptreact = {
         -- prettier
         function()
           print(vim.fn.getcwd())
           return {
             exe = vim.fn.getcwd() .. "/node_modules/.bin/prettier",
             args = {"--stdin-filepath", vim.api.nvim_buf_get_name(0), "--single-quote"},
             stdin = true
           }
         end
       },
       lua = {
         -- luafmt
         function()
           return {
             exe = "luafmt",
             args = {"--indent-count", 2, "--stdin"},
             stdin = true
           }
         end
       }
     }
   }
 )
-- 
-- vim.api.nvim_exec(
--   [[
-- augroup FormatAutogroup
--   autocmd!
--   autocmd BufWritePost *.js,*.ts,*.tsx,*.lua FormatWrite
-- augroup END
-- ]],
--   true
-- )
