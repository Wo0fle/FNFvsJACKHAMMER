function noteMiss(id, direction, noteType, isSustainNote)
	cameraShake("game", 0.05, 0.05)
end

function onMoveCamera(focus)
	if focus == 'boyfriend' then
		function goodNoteHit(id, direction, noteType, isSustainNote)
			camX = getProperty('camFollowPos.x')
			camY = getProperty('camFollowPos.y')
			
			if direction == 0 then
				setProperty('camFollowPos.x', camX - 5)
			elseif direction == 1 then
				setProperty('camFollowPos.y', camY + 5)
			elseif direction == 2 then				
				setProperty('camFollowPos.y', camY - 5)
			elseif direction == 3 then
				setProperty('camFollowPos.x', camX + 5)
			end
			-- 0 = Left, 1 = Down, 2 = Up, 3 = Right
		end
	elseif focus == 'dad' then
		function opponentNoteHit(id, direction, noteType, isSustainNote)
			camX = getProperty('camFollowPos.x')
			camY = getProperty('camFollowPos.y')
			
			if direction == 0 then
				setProperty('camFollowPos.x', camX - 5)
			elseif direction == 1 then
				setProperty('camFollowPos.y', camY + 5)
			elseif direction == 2 then				
				setProperty('camFollowPos.y', camY - 5)
			elseif direction == 3 then
				setProperty('camFollowPos.x', camX + 5)
			end
		end
	end
end