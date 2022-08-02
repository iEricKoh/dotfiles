local capabilities = vim.lsp.protocol.make_client_capabilities()

require("flutter-tools").setup({
	-- debugger = {
	-- 	enabled = true,
	-- 	run_via_dap = true,
	-- 	-- register_configurations = function(_)
	-- 	-- 	require("dap").configurations.dart = {}
	-- 	-- 	require("dap.ext.vscode").load_launchjs()
	-- 	-- end,
	-- },
	lsp = {
		-- color = {
		-- 	enabled = true,
		-- 	background = true,
		-- 	foreground = true,
		-- 	virtual_text = true,
		-- },
		capabilities = capabilities,
	},
})
