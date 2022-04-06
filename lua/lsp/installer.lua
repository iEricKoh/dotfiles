local lsp_installer = require("nvim-lsp-installer")

local servers = {
	sumneko_lua = require("lsp.config.lua"),
	rust_analyzer = require("lsp.config.rust"),
	jsonls = require("lsp.config.json"),
	tsserver = require("lsp.config.tsserver"),
	tailwindcss = require("lsp.config.tailwindcss"),
	cssls = require("lsp.config.cssls"),
	html = {},
	dartls = require("lsp.config.dartls"),
	-- remark_ls = require("lsp.lang.markdown"),
}

local on_attach_base = function(client, bufnr)
	client.resolved_capabilities.document_formatting = false
	client.resolved_capabilities.document_range_formatting = false

	local function buf_set_keymap(...)
		vim.api.nvim_buf_set_keymap(bufnr, ...)
	end

	require("keybindings").lsp(buf_set_keymap)
end

local enhance_global_opts = function(server)
	local options = {}

	local capabilities = vim.lsp.protocol.make_client_capabilities()
	options.capabilities = require("cmp_nvim_lsp").update_capabilities(capabilities)

	local config = servers[server.name]

	-- server specific configs
	if config ~= nil and config.enhance_server_opts then
		config.enhance_server_opts(options)
	end

	-- prepend global config options
	local server_on_attach = options.on_attach
	options.on_attach = function(client, bufnr)
		on_attach_base(client, bufnr)

		-- require("navigator.lspclient.mapping").setup({
		-- 	client = client,
		-- 	bufnr = bufnr,
		-- 	cap = capabilities,
		-- })

		if server_on_attach then
			server_on_attach(client, bufnr)
		end
	end

	return options
end

for name, _ in pairs(servers) do
	local server_is_found, server = lsp_installer.get_server(name)
	if server_is_found then
		if not server:is_installed() then
			print("Installing " .. name)
			server:install()
		end
	end
end

lsp_installer.on_server_ready(function(server)
	local opts = enhance_global_opts(server)

	if opts ~= nil and next(opts) ~= nil then
		server:setup(opts)
	end
end)

-- require("navigator").setup({})
