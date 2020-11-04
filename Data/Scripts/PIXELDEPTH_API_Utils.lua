local Utils = {}

function Utils.dump(o)
	if(type(o) == "table") then
	   local s = "{ "

		for k,v in pairs(o) do
			if(type(k) ~= "number") then 
				k = "\""..k.."\""
			end

			s = s .. "["..k.."] = " .. Utils.dump(v) .. ","
		end

		return s .. "} "
	else
		return tostring(o)
	end
 end

 function Utils.dumpp(o)
	return print(Utils.dump(o))
 end

 Utils.Queue = {}

function Utils.Queue.push(self, item)
	table.insert(self.list, item)
end

function Utils.Queue.pop(self)
	return table.remove(self.list, 1)
end

function Utils.Queue.is_empty(self)
	return #self.list == 0
end

function Utils.Queue.length(self)
	return #self.list
end

function Utils.Queue.new()
	return setmetatable({list = {}}, {__index = Utils.Queue})
end

return Utils