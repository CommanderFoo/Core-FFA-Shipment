local RANKS = require(script:GetCustomProperty("PIXELDEPTH_RANKS"))
local PIXELDEPTH = require(script:GetCustomProperty("PIXELDEPTH_API"))

local debug_text = script:GetCustomProperty("debug_text"):WaitForObject()

local local_player = Game.GetLocalPlayer();

function resource_changed(player, id, val)
	if(id == "xp") then
		check_xp_level()
	end
end

function check_xp_level()
	local xp = local_player:GetResource("xp")
	local current_level = local_player:GetResource("level") or 1
	local awarded_rank = {}
	local new_level = current_level

	for index = 1, #RANKS do
		local e = RANKS[index]

		if(xp >= e.xp) then
			awarded_rank = e
			new_level = index
		end
	end

	if(new_level > current_level) then
		Events.BroadcastToServer("on_player_levelled", new_level)
		Events.Broadcast("player_promoted", awarded_rank.name)
		--print("You have been promoted to " .. awarded_rank.name)
		
	end

	debug_text.text = "XP: " .. tostring(local_player:GetResource("xp")) .. " Level: " .. tostring(local_player:GetResource("level"))
end

check_xp_level()

local_player.resourceChangedEvent:Connect(resource_changed)