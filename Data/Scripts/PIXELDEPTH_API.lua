local API = {}

API.require = function(api, is_api, context)
	if(is_api == nil or is_api == true) then
		api = "API_" .. api
	end

	if(context == nil) then
		context = script
	end

	return require(context:GetCustomProperty("PIXELDEPTH_" .. api))
end

return API