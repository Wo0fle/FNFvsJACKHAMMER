y = 365

function onCreate()
  cameraX = 730
  cameraY = 450

  precacheImage('monojack tingz/Unown_Alphabet')

  resetBool = getPropertyFromClass('ClientPrefs', 'noReset')
  if resetBool == false then
    setPropertyFromClass('ClientPrefs', 'noReset', true)
    function onDestroy()
      setPropertyFromClass('ClientPrefs', 'noReset', false)
    end
  end
  
  newInputBool = getPropertyFromClass('ClientPrefs', 'ghostTapping')
  if newInputBool == false then
    setPropertyFromClass('ClientPrefs', 'ghostTapping', true)
    function onDestroy()
      setPropertyFromClass('ClientPrefs', 'ghostTapping', false)
    end
  end
end

function onCreatePost()
  setProperty('camFollowPos.x', 730)
  setProperty('camFollowPos.y', 450)

  makeLuaSprite('static', 'monojack tingz/static', 0, 0)
  setProperty('static.alpha', 0.35)

  makeAnimatedLuaSprite('countdown', 'monojack tingz/countdown', 680, 590)
  scaleObject('countdown', 1.2, 1.2)
  addAnimationByPrefix('countdown', 'countdown', 'countdown', 1, false)
end

function opponentNoteHit(id, direction, noteType, isSustainNote)
	if isSustainNote == false then
    health = getProperty('health')
    newHealth = health - 0.015
    setProperty('health', newHealth)
  elseif isSustainNote == true then
    health = getProperty('health')
    newHealth = health - 0.01
    setProperty('health', newHealth)
  end
end

function onBeatHit()
  if curBeat == 27 then
    triggerEvent('changeAlphaNotes')
  end
end

function onStepHit()
  if curStep == 256 or curStep == 512 or curStep == 640 or curStep == 768 or curStep == 896 then
    triggerEvent('typingEvent')
  end

  --[[if curStep == 4 then
    triggerEvent('typingEvent')
  end]]

  if curStep == 368 or curStep == 376 or curStep == 816 or curStep == 824 or curStep == 1264 or curStep == 1272 then
    triggerEvent('lowerHealth')
  end
end

