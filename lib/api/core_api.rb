module Api
	module CoreApi
	
		def core_api_values
			YAML.load_file("config/core_api.yml")
		end
	end
end 