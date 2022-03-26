local allowCountdown = false
function onStartCountdown()
	-- Block the first countdown and start a timer of 0.8 seconds to play the dialogue
	if not allowCountdown and isStoryMode and not seenCutscene then
		setProperty('inCutscene', true);
		runTimer('startDialogue', 0.8);
		allowCountdown = true;
		return Function_Stop;
	end
	return Function_Continue;
end

function onTimerCompleted(tag, loops, loopsLeft)
	if tag == 'startDialogue' then -- Timer completed, play dialogue
		startDialogue('dialogue', 'bg');
	end
end

function onCreate()
	if lowQuality then
		makeLuaSprite('construction1old', 'stages/construction1old', -590, -300);
		setScrollFactor('construction1old', 0.9, 0.9);
		
		addLuaSprite('construction1old', false);
	end

	if not lowQuality then
		makeLuaSprite('construction1_back', 'stages/construction1_back', -590, -200);
		setScrollFactor('construction1_back', 0.7, 0.7);
		
		makeLuaSprite('construction_front', 'stages/construction_front', -490, -155);
		setScrollFactor('construction_front', 1, 1);
		scaleObject('construction_front', 0.9, 0.9);
		
		addLuaSprite('construction1_back', false);
		addLuaSprite('construction_front', false);
	end	
end
