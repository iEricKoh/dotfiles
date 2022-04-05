local lsp_installer = require("nvim-lsp-installer")

local servers = {
	sumneko_lua = require("lsp.config.lua"),
	rust_analyzer = require("lsp.config.rust"),
	jsonls = require("lsp.config.json"),
	tsserver = require("lsp.config.tsserver"),
	tailwindcss = require("lsp.config.tailwindcss"),
	cssls = require("lsp.config.cssls"),
	html = require("lsp.config.html"),
	dartls = require("lsp.config.dartls"),
	-- remark_ls = require("lsp.lang.markdown"),
}

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
	local config = servers[server.name]

	if config == nil then
		return
	end
	if config.on_setup then
		config.on_setup(server)
	else
		server:setup({})
	end
end)
