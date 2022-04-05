local telescope = require("telescope")

telescope.load_extension("flutter")
telescope.load_extension("dap")

telescope.setup({
	defaults = {
		-- Default configuration for telescope goes here:
		-- config_key = value,
		mappings = require("keybindings").telescope,
	},
	pickers = {
		-- Default configuration for builtin pickers goes here:
		-- picker_name = {
		--   picker_config_key = value,
		--   ...
		-- }
		-- Now the picker_config_key will be applied every time you call this
		-- builtin picker
	},
	extensions = {
		-- Your extension configuration goes here:
		extension_name = {
			-- extension_config_key = "flutter",
		},
		-- please take a look at the readme of the extension you want to configure
	},
})
