-- init.lua

dofile(core.get_modpath(core.get_current_modname()) .. "/config.lua")
dofile(core.get_modpath(core.get_current_modname()) .. "/api.lua")
dofile(core.get_modpath(core.get_current_modname()) .. "/chatcommands.lua")

-- Register death handler
core.register_on_dieplayer(function(victim, reason)
	if not reason or not reason.type or reason.type ~= "punch" then return end
	if not reason.object or not reason.object:is_player() then return end

	local killer = reason.object
	local killer_name = killer:get_player_name()
	local victim_name = victim:get_player_name()
    local mod_enabled = xp_penalty.metadata:get_int("enabled")

	if xp_penalty.is_repeat_kill(killer_name, victim_name) and mod_enabled == 1 then
		if xp_redo then
            local penalty = math.floor(xp_redo.get_xp(killer_name)*xp_penalty.penalty)
			xp_redo.add_xp(killer_name, -penalty)
            xp_redo.add_xp(victim_name, penalty+1000)
			core.chat_send_player(killer_name, "You lost " .. penalty .. " XP for repeat killing " .. victim_name)
            core.chat_send_player(victim_name, "You gained " .. penalty+1000 .. " XP for ".. killer_name.." repeat killing you")
		else
			core.log("warning", "[xp_penalty] xp_redo not found or not properly loaded.")
		end
	end

	xp_penalty.log_kill(killer_name, victim_name)
end)

