-- local opts = {
-- 	flags = {
-- 		debounce_text_changes = 150,
-- 	},
-- 	on_attach = on_attach,
-- }
--
-- return {
-- 	on_setup = function(server)
-- 		require("rust-tools").setup({
-- 			server = vim.tbl_deep_extend("force", server:get_default_options(), opts),
-- 		})
-- 		server:attach_buffers()
-- 	end,
-- }

local enhance_server_opts = function(options)
	options.flags = {
		debounce_text_changes = 150,
	}
end

return { enhance_server_opts = enhance_server_opts }
