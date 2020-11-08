local RANKS = require(script:GetCustomProperty("PIXELDEPTH_RANKS"))
local PIXELDEPTH = require(script:GetCustomProperty("PIXELDEPTH_API"))

local propXP = script:GetCustomProperty("XP"):WaitForObject()
local propLevel = script:GetCustomProperty("Level"):WaitForObject()
local propKills = script:GetCustomProperty("Kills"):WaitForObject()
local propDeaths = script:GetCustomProperty("Deaths"):WaitForObject()
local propKillStreak = script:GetCustomProperty("KillStreak"):WaitForObject()
local propHighestKillStreak = script:GetCustomProperty("HighestKillStreak"):WaitForObject()
local propTotalKills = script:GetCustomProperty("TotalKills"):WaitForObject()
local propTotalDeaths = script:GetCustomProperty("TotalDeaths"):WaitForObject()


local local_player = Game.GetLocalPlayer();

function debug(player, id, val)
	if(id == "xp") then
		propXP.text = tostring(val)
	end

	if(id == "level") then
		propLevel.text = tostring(val)
	end

	if(id == "kills") then
		propKills.text = tostring(val)
	end

	if(id == "kill_streak") then
		propKillStreak.text = tostring(val)
	end

	if(id == "high_kill_streak") then
		propHighestKillStreak.text = tostring(val)
	end

	if(id == "total_kills") then
		propTotalKills.text = tostring(val)
	end

	if(id == "deaths") then
		propDeaths.text = tostring(val)
	end

	if(id == "total_deaths") then
		propTotalDeaths.text = tostring(val)
	end
end

function debug_stats()
	propXP.text = tostring(local_player:GetResource("xp"))
	propLevel.text = tostring(local_player:GetResource("level"))
	propKills.text = tostring(local_player:GetResource("kills"))
	propKillStreak.text = tostring(local_player:GetResource("kill_streak"))
	propHighestKillStreak.text = tostring(local_player:GetResource("high_kill_streak"))
	propTotalKills.text = tostring(local_player:GetResource("total_kills"))
	propDeaths.text = tostring(local_player:GetResource("deaths"))
	propTotalDeaths.text = tostring(local_player:GetResource("total_deaths"))
end

function resource_changed(player, id, val)
	debug(player, id, val)

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
	end
end

check_xp_level()

debug_stats()

local_player.resourceChangedEvent:Connect(resource_changed)