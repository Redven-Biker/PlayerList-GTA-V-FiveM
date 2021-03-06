--Playerlist created by Arturs
local plist = false
function ShowPlayerList()
	if plist == false then
		local players 
		players = '<tr class= "titles"><th class="name">Nom</th><th class="id">ID</th></tr>'
		for i = 0,32 do
			if NetworkIsPlayerActive(GetPlayerFromServerId(i)) then --Check if player is active
				--if i ~= PlayerId() then -- enable this check to not display local player
					players = players..' <tr class="player"><th class="name">'..GetPlayerName(GetPlayerFromServerId(i))..'</th>'..' <th class="id">'..i..'</th></tr>'
				--end
			end
		end
		players = players
		SendNUIMessage({
			meta = 'open',
			players = players
		})
		plist = true
	else
		SendNUIMessage({ 
			meta = 'close'
		})
		plist = false
	end
end

Citizen.CreateThread( function()
	while true do
		Citizen.Wait(0)
		--Displays playerlist when player hold X
		if IsControlJustPressed(0, 27) then --Start holding
			ShowPlayerList()
		elseif IsControlJustReleased(0, 27) then --Stop holding
			ShowPlayerList()
		end
	end
end)