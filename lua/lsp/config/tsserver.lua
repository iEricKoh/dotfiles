require("lsp.config.common")

local status_ok, keybindings = pcall(require, "keybindings")

local opts = {
	flags = {
		debounce_text_changes = 150,
	},
	on_attach = function(client, bufnr)
		on_attach(client, bufnr)

		local function buf_set_keymap(...)
			vim.api.nvim_buf_set_keymap(bufnr, ...)
		end
		--
		local ts_utils = require("nvim-lsp-ts-utils")
		ts_utils.setup({
			debug = false,
			disable_commands = false,
			enable_import_on_completion = false,
			-- import all
			import_all_timeout = 5000, -- ms
			-- lower numbers = higher priority
			import_all_priorities = {
				same_file = 1, -- add to existing import statement
				local_files = 2, -- git files or files with relative path markers
				buffer_content = 3, -- loaded buffer content
				buffers = 4, -- loaded buffer names
			},
			import_all_scan_buffers = 100,
			import_all_select_source = false,
			-- filter diagnostics
			filter_out_diagnostics_by_severity = {},
			filter_out_diagnostics_by_code = {},
			-- inlay hints
			auto_inlay_hints = true,
			inlay_hints_highlight = "Comment",
			-- update imports on file move
			update_imports_on_move = false,
			require_confirmation_on_move = false,
			watch_dir = nil,
		})
		-- required to fix code action ranges and filter diagnostics
		ts_utils.setup_client(client)
		-- no default maps, so you may want to define some here
		keybindings.lsp_tsserver(buf_set_keymap)
	end,
}

return {
	on_setup = function(server)
		server:setup(opts)
	end,
}
