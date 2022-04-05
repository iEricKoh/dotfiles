local status, nvim_tree = pcall(require, "nvim-tree")

if not status then
	vim.notify("nvim-tree is not available.")
	return
end

local list_keys = require("keybindings").nvim_tree

nvim_tree.setup({
	git = {
		enable = false,
	},
	-- required for project plugin
	update_cwd = true,
	update_focused_file = {
		enable = true,
		update_cwd = true,
	},
	-- hiding dotfiles, node_modules
	filters = {
		dotfiles = true,
		custom = { "node_modules" },
	},
	view = {
		side = "right",
		hide_root_folder = false,
		mappings = {
			custom_only = false,
			list = list_keys,
		},
	},
	actions = {
		open_file = {
			resize_window = true,
			quit_on_open = false,
		},
	},
})

vim.api.nvim_exec(
	[[
    autocmd BufEnter * ++nested if winnr('$') == 1 && bufname() == 'NvimTree_' . tabpagenr() | quit | endif
  ]],
	true
)
