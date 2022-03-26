function onCreate()
	if lowQuality then
		makeLuaSprite('construction2old', 'stages/construction2old', -590, -300);
		setScrollFactor('construction2old', 0.9, 0.9);

		addLuaSprite('construction2old', false);
	end

	if not lowQuality then
		makeLuaSprite('construction2_back', 'stages/construction2_back', -590, -200);
		setScrollFactor('construction2_back', 0.7, 0.7);
		
		makeLuaSprite('construction_front', 'stages/construction_front', -490, -155);
		setScrollFactor('construction_front', 1, 1);
		scaleObject('construction_front', 0.9, 0.9);

		makeAnimatedLuaSprite('crowd', 'stages/crowd', -540, -150);
		addAnimationByPrefix('crowd', 'rockOut', 'bump', 24, false)
		setScrollFactor('crowd', 1.15, 1.15);
		scaleObject(1.1, 1.1);
		
		addLuaSprite('construction2_back', false);
		addLuaSprite('construction_front', false);
		addLuaSprite('crowd', true);
	end	
end

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

function onBeatHit()
	objectPlayAnimation('crowd', 'rockOut')
end

function onCountdownTick(counter)
	if counter < 4 then
		objectPlayAnimation('crowd', 'rockOut')
	end
end

local allowEnd = false
math.randomseed(os.time())
local case = math.random(1, 1000)

function onEndSong()
	-- Block the first countdown and start a timer of 0.8 seconds to play the dialogue
	if not allowEnd and isStoryMode and not seenCutscene then
		setProperty('inCutscene', true);

		if case == 1 then --mason's ending
			startVideo('ending/ending3');
		end

		if case >= 2 and case < 100 then --seby's ending
			startVideo('ending/ending1');
		end

		if case >= 100 then --beeb's ending
			startVideo('ending/ending2');
		end

		allowEnd = true;
		return Function_Stop;
	end
	return Function_Continue;
end

function onTimerCompleted(tag, loops, loopsLeft)
	if tag == 'startDialogue' then -- Timer completed, play dialogue
		startDialogue('dialogue', 'bg');
	end
end