function onEvent(name)
  if name == 'typingEvent' then
    addLuaSprite('static', true)

    addLuaSprite('countdown', true)
    objectPlayAnimation('countdown', 'countdown', true)
    
    math.randomseed(os.time())
    math.randomseed(os.time() + math.random() - math.random() - math.random() + math.random() + math.random())
    --i just be randomizing
    --no clue if this makes it more random or not but i'll pretend it does

    local case = math.random(1, 14)

    --local case = 14

    local moveOn = 0
    
    doneYetCheck = false

    runTimer('doneYet', 6)

    if case == 1 then --uwu
      makeAnimatedLuaSprite('u', 'monojack tingz/Unown_Alphabet', 333, y)
      addAnimationByPrefix('u', 'uanim', 'U', 24, true)
      addLuaSprite('u', true)

      makeAnimatedLuaSprite('w', 'monojack tingz/Unown_Alphabet', 633, y)
      addAnimationByPrefix('w', 'wanim', 'W', 24, true)
      addLuaSprite('w', true)

      makeAnimatedLuaSprite('u2', 'monojack tingz/Unown_Alphabet', 933, y)
      addAnimationByPrefix('u2', 'uanim', 'U', 24, true)
      addLuaSprite('u2', true)

      function onUpdate(elapsed)
        local checkU = getPropertyFromClass('flixel.FlxG', 'keys.justPressed.U')
        local checkW = getPropertyFromClass('flixel.FlxG', 'keys.justPressed.W')

        if moveOn == 0 and checkU == true then
          removeLuaSprite('u')
          moveOn = 1
        end

        if moveOn == 1 and checkW == true then
          removeLuaSprite('w')
          moveOn = 2
        end

        if moveOn == 2 and checkU == true then
          removeLuaSprite('u2')
          removeLuaSprite('static', false)
          removeLuaSprite('countdown', false)
          doneYetCheck = true
        end

      end
    end

    if case == 2 then --shadow better
      makeAnimatedLuaSprite('s', 'monojack tingz/Unown_Alphabet', 95, y)
      addAnimationByPrefix('s', 'sanim', 'S', 24, true)
      scaleObject('s', 0.5, 0.5)
      addLuaSprite('s', true)

      makeAnimatedLuaSprite('h', 'monojack tingz/Unown_Alphabet', 200, y)
      addAnimationByPrefix('h', 'hanim', 'H', 24, true)
      scaleObject('h', 0.5, 0.5)
      addLuaSprite('h', true)

      makeAnimatedLuaSprite('a', 'monojack tingz/Unown_Alphabet', 315, y)
      addAnimationByPrefix('a', 'aanim', 'A', 24, true)
      scaleObject('a', 0.5, 0.5)
      addLuaSprite('a', true)

      makeAnimatedLuaSprite('d', 'monojack tingz/Unown_Alphabet', 410, y)
      addAnimationByPrefix('d', 'danim', 'D', 24, true)
      scaleObject('d', 0.5, 0.5)
      addLuaSprite('d', true)

      makeAnimatedLuaSprite('o', 'monojack tingz/Unown_Alphabet', 510, y)
      addAnimationByPrefix('o', 'oanim', 'O', 24, true)
      scaleObject('o', 0.5, 0.5)
      addLuaSprite('o', true)

      makeAnimatedLuaSprite('w', 'monojack tingz/Unown_Alphabet', 630, y)
      addAnimationByPrefix('w', 'wanim', 'W', 24, true)
      scaleObject('w', 0.5, 0.5)
      addLuaSprite('w', true)

      makeAnimatedLuaSprite('b', 'monojack tingz/Unown_Alphabet', 810, y)
      addAnimationByPrefix('b', 'banim', 'B', 24, true)
      scaleObject('b', 0.5, 0.5)
      addLuaSprite('b', true)

      makeAnimatedLuaSprite('e', 'monojack tingz/Unown_Alphabet', 895, y)
      addAnimationByPrefix('e', 'eanim', 'E', 24, true)
      scaleObject('e', 0.5, 0.5)
      addLuaSprite('e', true)
      
      makeAnimatedLuaSprite('t', 'monojack tingz/Unown_Alphabet', 1000, y)
      addAnimationByPrefix('t', 'tanim', 'T', 24, true)
      scaleObject('t', 0.5, 0.5)
      addLuaSprite('t', true)

      makeAnimatedLuaSprite('t2', 'monojack tingz/Unown_Alphabet', 1080, y)
      addAnimationByPrefix('t2', 'tanim', 'T', 24, true)
      scaleObject('t2', 0.5, 0.5)
      addLuaSprite('t2', true)

      makeAnimatedLuaSprite('e2', 'monojack tingz/Unown_Alphabet', 1150, y)
      addAnimationByPrefix('e2', 'eanim', 'E', 24, true)
      scaleObject('e2', 0.5, 0.5)
      addLuaSprite('e2', true)

      makeAnimatedLuaSprite('r', 'monojack tingz/Unown_Alphabet', 1260, y)
      addAnimationByPrefix('r', 'ranim', 'R', 24, true)
      scaleObject('r', 0.5, 0.5)
      addLuaSprite('r', true)

      function onUpdate(elapsed)
        local checkS = getPropertyFromClass('flixel.FlxG', 'keys.justPressed.S')
        local checkH = getPropertyFromClass('flixel.FlxG', 'keys.justPressed.H')
        local checkA = getPropertyFromClass('flixel.FlxG', 'keys.justPressed.A')
        local checkD = getPropertyFromClass('flixel.FlxG', 'keys.justPressed.D')
        local checkO = getPropertyFromClass('flixel.FlxG', 'keys.justPressed.O')
        local checkW = getPropertyFromClass('flixel.FlxG', 'keys.justPressed.W')
        local checkB = getPropertyFromClass('flixel.FlxG', 'keys.justPressed.B')
        local checkE = getPropertyFromClass('flixel.FlxG', 'keys.justPressed.E')
        local checkT = getPropertyFromClass('flixel.FlxG', 'keys.justPressed.T')
        local checkR = getPropertyFromClass('flixel.FlxG', 'keys.justPressed.R')
        
        if moveOn == 0 and checkS == true then
          removeLuaSprite('s')
          moveOn = 1
        end

        if moveOn == 1 and checkH == true then
          removeLuaSprite('h')
          moveOn = 2
        end

        if moveOn == 2 and checkA == true then
          removeLuaSprite('a')
          moveOn = 3
        end

        if moveOn == 3 and checkD == true then
          removeLuaSprite('d')
          moveOn = 4
        end

        if moveOn == 4 and checkO == true then
          removeLuaSprite('o')
          moveOn = 5
        end

        if moveOn == 5 and checkW == true then
          removeLuaSprite('w')
          moveOn = 6
        end

        if moveOn == 6 and checkB == true then
          removeLuaSprite('b')
          moveOn = 7
        end

        if moveOn == 7 and checkE == true then
          removeLuaSprite('e')
          moveOn = 8
        end

        if moveOn == 8 and checkT == true then
          removeLuaSprite('t')
          moveOn = 9
        end

        if moveOn == 9 and checkT == true then
          removeLuaSprite('t2')
          moveOn = 10
        end

        if moveOn == 10 and checkE == true then
          removeLuaSprite('e2')
          moveOn = 11
        end

        if moveOn == 11 and checkR == true then
          removeLuaSprite('r')
          removeLuaSprite('static', false)
          removeLuaSprite('countdown', false)
          doneYetCheck = true
        end
      end
    end

    if case == 3 then --mid
      makeAnimatedLuaSprite('m', 'monojack tingz/Unown_Alphabet', 333, y)
      addAnimationByPrefix('m', 'manim', 'M', 24, true)
      addLuaSprite('m', true)

      makeAnimatedLuaSprite('i', 'monojack tingz/Unown_Alphabet', 633, y)
      addAnimationByPrefix('i', 'ianim', 'I', 24, true)
      addLuaSprite('i', true)

      makeAnimatedLuaSprite('d', 'monojack tingz/Unown_Alphabet', 933, y)
      addAnimationByPrefix('d', 'danim', 'D', 24, true)
      addLuaSprite('d', true)

      function onUpdate(elapsed)
        local checkM = getPropertyFromClass('flixel.FlxG', 'keys.justPressed.M')
        local checkI = getPropertyFromClass('flixel.FlxG', 'keys.justPressed.I')
        local checkD = getPropertyFromClass('flixel.FlxG', 'keys.justPressed.D')

        if moveOn == 0 and checkM == true then
          removeLuaSprite('m')
          moveOn = 1
        end

        if moveOn == 1 and checkI == true then
          removeLuaSprite('i')
          moveOn = 2
        end

        if moveOn == 2 and checkD == true then
          removeLuaSprite('d')
          removeLuaSprite('static', false)
          removeLuaSprite('countdown', false)
          doneYetCheck = true
        end

      end
    end

    if case == 4 then --silly slapper
      makeAnimatedLuaSprite('s', 'monojack tingz/Unown_Alphabet', 95, y)
      addAnimationByPrefix('s', 'sanim', 'S', 24, true)
      scaleObject('s', 0.5, 0.5)
      addLuaSprite('s', true)

      makeAnimatedLuaSprite('i', 'monojack tingz/Unown_Alphabet', 210, y)
      addAnimationByPrefix('i', 'ianim', 'I', 24, true)
      scaleObject('i', 0.5, 0.5)
      addLuaSprite('i', true)

      makeAnimatedLuaSprite('l', 'monojack tingz/Unown_Alphabet', 300, y)
      addAnimationByPrefix('l', 'lanim', 'L', 24, true)
      scaleObject('l', 0.5, 0.5)
      addLuaSprite('l', true)

      makeAnimatedLuaSprite('l2', 'monojack tingz/Unown_Alphabet', 400, y)
      addAnimationByPrefix('l2', 'l2anim', 'L', 24, true)
      scaleObject('l2', 0.5, 0.5)
      addLuaSprite('l2', true)

      makeAnimatedLuaSprite('y', 'monojack tingz/Unown_Alphabet', 500, y)
      addAnimationByPrefix('y', 'yanim', 'Y', 24, true)
      scaleObject('y', 0.5, 0.5)
      addLuaSprite('y', true)

      makeAnimatedLuaSprite('s2', 'monojack tingz/Unown_Alphabet', 700, y)
      addAnimationByPrefix('s2', 's2anim', 'S', 24, true)
      scaleObject('s2', 0.5, 0.5)
      addLuaSprite('s2', true)

      makeAnimatedLuaSprite('l3', 'monojack tingz/Unown_Alphabet', 800, y)
      addAnimationByPrefix('l3', 'l3anim', 'L', 24, true)
      scaleObject('l3', 0.5, 0.5)
      addLuaSprite('l3', true)

      makeAnimatedLuaSprite('a', 'monojack tingz/Unown_Alphabet', 890, y)
      addAnimationByPrefix('a', 'aanim', 'A', 24, true)
      scaleObject('a', 0.5, 0.5)
      addLuaSprite('a', true)

      makeAnimatedLuaSprite('p', 'monojack tingz/Unown_Alphabet', 1000, y)
      addAnimationByPrefix('p', 'panim', 'P', 24, true)
      scaleObject('p', 0.5, 0.5)
      addLuaSprite('p', true)

      makeAnimatedLuaSprite('p2', 'monojack tingz/Unown_Alphabet', 1100, y)
      addAnimationByPrefix('p2', 'p2anim', 'P', 24, true)
      scaleObject('p2', 0.5, 0.5)
      addLuaSprite('p2', true)

      makeAnimatedLuaSprite('e', 'monojack tingz/Unown_Alphabet', 1180, y)
      addAnimationByPrefix('e', 'eanim', 'E', 24, true)
      scaleObject('e', 0.5, 0.5)
      addLuaSprite('e', true)
      
      makeAnimatedLuaSprite('r', 'monojack tingz/Unown_Alphabet', 1300, y)
      addAnimationByPrefix('r', 'ranim', 'R', 24, true)
      scaleObject('r', 0.5, 0.5)
      addLuaSprite('r', true)

      function onUpdate(elapsed)
        local checkS = getPropertyFromClass('flixel.FlxG', 'keys.justPressed.S')
        local checkI = getPropertyFromClass('flixel.FlxG', 'keys.justPressed.I')
        local checkL = getPropertyFromClass('flixel.FlxG', 'keys.justPressed.L')
        local checkY = getPropertyFromClass('flixel.FlxG', 'keys.justPressed.Y')
        local checkA = getPropertyFromClass('flixel.FlxG', 'keys.justPressed.A')
        local checkP = getPropertyFromClass('flixel.FlxG', 'keys.justPressed.P')
        local checkE = getPropertyFromClass('flixel.FlxG', 'keys.justPressed.E')
        local checkR = getPropertyFromClass('flixel.FlxG', 'keys.justPressed.R')
        
        if moveOn == 0 and checkS == true then
          removeLuaSprite('s')
          moveOn = 1
        end

        if moveOn == 1 and checkI == true then
          removeLuaSprite('i')
          moveOn = 2
        end

        if moveOn == 2 and checkL == true then
          removeLuaSprite('l')
          moveOn = 3
        end

        if moveOn == 3 and checkL == true then
          removeLuaSprite('l2')
          moveOn = 4
        end

        if moveOn == 4 and checkY == true then
          removeLuaSprite('y')
          moveOn = 5
        end

        if moveOn == 5 and checkS == true then
          removeLuaSprite('s2')
          moveOn = 6
        end

        if moveOn == 6 and checkL == true then
          removeLuaSprite('l3')
          moveOn = 7
        end

        if moveOn == 7 and checkA == true then
          removeLuaSprite('a')
          moveOn = 8
        end

        if moveOn == 8 and checkP == true then
          removeLuaSprite('p')
          moveOn = 9
        end

        if moveOn == 9 and checkP == true then
          removeLuaSprite('p2')
          moveOn = 10
        end

        if moveOn == 10 and checkE == true then
          removeLuaSprite('e')
          moveOn = 11
        end

        if moveOn == 11 and checkR == true then
          removeLuaSprite('r')
          removeLuaSprite('static', false)
          removeLuaSprite('countdown', false)
          doneYetCheck = true
        end
      end
    end

    if case == 5 then --hewwo?
      makeAnimatedLuaSprite('h', 'monojack tingz/Unown_Alphabet', 310, y)
      addAnimationByPrefix('h', 'hanim', 'H', 24, true)
      scaleObject('h', 0.6, 0.6)
      addLuaSprite('h', true)

      makeAnimatedLuaSprite('e', 'monojack tingz/Unown_Alphabet', 460, y)
      addAnimationByPrefix('e', 'eanim', 'E', 24, true)
      scaleObject('e', 0.6, 0.6)
      addLuaSprite('e', true)

      makeAnimatedLuaSprite('w', 'monojack tingz/Unown_Alphabet', 610, y)
      addAnimationByPrefix('w', 'wanim', 'W', 24, true)
      scaleObject('w', 0.6, 0.6)
      addLuaSprite('w', true)

      makeAnimatedLuaSprite('w2', 'monojack tingz/Unown_Alphabet', 760, y)
      addAnimationByPrefix('w2', 'w2anim', 'W', 24, true)
      scaleObject('w2', 0.6, 0.6)
      addLuaSprite('w2', true)

      makeAnimatedLuaSprite('o', 'monojack tingz/Unown_Alphabet', 910, y)
      addAnimationByPrefix('o', 'oanim', 'O', 24, true)
      scaleObject('o', 0.6, 0.6)
      addLuaSprite('o', true)

      makeAnimatedLuaSprite('?', 'monojack tingz/Unown_Alphabet', 1080, y)
      addAnimationByPrefix('?', '?anim', '?', 24, true)
      scaleObject('?', 0.6, 0.6)
      addLuaSprite('?', true)

      function onUpdate(elapsed)
        local checkH = getPropertyFromClass('flixel.FlxG', 'keys.justPressed.H')
        local checkE = getPropertyFromClass('flixel.FlxG', 'keys.justPressed.E')
        local checkW = getPropertyFromClass('flixel.FlxG', 'keys.justPressed.W')
        local checkO = getPropertyFromClass('flixel.FlxG', 'keys.justPressed.O')
        local checkShift = getPropertyFromClass('flixel.FlxG', 'keys.pressed.SHIFT')
        local checkSlash = getPropertyFromClass('flixel.FlxG', 'keys.pressed.SLASH')

        if moveOn == 0 and checkH == true then
          removeLuaSprite('h')
          moveOn = 1
        end

        if moveOn == 1 and checkE == true then
          removeLuaSprite('e')
          moveOn = 2
        end

        if moveOn == 2 and checkW == true then
          removeLuaSprite('w')
          moveOn = 3
        end

        if moveOn == 3 and checkW == true then
          removeLuaSprite('w2')
          moveOn = 4
        end

        if moveOn == 4 and checkO == true then
          removeLuaSprite('o')
          moveOn = 5
        end

        if moveOn == 5 and checkShift == true and checkSlash == true then
          removeLuaSprite('?')
          removeLuaSprite('static', false)
          removeLuaSprite('countdown', false)
          doneYetCheck = true
        end

      end
    end

    if case == 6 then --git gud
      makeAnimatedLuaSprite('g', 'monojack tingz/Unown_Alphabet', 320, y)
      addAnimationByPrefix('g', 'ganim', 'G', 24, true)
      scaleObject('g', 0.6, 0.6)
      addLuaSprite('g', true)

      makeAnimatedLuaSprite('i', 'monojack tingz/Unown_Alphabet', 450, y)
      addAnimationByPrefix('i', 'ianim', 'I', 24, true)
      scaleObject('i', 0.6, 0.6)
      addLuaSprite('i', true)

      makeAnimatedLuaSprite('t', 'monojack tingz/Unown_Alphabet', 560, y)
      addAnimationByPrefix('t', 'tanim', 'T', 24, true)
      scaleObject('t', 0.6, 0.6)
      addLuaSprite('t', true)

      makeAnimatedLuaSprite('g2', 'monojack tingz/Unown_Alphabet', 800, y)
      addAnimationByPrefix('g2', 'g2anim', 'G', 24, true)
      scaleObject('g2', 0.6, 0.6)
      addLuaSprite('g2', true)

      makeAnimatedLuaSprite('u', 'monojack tingz/Unown_Alphabet', 902, y)
      addAnimationByPrefix('u', 'uanim', 'U', 24, true)
      scaleObject('u', 0.6, 0.6)
      addLuaSprite('u', true)

      makeAnimatedLuaSprite('d', 'monojack tingz/Unown_Alphabet', 1040, y)
      addAnimationByPrefix('d', 'danim', 'D', 24, true)
      scaleObject('d', 0.6, 0.6)
      addLuaSprite('d', true)

      function onUpdate(elapsed)
        local checkG = getPropertyFromClass('flixel.FlxG', 'keys.justPressed.G')
        local checkI = getPropertyFromClass('flixel.FlxG', 'keys.justPressed.I')
        local checkT = getPropertyFromClass('flixel.FlxG', 'keys.justPressed.T')
        local checkU = getPropertyFromClass('flixel.FlxG', 'keys.justPressed.U')
        local checkD = getPropertyFromClass('flixel.FlxG', 'keys.justPressed.D')

        if moveOn == 0 and checkG == true then
          removeLuaSprite('g')
          moveOn = 1
        end

        if moveOn == 1 and checkI == true then
          removeLuaSprite('i')
          moveOn = 2
        end

        if moveOn == 2 and checkT == true then
          removeLuaSprite('t')
          moveOn = 3
        end

        if moveOn == 3 and checkG == true then
          removeLuaSprite('g2')
          moveOn = 4
        end

        if moveOn == 4 and checkU == true then
          removeLuaSprite('u')
          moveOn = 5
        end

        if moveOn == 5 and checkD == true then
          removeLuaSprite('d')
          removeLuaSprite('static', false)
          removeLuaSprite('countdown', false)
          doneYetCheck = true
        end

      end
    end

    if case == 7 then --ratio
      makeAnimatedLuaSprite('r', 'monojack tingz/Unown_Alphabet', 410, y)
      addAnimationByPrefix('r', 'ranim', 'R', 24, true)
      scaleObject('r', 0.7, 0.7)
      addLuaSprite('r', true)

      makeAnimatedLuaSprite('a', 'monojack tingz/Unown_Alphabet', 525, y)
      addAnimationByPrefix('a', 'aanim', 'A', 24, true)
      scaleObject('a', 0.7, 0.7)
      addLuaSprite('a', true)

      makeAnimatedLuaSprite('t', 'monojack tingz/Unown_Alphabet', 680, y)
      addAnimationByPrefix('t', 'tanim', 'T', 24, true)
      scaleObject('t', 0.7, 0.7)
      addLuaSprite('t', true)

      makeAnimatedLuaSprite('i', 'monojack tingz/Unown_Alphabet', 800, y)
      addAnimationByPrefix('i', 'ianim', 'I', 24, true)
      scaleObject('i', 0.7, 0.7)
      addLuaSprite('i', true)

      makeAnimatedLuaSprite('o', 'monojack tingz/Unown_Alphabet', 910, y)
      addAnimationByPrefix('o', 'oanim', 'O', 24, true)
      scaleObject('o', 0.7, 0.7)
      addLuaSprite('o', true)

      function onUpdate(elapsed)
        local checkR = getPropertyFromClass('flixel.FlxG', 'keys.justPressed.R')
        local checkA = getPropertyFromClass('flixel.FlxG', 'keys.justPressed.A')
        local checkT = getPropertyFromClass('flixel.FlxG', 'keys.justPressed.T')
        local checkI = getPropertyFromClass('flixel.FlxG', 'keys.justPressed.I')
        local checkO = getPropertyFromClass('flixel.FlxG', 'keys.justPressed.O')

        if moveOn == 0 and checkR == true then
          removeLuaSprite('r')
          moveOn = 1
        end

        if moveOn == 1 and checkA == true then
          removeLuaSprite('a')
          moveOn = 2
        end

        if moveOn == 2 and checkT == true then
          removeLuaSprite('t')
          moveOn = 3
        end

        if moveOn == 3 and checkI == true then
          removeLuaSprite('i')
          moveOn = 4
        end

        if moveOn == 4 and checkO == true then
          removeLuaSprite('o')
          removeLuaSprite('static', false)
          removeLuaSprite('countdown', false)
          doneYetCheck = true
        end

      end 
    end

    if case == 8 then --chocolate?
      makeAnimatedLuaSprite('c', 'monojack tingz/Unown_Alphabet', 220, y)
      addAnimationByPrefix('c', 'canim', 'C', 24, true)
      scaleObject('c', 0.55, 0.55)
      addLuaSprite('c', true)

      makeAnimatedLuaSprite('h', 'monojack tingz/Unown_Alphabet', 340, y)
      addAnimationByPrefix('h', 'hanim', 'H', 24, true)
      scaleObject('h', 0.55, 0.55)
      addLuaSprite('h', true)

      makeAnimatedLuaSprite('o', 'monojack tingz/Unown_Alphabet', 460, y)
      addAnimationByPrefix('o', 'oanim', 'O', 24, true)
      scaleObject('o', 0.55, 0.55)
      addLuaSprite('o', true)

      makeAnimatedLuaSprite('c2', 'monojack tingz/Unown_Alphabet', 590, y)
      addAnimationByPrefix('c2', 'c2anim', 'C', 24, true)
      scaleObject('c2', 0.55, 0.55)
      addLuaSprite('c2', true)

      makeAnimatedLuaSprite('o2', 'monojack tingz/Unown_Alphabet', 700, y)
      addAnimationByPrefix('o2', 'o2anim', 'O', 24, true)
      scaleObject('o2', 0.55, 0.55)
      addLuaSprite('o2', true)

      makeAnimatedLuaSprite('l', 'monojack tingz/Unown_Alphabet', 835, y)
      addAnimationByPrefix('l', 'lanim', 'L', 24, true)
      scaleObject('l', 0.55, 0.55)
      addLuaSprite('l', true)
      
      makeAnimatedLuaSprite('a', 'monojack tingz/Unown_Alphabet', 925, y)
      addAnimationByPrefix('a', 'aanim', 'A', 24, true)
      scaleObject('a', 0.55, 0.55)
      addLuaSprite('a', true)

      makeAnimatedLuaSprite('t', 'monojack tingz/Unown_Alphabet', 1030, y)
      addAnimationByPrefix('t', 'tanim', 'T', 24, true)
      scaleObject('t', 0.55, 0.55)
      addLuaSprite('t', true)

      makeAnimatedLuaSprite('e', 'monojack tingz/Unown_Alphabet', 1110, y)
      addAnimationByPrefix('e', 'eanim', 'E', 24, true)
      scaleObject('e', 0.55, 0.55)
      addLuaSprite('e', true)

      function onUpdate(elapsed)
        local checkC = getPropertyFromClass('flixel.FlxG', 'keys.justPressed.C')
        local checkH = getPropertyFromClass('flixel.FlxG', 'keys.justPressed.H')
        local checkO = getPropertyFromClass('flixel.FlxG', 'keys.justPressed.O')
        local checkL = getPropertyFromClass('flixel.FlxG', 'keys.justPressed.L')
        local checkA = getPropertyFromClass('flixel.FlxG', 'keys.justPressed.A')
        local checkT = getPropertyFromClass('flixel.FlxG', 'keys.justPressed.T')
        local checkE = getPropertyFromClass('flixel.FlxG', 'keys.justPressed.E')

        if moveOn == 0 and checkC == true then
          removeLuaSprite('c')
          moveOn = 1
        end

        if moveOn == 1 and checkH == true then
          removeLuaSprite('h')
          moveOn = 2
        end

        if moveOn == 2 and checkO == true then
          removeLuaSprite('o')
          moveOn = 3
        end

        if moveOn == 3 and checkC == true then
          removeLuaSprite('c2')
          moveOn = 4
        end

        if moveOn == 4 and checkO == true then
          removeLuaSprite('o2')
          moveOn = 5
        end

        if moveOn == 5 and checkL == true then
          removeLuaSprite('l')
          moveOn = 6
        end

        if moveOn == 6 and checkA == true then
          removeLuaSprite('a')
          moveOn = 7
        end

        if moveOn == 7 and checkT == true then
          removeLuaSprite('t')
          moveOn = 8
        end

        if moveOn == 8 and checkE == true then
          removeLuaSprite('e')
          removeLuaSprite('static', false)
          removeLuaSprite('countdown', false)
          doneYetCheck = true
        end

      end
    end

    if case == 9 then --grakaka
      makeAnimatedLuaSprite('g', 'monojack tingz/Unown_Alphabet', 310, y)
      addAnimationByPrefix('g', 'ganim', 'G', 24, true)
      scaleObject('g', 0.6, 0.6)
      addLuaSprite('g', true)
      
      makeAnimatedLuaSprite('r', 'monojack tingz/Unown_Alphabet', 440, y)
      addAnimationByPrefix('r', 'ranim', 'R', 24, true)
      scaleObject('r', 0.6, 0.6)
      addLuaSprite('r', true)

      makeAnimatedLuaSprite('a', 'monojack tingz/Unown_Alphabet', 540, y)
      addAnimationByPrefix('a', 'aanim', 'A', 24, true)
      scaleObject('a', 0.6, 0.6)
      addLuaSprite('a', true)

      makeAnimatedLuaSprite('k', 'monojack tingz/Unown_Alphabet', 660, y)
      addAnimationByPrefix('k', 'kanim', 'K', 24, true)
      scaleObject('k', 0.6, 0.6)
      addLuaSprite('k', true)

      makeAnimatedLuaSprite('a2', 'monojack tingz/Unown_Alphabet', 780, y)
      addAnimationByPrefix('a2', 'a2anim', 'A', 24, true)
      scaleObject('a2', 0.6, 0.6)
      addLuaSprite('a2', true)

      makeAnimatedLuaSprite('k2', 'monojack tingz/Unown_Alphabet', 900, y)
      addAnimationByPrefix('k2', 'k2anim', 'K', 24, true)
      scaleObject('k2', 0.6, 0.6)
      addLuaSprite('k2', true)

      makeAnimatedLuaSprite('a3', 'monojack tingz/Unown_Alphabet', 1020, y)
      addAnimationByPrefix('a3', 'a3anim', 'A', 24, true)
      scaleObject('a3', 0.6, 0.6)
      addLuaSprite('a3', true)

      function onUpdate(elapsed)
        local checkG = getPropertyFromClass('flixel.FlxG', 'keys.justPressed.G')
        local checkR = getPropertyFromClass('flixel.FlxG', 'keys.justPressed.R')
        local checkA = getPropertyFromClass('flixel.FlxG', 'keys.justPressed.A')
        local checkK = getPropertyFromClass('flixel.FlxG', 'keys.justPressed.K')

        if moveOn == 0 and checkG == true then
          removeLuaSprite('g')
          moveOn = 1
        end

        if moveOn == 1 and checkR == true then
          removeLuaSprite('r')
          moveOn = 2
        end

        if moveOn == 2 and checkA == true then
          removeLuaSprite('a')
          moveOn = 3
        end

        if moveOn == 3 and checkK == true then
          removeLuaSprite('k')
          moveOn = 4
        end

        if moveOn == 4 and checkA == true then
          removeLuaSprite('a2')
          moveOn = 5
        end

        if moveOn == 5 and checkK == true then
          removeLuaSprite('k2')
          moveOn = 6
        end

        if moveOn == 6 and checkA == true then
          removeLuaSprite('a3')
          removeLuaSprite('static', false)
          removeLuaSprite('countdown', false)
          doneYetCheck = true
        end

      end
    end

    if case == 10 then --beep boop
      makeAnimatedLuaSprite('b', 'monojack tingz/Unown_Alphabet', 290, y)
      addAnimationByPrefix('b', 'banim', 'B', 24, true)
      scaleObject('b', 0.55, 0.55)
      addLuaSprite('b', true)

      makeAnimatedLuaSprite('e', 'monojack tingz/Unown_Alphabet', 385, y)
      addAnimationByPrefix('e', 'eanim', 'E', 24, true)
      scaleObject('e', 0.55, 0.55)
      addLuaSprite('e', true)

      makeAnimatedLuaSprite('e2', 'monojack tingz/Unown_Alphabet', 490, y)
      addAnimationByPrefix('e2', 'e2anim', 'E', 24, true)
      scaleObject('e2', 0.55, 0.55)
      addLuaSprite('e2', true)

      makeAnimatedLuaSprite('p', 'monojack tingz/Unown_Alphabet', 615, y)
      addAnimationByPrefix('p', 'panim', 'P', 24, true)
      scaleObject('p', 0.55, 0.55)
      addLuaSprite('p', true)

      makeAnimatedLuaSprite('b2', 'monojack tingz/Unown_Alphabet', 760, y)
      addAnimationByPrefix('b2', 'b2anim', 'B', 24, true)
      scaleObject('b2', 0.55, 0.55)
      addLuaSprite('b2', true)

      makeAnimatedLuaSprite('o', 'monojack tingz/Unown_Alphabet', 860, y)
      addAnimationByPrefix('o', 'oanim', 'O', 24, true)
      scaleObject('o', 0.55, 0.55)
      addLuaSprite('o', true)

      makeAnimatedLuaSprite('o2', 'monojack tingz/Unown_Alphabet', 990, y)
      addAnimationByPrefix('o2', 'o2anim', 'O', 24, true)
      scaleObject('o2', 0.55, 0.55)
      addLuaSprite('o2', true)

      makeAnimatedLuaSprite('p2', 'monojack tingz/Unown_Alphabet', 1130, y)
      addAnimationByPrefix('p2', 'p2anim', 'P', 24, true)
      scaleObject('p2', 0.55, 0.55)
      addLuaSprite('p2', true)

      function onUpdate(elapsed)
        local checkB = getPropertyFromClass('flixel.FlxG', 'keys.justPressed.B')
        local checkE = getPropertyFromClass('flixel.FlxG', 'keys.justPressed.E')
        local checkO = getPropertyFromClass('flixel.FlxG', 'keys.justPressed.O')
        local checkP = getPropertyFromClass('flixel.FlxG', 'keys.justPressed.P')

        if moveOn == 0 and checkB == true then
          removeLuaSprite('b')
          moveOn = 1
        end

        if moveOn == 1 and checkE == true then
          removeLuaSprite('e')
          moveOn = 2
        end

        if moveOn == 2 and checkE == true then
          removeLuaSprite('e2')
          moveOn = 3
        end

        if moveOn == 3 and checkP == true then
          removeLuaSprite('p')
          moveOn = 4
        end

        if moveOn == 4 and checkB == true then
          removeLuaSprite('b2')
          moveOn = 5
        end

        if moveOn == 5 and checkO == true then
          removeLuaSprite('o')
          moveOn = 6
        end

        if moveOn == 6 and checkO == true then
          removeLuaSprite('o2')
          moveOn = 7
        end

        if moveOn == 7 and checkP == true then
          removeLuaSprite('p2')
          removeLuaSprite('static', false)
          removeLuaSprite('countdown', false)
          doneYetCheck = true
        end

      end
    end

    if case == 11 then --not a banana
      makeAnimatedLuaSprite('n', 'monojack tingz/Unown_Alphabet', 140, y)
      addAnimationByPrefix('n', 'nanim', 'N', 24, true)
      scaleObject('n', 0.5, 0.5)
      addLuaSprite('n', true)

      makeAnimatedLuaSprite('o', 'monojack tingz/Unown_Alphabet', 265, y)
      addAnimationByPrefix('o', 'oanim', 'O', 24, true)
      scaleObject('o', 0.5, 0.5)
      addLuaSprite('o', true)

      makeAnimatedLuaSprite('t', 'monojack tingz/Unown_Alphabet', 390, y)
      addAnimationByPrefix('t', 'tanim', 'T', 24, true)
      scaleObject('t', 0.5, 0.5)
      addLuaSprite('t', true)

      makeAnimatedLuaSprite('a', 'monojack tingz/Unown_Alphabet', 560, y)
      addAnimationByPrefix('a', 'aanim', 'A', 24, true)
      scaleObject('a', 0.5, 0.5)
      addLuaSprite('a', true)

      makeAnimatedLuaSprite('b', 'monojack tingz/Unown_Alphabet', 740, y)
      addAnimationByPrefix('b', 'banim', 'B', 24, true)
      scaleObject('b', 0.5, 0.5)
      addLuaSprite('b', true)

      makeAnimatedLuaSprite('a2', 'monojack tingz/Unown_Alphabet', 830, y)
      addAnimationByPrefix('a2', 'a2anim', 'A', 24, true)
      scaleObject('a2', 0.5, 0.5)
      addLuaSprite('a2', true)

      makeAnimatedLuaSprite('n2', 'monojack tingz/Unown_Alphabet', 930, y)
      addAnimationByPrefix('n2', 'n2anim', 'N', 24, true)
      scaleObject('n2', 0.5, 0.5)
      addLuaSprite('n2', true)

      makeAnimatedLuaSprite('a3', 'monojack tingz/Unown_Alphabet', 1035, y)
      addAnimationByPrefix('a3', 'a3anim', 'A', 24, true)
      scaleObject('a3', 0.5, 0.5)
      addLuaSprite('a3', true)

      makeAnimatedLuaSprite('n3', 'monojack tingz/Unown_Alphabet', 1140, y)
      addAnimationByPrefix('n3', 'n3anim', 'N', 24, true)
      scaleObject('n3', 0.5, 0.5)
      addLuaSprite('n3', true)

      makeAnimatedLuaSprite('a4', 'monojack tingz/Unown_Alphabet', 1250, y)
      addAnimationByPrefix('a4', 'a4anim', 'A', 24, true)
      scaleObject('a4', 0.5, 0.5)
      addLuaSprite('a4', true)

      function onUpdate(elapsed)
        local checkN = getPropertyFromClass('flixel.FlxG', 'keys.justPressed.N')
        local checkO = getPropertyFromClass('flixel.FlxG', 'keys.justPressed.O')
        local checkT = getPropertyFromClass('flixel.FlxG', 'keys.justPressed.T')
        local checkA = getPropertyFromClass('flixel.FlxG', 'keys.justPressed.A')
        local checkB = getPropertyFromClass('flixel.FlxG', 'keys.justPressed.B')
        
        if moveOn == 0 and checkN == true then
          removeLuaSprite('n')
          moveOn = 1
        end

        if moveOn == 1 and checkO == true then
          removeLuaSprite('o')
          moveOn = 2
        end

        if moveOn == 2 and checkT == true then
          removeLuaSprite('t')
          moveOn = 3
        end

        if moveOn == 3 and checkA == true then
          removeLuaSprite('a')
          moveOn = 4
        end

        if moveOn == 4 and checkB == true then
          removeLuaSprite('b')
          moveOn = 5
        end

        if moveOn == 5 and checkA == true then
          removeLuaSprite('a2')
          moveOn = 6
        end

        if moveOn == 6 and checkN == true then
          removeLuaSprite('n2')
          moveOn = 7
        end

        if moveOn == 7 and checkA == true then
          removeLuaSprite('a3')
          moveOn = 8
        end

        if moveOn == 8 and checkN == true then
          removeLuaSprite('n3')
          moveOn = 9
        end

        if moveOn == 9 and checkA == true then
          removeLuaSprite('a4')
          removeLuaSprite('static', false)
          removeLuaSprite('countdown', false)
          doneYetCheck = true
        end

      end
    end

    if case == 12 then --ur mom lol
      makeAnimatedLuaSprite('u', 'monojack tingz/Unown_Alphabet', 250, y)
      addAnimationByPrefix('u', 'uanim', 'U', 24, true)
      scaleObject('u', 0.55, 0.55)
      addLuaSprite('u', true)

      makeAnimatedLuaSprite('r', 'monojack tingz/Unown_Alphabet', 370, y)
      addAnimationByPrefix('r', 'ranim', 'R', 24, true)
      scaleObject('r', 0.55, 0.55)
      addLuaSprite('r', true)

      makeAnimatedLuaSprite('m', 'monojack tingz/Unown_Alphabet', 510, y)
      addAnimationByPrefix('m', 'manim', 'M', 24, true)
      scaleObject('m', 0.55, 0.55)
      addLuaSprite('m', true)

      makeAnimatedLuaSprite('o', 'monojack tingz/Unown_Alphabet', 625, y)
      addAnimationByPrefix('o', 'oanim', 'O', 24, true)
      scaleObject('o', 0.55, 0.55)
      addLuaSprite('o', true)

      makeAnimatedLuaSprite('m2', 'monojack tingz/Unown_Alphabet', 750, y)
      addAnimationByPrefix('m2', 'm2anim', 'M', 24, true)
      scaleObject('m2', 0.55, 0.55)
      addLuaSprite('m2', true)

      makeAnimatedLuaSprite('l', 'monojack tingz/Unown_Alphabet', 915, y)
      addAnimationByPrefix('l', 'lanim', 'L', 24, true)
      scaleObject('l', 0.55, 0.55)
      addLuaSprite('l', true)

      makeAnimatedLuaSprite('o2', 'monojack tingz/Unown_Alphabet', 990, y)
      addAnimationByPrefix('o2', 'o2anim', 'O', 24, true)
      scaleObject('o2', 0.55, 0.55)
      addLuaSprite('o2', true)

      makeAnimatedLuaSprite('l2', 'monojack tingz/Unown_Alphabet', 1110, y)
      addAnimationByPrefix('l2', 'l2anim', 'L', 24, true)
      scaleObject('l2', 0.55, 0.55)
      addLuaSprite('l2', true)

      function onUpdate(elapsed)
        local checkU = getPropertyFromClass('flixel.FlxG', 'keys.justPressed.U')
        local checkR = getPropertyFromClass('flixel.FlxG', 'keys.justPressed.R')
        local checkM = getPropertyFromClass('flixel.FlxG', 'keys.justPressed.M')
        local checkO = getPropertyFromClass('flixel.FlxG', 'keys.justPressed.O')
        local checkL = getPropertyFromClass('flixel.FlxG', 'keys.justPressed.L')

        if moveOn == 0 and checkU == true then
          removeLuaSprite('u')
          moveOn = 1
        end

        if moveOn == 1 and checkR == true then
          removeLuaSprite('r')
          moveOn = 2
        end

        if moveOn == 2 and checkM == true then
          removeLuaSprite('m')
          moveOn = 3
        end

        if moveOn == 3 and checkO == true then
          removeLuaSprite('o')
          moveOn = 4
        end

        if moveOn == 4 and checkM == true then
          removeLuaSprite('m2')
          moveOn = 5
        end

        if moveOn == 5 and checkL == true then
          removeLuaSprite('l')
          moveOn = 6
        end

        if moveOn == 6 and checkO == true then
          removeLuaSprite('o2')
          moveOn = 7
        end

        if moveOn == 7 and checkL == true then
          removeLuaSprite('l2')
          removeLuaSprite('static', false)
          removeLuaSprite('countdown', false)
          doneYetCheck = true
        end

      end
    end

    if case == 13 then --awooga
      makeAnimatedLuaSprite('a', 'monojack tingz/Unown_Alphabet', 310, y)
      addAnimationByPrefix('a', 'aanim', 'A', 24, true)
      scaleObject('a', 0.7, 0.7)
      addLuaSprite('a', true)

      makeAnimatedLuaSprite('w', 'monojack tingz/Unown_Alphabet', 440, y)
      addAnimationByPrefix('w', 'wanim', 'W', 24, true)
      scaleObject('w', 0.7, 0.7)
      addLuaSprite('w', true)

      makeAnimatedLuaSprite('o', 'monojack tingz/Unown_Alphabet', 575, y)
      addAnimationByPrefix('o', 'oanim', 'O', 24, true)
      scaleObject('o', 0.7, 0.7)
      addLuaSprite('o', true)

      makeAnimatedLuaSprite('o2', 'monojack tingz/Unown_Alphabet', 730, y)
      addAnimationByPrefix('o2', 'o2anim', 'O', 24, true)
      scaleObject('o2', 0.7, 0.7)
      addLuaSprite('o2', true)

      makeAnimatedLuaSprite('g', 'monojack tingz/Unown_Alphabet', 890, y)
      addAnimationByPrefix('g', 'ganim', 'G', 24, true)
      scaleObject('g', 0.7, 0.7)
      addLuaSprite('g', true)

      makeAnimatedLuaSprite('a2', 'monojack tingz/Unown_Alphabet', 1015, y)
      addAnimationByPrefix('a2', 'a2anim', 'A', 24, true)
      scaleObject('a2', 0.7, 0.7)
      addLuaSprite('a2', true)

      function onUpdate(elapsed)
        local checkA = getPropertyFromClass('flixel.FlxG', 'keys.justPressed.A')
        local checkW = getPropertyFromClass('flixel.FlxG', 'keys.justPressed.W')
        local checkO = getPropertyFromClass('flixel.FlxG', 'keys.justPressed.O')
        local checkG = getPropertyFromClass('flixel.FlxG', 'keys.justPressed.G')

        if moveOn == 0 and checkA == true then
          removeLuaSprite('a')
          moveOn = 1
        end

        if moveOn == 1 and checkW == true then
          removeLuaSprite('w')
          moveOn = 2
        end

        if moveOn == 2 and checkO == true then
          removeLuaSprite('o')
          moveOn = 3
        end

        if moveOn == 3 and checkO == true then
          removeLuaSprite('o2')
          moveOn = 4
        end

        if moveOn == 4 and checkG == true then
          removeLuaSprite('g')
          moveOn = 5
        end

        if moveOn == 5 and checkA == true then
          removeLuaSprite('a2')
          removeLuaSprite('static', false)
          removeLuaSprite('countdown', false)
          doneYetCheck = true
        end

      end
    end

    if case == 14 then --me when
      makeAnimatedLuaSprite('m', 'monojack tingz/Unown_Alphabet', 200, y)
      addAnimationByPrefix('m', 'manim', 'M', 24, true)
      scaleObject('m', 0.7, 0.7)
      addLuaSprite('m', true)

      makeAnimatedLuaSprite('e', 'monojack tingz/Unown_Alphabet', 350, y)
      addAnimationByPrefix('e', 'eanim', 'E', 24, true)
      scaleObject('e', 0.7, 0.7)
      addLuaSprite('e', true)

      makeAnimatedLuaSprite('w', 'monojack tingz/Unown_Alphabet', 640, y)
      addAnimationByPrefix('w', 'wanim', 'W', 24, true)
      scaleObject('w', 0.7, 0.7)
      addLuaSprite('w', true)

      makeAnimatedLuaSprite('h', 'monojack tingz/Unown_Alphabet', 790, y)
      addAnimationByPrefix('h', 'hanim', 'H', 24, true)
      scaleObject('h', 0.7, 0.7)
      addLuaSprite('h', true)

      makeAnimatedLuaSprite('e2', 'monojack tingz/Unown_Alphabet', 940, y)
      addAnimationByPrefix('e2', 'e2anim', 'E', 24, true)
      scaleObject('e2', 0.7, 0.7)
      addLuaSprite('e2', true)

      makeAnimatedLuaSprite('n', 'monojack tingz/Unown_Alphabet', 1080, y)
      addAnimationByPrefix('n', 'nanim', 'N', 24, true)
      scaleObject('n', 0.7, 0.7)
      addLuaSprite('n', true)

      function onUpdate(elapsed)
        local checkM = getPropertyFromClass('flixel.FlxG', 'keys.justPressed.M')
        local checkE = getPropertyFromClass('flixel.FlxG', 'keys.justPressed.E')
        local checkW = getPropertyFromClass('flixel.FlxG', 'keys.justPressed.W')
        local checkH = getPropertyFromClass('flixel.FlxG', 'keys.justPressed.H')
        local checkN = getPropertyFromClass('flixel.FlxG', 'keys.justPressed.N')

        if moveOn == 0 and checkM == true then
          removeLuaSprite('m')
          moveOn = 1
        end

        if moveOn == 1 and checkE == true then
          removeLuaSprite('e')
          moveOn = 2
        end

        if moveOn == 2 and checkW == true then
          removeLuaSprite('w')
          moveOn = 3
        end

        if moveOn == 3 and checkH == true then
          removeLuaSprite('h')
          moveOn = 4
        end

        if moveOn == 4 and checkE == true then
          removeLuaSprite('e2')
          moveOn = 5
        end

        if moveOn == 5 and checkN == true then
          removeLuaSprite('n')
          removeLuaSprite('static', false)
          removeLuaSprite('countdown', false)
          doneYetCheck = true
        end

      end
    end

  end

  if name == 'lowerHealth' then
    health = getProperty('health')
    newHealth = health * 0.85
    setProperty('health', newHealth)
  end

  if name == 'changeAlphaNotes' then
    noteTweenAlpha('alphaChangeOL', 0, 0, 1, 'linear')
    noteTweenAlpha('alphaChangeOD', 1, 0, 1, 'linear')
    noteTweenAlpha('alphaChangeOU', 2, 0, 1, 'linear')
    noteTweenAlpha('alphaChangeOR', 3, 0, 1, 'linear')
    
    noteTweenAlpha('alphaChangeL', 4, 0.73, 1, 'linear')
    noteTweenAlpha('alphaChangeD', 5, 0.73, 1, 'linear')
    noteTweenAlpha('alphaChangeU', 6, 0.73, 1, 'linear')
    noteTweenAlpha('alphaChangeR', 7, 0.73, 1, 'linear')
  end
end

function onTimerCompleted(tag, loops, loopsLeft)
	if tag == 'doneYet' then -- Timer completed, play dialogue
		if doneYetCheck == false then
      setProperty('health', 0)
    end
	end
end