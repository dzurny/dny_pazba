enabled = false
TriggerEvent('chat:addSuggestion', '/pažba', '[Zapnuto] Zapíná a vypíná schopnost udeřit osobu pažbou.')

-- Toogle pažby
RegisterCommand("pazba", function()
	enabled = not enabled
	TriggerEvent('chat:removeSuggestion', '/pazba')

	-- Ať hráč není clueless jestli má pažbu nebo ne.
	if enabled then
		TriggerEvent('chat:addSuggestion', '/pazba', '[Zapnuto] Zapíná a vypíná schopnost udeřit osobu pažbou.')
		lib.notify({
			description = 'Úder pažbou je nyní povolen!',
			type = 'inform'
		})
	else
		TriggerEvent('chat:addSuggestion', '/pazba', '[Vypnuto] Zapíná a vypíná schopnost udeřit osobu pažbou.')
		lib.notify({
			description = 'Úder pažbou je nyní zakázán!',
			type = 'inform'
		})
	end
end)

local running = false

AddEventHandler('ox_inventory:currentWeapon', function(weapon)
	if not running then
		CreateThread(function()
			while running do Wait(0)
                DisableControlAction(1, 140, true)
                DisableControlAction(1, 141, true)
                DisableControlAction(1, 142, true)
			end
		end)
	else
		if weapon == nil then
			running = false
		end
	end
end)