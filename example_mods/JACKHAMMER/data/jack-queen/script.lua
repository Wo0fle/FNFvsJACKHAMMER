local ay = false

function onCreate()
	makeLuaSprite('1738', 'stages/homesweethome', -600, -300);
	setScrollFactor('1738', 1, 1);
	
	addLuaSprite('1738', ay); --im like hey wassup hello
end

function opponentNoteHit(she, my, trap, queen)
	if queen == false then
		cameraShake("game", 0.01, 0.02)
	elseif queen == true then
		cameraShake("game", 0.01, 0.03)
	end
end

function noteMiss()
	setProperty('health', 0)
end

local andICanRideWithMyBaby = false
function onStartCountdown()
	-- Block the first countdown and start a timer of 0.8 seconds to play the dialogue
	if not andICanRideWithMyBaby and isStoryMode and not seenCutscene then
		setProperty('inCutscene', true);
		startVideo('secret stuff/1738_ay_im_like_hey_wassap_hello');
		function onUpdate(elapsed)
			if getPropertyFromClass('flixel.FlxG', 'keys.pressed.ESCAPE') and getPropertyFromClass('flixel.FlxG', 'keys.pressed.ENTER') then
				andICanRideWithMyBaby = true;
				setProperty('health', 0) --crashes the game lmao
			end
		end
		andICanRideWithMyBaby = true;
		return Function_Stop;
	end
	return Function_Continue;
end