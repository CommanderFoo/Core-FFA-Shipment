local class_ui = script:GetCustomProperty("class_ui"):WaitForObject()
local class_btn_container = script:GetCustomProperty("class_btn_container"):WaitForObject()

local local_player = Game.GetLocalPlayer()
local is_active = false;
local current_class = 1
local class_btns = class_btn_container:GetChildren();

for i = 1, #class_btns do
	class_btns[i].clickedEvent:Connect(function()
		turn_off(i)
		class_btns[i]:GetChildren()[1].visibility = Visibility.FORCE_ON
	end)
end

function turn_off(not_this)
	for i = 1, #class_btns do
		if(i ~= not_this) then
			class_btns[i]:GetChildren()[1].visibility = Visibility.FORCE_OFF
		end
	end
end

function on_binding_pressed(player, binding)
	-- Bound to F

	if binding == "ability_extra_33" then
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