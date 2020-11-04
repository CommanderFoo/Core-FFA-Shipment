local class_ui = script:GetCustomProperty("class_ui"):WaitForObject()

local local_player = Game.GetLocalPlayer()
local is_active = false;

function on_binding_pressed(player, binding)
	if binding == "ability_extra_41" then
		if(not is_active) then
			is_active = true
			class_ui.visibility = Visibility.FORCE_ON

			UI.SetCanCursorInteractWithUI(true)
			UI.SetCursorVisible(true)
			UI.SetReticleVisible(false)

			Events.BroadcastToServer("on_ui_open")
		else
			is_active = false
			class_ui.visibility = Visibility.FORCE_OFF

			UI.SetCanCursorInteractWithUI(false)
			UI.SetCursorVisible(false)
			UI.SetReticleVisible(true)

			Events.BroadcastToServer("on_ui_close")
		end
	end
end

local_player.bindingPressedEvent:Connect(on_binding_pressed)