require("lsp.config.common")

local opts = {
	flags = {
		debounce_text_changes = 150,
	},
	on_attach = on_attach,
}

return {
	on_setup = function(server)
		require("rust-tools").setup({
			server = vim.tbl_deep_extend("force", server:get_default_options(), opts),
		})
		server:attach_buffers()
	end,
}
