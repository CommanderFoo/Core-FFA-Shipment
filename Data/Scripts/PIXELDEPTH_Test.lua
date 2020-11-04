local PIXELDEPTH = require(script:GetCustomProperty("PIXELDEPTH_API"))

PIXELDEPTH.Utils = PIXELDEPTH.require("Utils")
PIXELDEPTH.Tween = PIXELDEPTH.require("Tween")
PIXELDEPTH.Tween.Easings = PIXELDEPTH.require("Tween_Easings")

local box = script:GetCustomProperty("box"):WaitForObject()
local col = box:GetColor()
local tween = PIXELDEPTH.Tween:new(2, {a = 1}, {a = 0})

function Tick(dt)
	--Task.Wait(.5)

	if(tween and tween:active()) then
		tween:on_complete(function()
			print("Finished tween")
			tween = nil -- Kill it
		end)
		
		tween:on_change(function(changed)
			col.a = changed.a
			print(col.a)
			box:SetColor(col)
		end)

		tween:start(dt)
	end
end
