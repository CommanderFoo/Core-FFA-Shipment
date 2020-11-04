local lines_panel = script:GetCustomProperty("lines_panel"):WaitForObject()
local line_tpl = script:GetCustomProperty("line_tpl")

local LOCAL_PLAYER = Game.GetLocalPlayer()
local player_lines = {}

function OnPlayerJoined(player)
	local new_line = World.SpawnAsset(line_tpl, {parent = lines_panel})
    new_line = new_line.height * (#player_lines + 1)
    table.insert(player_lines, new_line)
end

--[[ function Tick(delta_time)
	local players = Game.GetPlayers()
	
	for i, player in ipairs(players) do
		local line = player_lines[i]
	
		line:GetCustomProperty("Order"):WaitForObject().text = tostring(i)
            line:GetCustomProperty("Name"):WaitForObject().text = player.name
            line:GetCustomProperty("Name"):WaitForObject():SetColor(teamColor)
            line:GetCustomProperty("KillsText"):WaitForObject().text = tostring(player.kills)
end

Game.playerJoinedEvent:Connect(OnPlayerJoined) --]]