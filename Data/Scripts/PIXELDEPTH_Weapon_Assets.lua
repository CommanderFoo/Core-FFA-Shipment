function get(index)
	if(script:GetCustomProperty(tostring(index))) then
		return script:GetCustomProperty(tostring(index))
	end
end