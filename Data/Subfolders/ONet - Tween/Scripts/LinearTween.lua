--
-- Feel free to delete this demo script!
--

-- Add the `TweenLibrary` script as an `AssetReference` where you'd like
-- to add the tween
local Tween = require(script:GetCustomProperty("Tween"))

-- These are the properties we are tweeing
-- increase the volume of music from 0 to 5 in 10 seconds
local music = { volume = 0.0 }

-- Create a tween with duration, subject, and target properties. Defaults
-- to linear tween if no easing function is provided.
local musicTween = Tween.new(10.0, music, {volume = 5.0}) -- last parameter is a string specifying ease function

-- Easing functions include:
-- `linear` 
-- `quad`, `cubic`, `quart`, `quint`, `expo`, `sine` and `circle` are all "smooth" curves that will make transitions look natural.
-- The `back` family starts by moving the interpolation slightly "backwards" before moving it forward.
-- The `bounce` family simulates the motion of an object bouncing.
-- The `elastic` family simulates inertia in the easing, like an elastic gum.

function Tick(delta)
	-- Ensure you call the tween's `update` function and pass in the
	-- elapsed time to allow the tween to update.
	musicTween:update(delta)
	
	-- Log the updated volume
	print("Volume: " .. music.volume)
end



