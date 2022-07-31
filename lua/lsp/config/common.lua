function on_attach(client, bufnr)
  client.server_capabilities.document_formatting = false
  client.server_capabilities.document_range_formatting = false

  local function buf_set_keymap(...)
    vim.api.nvim_buf_set_keymap(bufnr, ...)
  end

  require("keybindings").lsp(buf_set_keymap)
end
