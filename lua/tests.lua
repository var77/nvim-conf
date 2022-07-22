local f = function()
  local x = 5
  print(x)
end

function GlobalFunction()
  local position_params = vim.lsp.util.make_position_params()
  local new_name = vim.fn.input("New name for Nick's thing >");

  position_params.new_name = new_name

  vim.lsp.buf_request(0, 'textDocument/rename', position_params, function(err, method, result, ...)
    print(err, method)
    vim.pretty_print(result)

    vim.lsp.handlers["textDocument/rename"](err, method, result, ...)
  end)
end
