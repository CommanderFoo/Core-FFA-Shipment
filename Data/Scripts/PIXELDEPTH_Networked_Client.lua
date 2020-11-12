local JSON = require(script:GetCustomProperty("PIXELDEPTH_JSON"))
local PIXELDEPTH_Networked_Data_Server = script:GetCustomProperty("PIXELDEPTH_Networked_Data_Server"):WaitForObject()

local local_player = Game.GetLocalPlayer()
local hit_effect = script:GetCustomProperty("hit_effect"):WaitForObject()

local player_hit = true
local blood_task = nil

function show_blood_effect(hit_points)
	if(hit_points < local_player.maxHitPoints) then
		if(player_hit) then
			if(hit_points < 10) then
				hit_effect:SetSmartProperty("Effect Strength", 1)
			elseif(hit_points < 20) then
				hit_effect:SetSmartProperty("Effect Strength", .8)
			elseif(hit_points < 40) then
				hit_effect:SetSmartProperty("Effect Strength", .6)
			elseif(hit_points < 60) then
				hit_effect:SetSmartProperty("Effect Strength", .4)
			elseif(hit_points < 80) then
				hit_effect:SetSmartProperty("Effect Strength", .2)
			elseif(hit_points < 100) then
				hit_effect:SetSmartProperty("Effect Strength", .1)
			end
		end

		if(hit_points <= 0) then
			hit_effect:SetSmartProperty("Effect Strength", 0)
		end
	else
		hit_effect:SetSmartProperty("Effect Strength", 0)
	end
end

function on_property_changed(obj, prop)
	local str = obj:GetCustomProperty("players")

	if(str) then
		local players_health = JSON:decode(str)

		if(players_health and players_health[local_player.id]) then
			--print(local_player.hitPoints)
		end
	end
end

PIXELDEPTH_Networked_Data_Server.networkedPropertyChangedEvent:Connect(on_property_changed)