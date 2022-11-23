local lsp = require("lsp-zero")
local cmp = require("cmp")

local cmp_select = { behavior = cmp.SelectBehavior.Select }

lsp.preset("recommended")

lsp.ensure_installed({
	"tsserver",
	"eslint",
	"sumneko_lua",
	"tailwindcss",
})

lsp.nvim_workspace()

lsp.configure("tailwindcss", {
	settings = {
		tailwindCSS = {
			rootFontSize = 10,
		},
	},
})

lsp.configure("jsonls", {
	settings = {
		json = {
			schemas = require("schemastore").json.schemas(),
		},
	},
})

lsp.setup_nvim_cmp({
	mapping = lsp.defaults.cmp_mappings({
		["<C-k>"] = cmp.mapping.select_prev_item(cmp_select),
		["<C-j>"] = cmp.mapping.select_next_item(cmp_select),
	}),
})

lsp.configure("dartls", { force_setup = true })

lsp.setup()
