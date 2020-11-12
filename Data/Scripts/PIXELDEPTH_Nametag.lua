local nametag_tpl = script:GetCustomProperty("nametag_tpl")

local local_player = Game.GetLocalPlayer()
local nametags = {}

function on_player_joined(player)	
	if(player.id ~= local_player.id) then
		local nametag = World.SpawnAsset(nametag_tpl)
		
		nametag.text = player.name
		nametags[player] = nametag

		nametag:AttachToPlayer(player, "nameplate")
		nametag:SetScale(Vector3.New(0.85, 0.85, 0.85))
	end
end

function on_player_left(player)
	nametags[player]:Destroy()
	nametags[player] = nil
end

function Tick()
	for k, v in pairs(Game.GetPlayers()) do
		local nametag = nametags[v]

		if(nametag) then
			local quat = Quaternion.New(local_player:GetViewWorldRotation())
			
			quat = quat * Quaternion.New(Vector3.UP, 180.0)
			nametag:SetWorldRotation(Rotation.New(quat))
		end
	end
end

Game.playerJoinedEvent:Connect(on_player_joined)
Game.playerLeftEvent:Connect(on_player_left)