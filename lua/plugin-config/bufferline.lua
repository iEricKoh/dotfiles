vim.opt.termguicolors = true
require("bufferline").setup({
	options = {
		numbers = "ordinal",
		offsets = {
			{
				filetype = "NvimTree",
				text = "File Explorer",
				highlight = "Directory",
				text_align = "left",
			},
		},
		diagnostics = "nvim_lsp",
	},
})
