local default_weapon = script:GetCustomProperty("default_weapon")

function OnPlayerJoined(player)
    local equipment = World.SpawnAsset(default_weapon)
    equipment:Equip(player)
end

Game.playerJoinedEvent:Connect(OnPlayerJoined)