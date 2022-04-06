local enhance_server_opts = function(options)
	options.settings = {
		css = {
			validate = false,
		},
		less = {
			validate = true,
		},
		scss = {
			validate = true,
		},
	}
end

return { enhance_server_opts = enhance_server_opts }
