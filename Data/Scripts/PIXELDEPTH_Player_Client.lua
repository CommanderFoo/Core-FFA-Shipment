local RANKS = require(script:GetCustomProperty("PIXELDEPTH_RANKS"))
local PIXELDEPTH = require(script:GetCustomProperty("PIXELDEPTH_API"))

local hit = script:GetCustomProperty("hit"):WaitForObject()
local hit_sound = script:GetCustomProperty("hit_sound"):WaitForObject()
local hit_effect = script:GetCustomProperty("hit_effect"):WaitForObject()

local propXP = script:GetCustomProperty("XP"):WaitForObject()
local propLevel = script:GetCustomProperty("Level"):WaitForObject()
local propKills = script:GetCustomProperty("Kills"):WaitForObject()
local propDeaths = script:GetCustomProperty("Deaths"):WaitForObject()
local propKillStreak = script:GetCustomProperty("KillStreak"):WaitForObject()
local propHighestKillStreak = script:GetCustomProperty("HighestKillStreak"):WaitForObject()
local propTotalKills = script:GetCustomProperty("TotalKills"):WaitForObject()
local propTotalDeaths = script:GetCustomProperty("TotalDeaths"):WaitForObject()
local propHealth = script:GetCustomProperty("Health"):WaitForObject()

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
	propHealth.text = tostring(local_player.hitPoints)
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

function Tick()
	propHealth.text = tostring(local_player.hitPoints)

	if(local_player.hitPoints < local_player.maxHitPoints) then
		local strength = 1

		if(local_player.hitPoints > 80) then
			strength = .2
		elseif(local_player.hitPoints > 60) then
			strength = .4
		elseif(local_player.hitPoints > 40) then
			strength = .6
		elseif(local_player.hitPoints > 20) then
			strength = .8
		end

		hit_effect:SetSmartProperty("Effect Strength", strength)
	elseif(hit_effect:GetSmartProperty("Effect Strength") > 0) then
		hit_effect:SetSmartProperty("Effect Strength", 0)
	end
end

function on_player_damaged(source_player, hit_points)
	if(source_player.id ~= local_player.id) then
		UI.ShowDamageDirection(source_player)
	end
end

function on_damage_hit(target_player)
	if(target_player.id ~= local_player.id) then
		hit.visibility = Visibility.FORCE_ON

		Task.Spawn(function()
			Task.Wait(0.33)
			hit.visibility = Visibility.FORCE_OFF
		end)

		hit_sound:Play()
	end
end

check_xp_level()

debug_stats()

local_player.resourceChangedEvent:Connect(resource_changed)

Events.Connect("on_damaged", on_player_damaged)
Events.Connect("on_damage_hit", on_damage_hit)