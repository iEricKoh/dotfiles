local null_ls = require("null-ls")

local formatting = null_ls.builtins.formatting
local diagnostics = null_ls.builtins.diagnostics
local code_actions = null_ls.builtins.code_actions

null_ls.setup({
	debug = false,
	sources = {
		-- formatting.prettier,
		formatting.prettier.with({
			filetypes = {
				"javascript",
				"javascriptreact",
				"typescript",
				"typescriptreact",
				"vue",
				"css",
				"scss",
				"less",
				"html",
				"json",
				"yaml",
				"graphql",
			},
			prefer_local = "node_modules/.bin",
		}),
		formatting.stylua,
		diagnostics.eslint,
	},
	-- #{m}: message
	-- #{s}: source name (defaults to null-ls if not specified)
	-- #{c}: code (if available)
	diagnostics_format = "[#{s}] #{m}",
	on_attach = function(_)
		vim.cmd([[ command! Format execute 'lua vim.lsp.buf.formatting()']])
		-- if client.resolved_capabilities.document_formatting then
		--   vim.cmd("autocmd BufWritePre <buffer> lua vim.lsp.buf.formatting_sync()")
		-- end
	end,
})
