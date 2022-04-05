require("lsp.config.common")

local capabilities = vim.lsp.protocol.make_client_capabilities()

local opts = {
	on_attach = function(client, bufnr)
		client.resolved_capabilities.document_formatting = false
		client.resolved_capabilities.document_range_formatting = false

		require("flutter-tools").setup({
			lsp = {
				capabilities = capabilities,
			},
		})
		-- vim.cmd("autocmd BufWritePre <buffer> lua vim.lsp.buf.formatting_sync()")
	end,
}

return {
	on_setup = function(server)
		server:setup(opts)
	end,
}
