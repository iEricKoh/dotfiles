local _, keybindings = pcall(require, "keybindings")

return {
	enhance_server_opts = function(options)
		options.on_attach = function(client, bufnr)
			local ts_utils = require("nvim-lsp-ts-utils")
			ts_utils.setup({})
			ts_utils.setup_client(client)

			local function buf_set_keymap(...)
				vim.api.nvim_buf_set_keymap(bufnr, ...)
			end

			keybindings.lsp_tsserver(buf_set_keymap)
		end
	end,
}
