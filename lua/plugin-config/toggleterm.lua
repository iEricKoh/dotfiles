require("toggleterm").setup({
	open_mapping = [[<leader>t]],
	direction = "float",
	close_on_exit = true, -- close the terminal window when the process exits

	float_opts = {
		border = "single",
		winblend = 3,
		highlights = {
			border = "Normal",
			background = "Normal",
		},
	},
})
