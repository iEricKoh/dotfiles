local enhance_server_opts = function(options)
	options.on_attach = function(client, bufnr)
		require("flutter-tools").setup({
			lsp = {
				capabilities = vim.lsp.protocol.make_client_capabilities(),
			},
		})
	end
end

return { enhance_server_opts = enhance_server_opts }
