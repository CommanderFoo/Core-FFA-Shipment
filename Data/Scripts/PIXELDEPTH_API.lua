local PIXELDEPTH = {}

--PIXELDEPTH.Utils = require(script:GetCustomProperty("PIXELDEPTH_API_Utils"))

PIXELDEPTH.require = function(api)
	return require(script:GetCustomProperty("PIXELDEPTH_API_" .. api))
end

return PIXELDEPTH