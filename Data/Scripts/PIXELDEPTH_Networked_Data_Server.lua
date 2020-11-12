local JSON = require(script:GetCustomProperty("PIXELDEPTH_JSON"))
local players_health = {}
local players_health_server = {}

local regen_time_after_damage = 5
local regen_amount = 10

function regen()
	for k, player in pairs(players_health_server) do
		if(player.obj.hitPoints < player.obj.maxHitPoints) then
			if(time() < (player.damage_timestamp + regen_time_after_damage)) then
				local the_health_amount = math.min(player.obj.hitPoints + regen_amount, player.obj.maxHitPoints) 
				
				--print(player.obj.hitPoints)
				player.obj.hitPoints = the_health_amount
				player.health = player.obj.hitPoints

				if(players_health[player.obj.id] ~= player.obj.hitPoints) then
					players_health[player.obj.id] = player.obj.hitPoints

					script:SetNetworkedCustomProperty("players", JSON:encode(players_health))
				end
			end
		end
	end
end

--local regen_task = Task.Spawn(regen)

--regen_task.repeatInterval = 1
--regen_task.repeatCount = -1

function on_player_joined(player)
	if(not players_health[player.id]) then
		players_health[player.id] = player.hitPoints
		players_health_server[player.id] = {

			obj = player,
			damage_timestamp = 0

		}

		script:SetNetworkedCustomProperty("players", JSON:encode(players_health))

		player.damagedEvent:Connect(function(p)
			if(players_health[p.id]) then
				players_health[p.id] = p.hitPoints

				players_health_server[p.id].obj = p
				players_health_server[p.id].damage_timestamp = time()

				script:SetNetworkedCustomProperty("players", JSON:encode(players_health))
			end
		end)
	end
end

function on_player_left(player)
	if(players_health[player.id]) then
		players_health[player.id] = nil

		script:SetNetworkedCustomProperty("players", JSON:encode(players_health))
	end
end

Game.playerJoinedEvent:Connect(on_player_joined)
Game.playerLeftEvent:Connect(on_player_left)