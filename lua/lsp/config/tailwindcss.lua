require("lsp.config.common")

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true

local opts = {
	settings = {
		tailwindCSS = {
			rootFontSize = 10,
		},
	},
	capabilities = capabilities,
	on_attach = on_attach,
}

return {
	on_setup = function(server)
		server:setup(opts)
	end,
}
