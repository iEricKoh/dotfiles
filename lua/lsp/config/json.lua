require("lsp.config.common")

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true

local opts = {
	settings = {
		json = {
			schemas = require("schemastore").json.schemas(),
		},
	},
	capabilities = capabilities,
	flags = {
		debounce_text_changes = 150,
	},
	on_attach = on_attach,
}

return {
	on_setup = function(server)
		server:setup(opts)
	end,
}
