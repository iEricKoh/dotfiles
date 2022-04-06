local enhance_server_opts = function(options)
	options.settings = {
		json = {
			schemas = require("schemastore").json.schemas(),
		},
	}
end

return { enhance_server_opts = enhance_server_opts }
