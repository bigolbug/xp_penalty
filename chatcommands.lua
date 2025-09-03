-- chatcommands.lua

core.register_chatcommand("kill_log", {
	description = "Show your recent kill timestamps",
	privs = { interact = true },
	func = function(name)
        local XP = xp_redo.get_xp(name)
		local data = xp_penalty.get_kill_data(name)
		local lines = {"Your recent kills:"}
        core.chat_send_player(name,"Current XP: ".. XP)
		for victim, timestamp in pairs(data) do
			local time_str = os.date("%Y-%m-%d %H:%M:%S", timestamp)
			table.insert(lines, "- " .. victim .. " at " .. time_str)
		end
		return true, table.concat(lines, "\n")
	end
})

core.register_chatcommand("xppcmd", {
	params = "<on|off|status>",
	description = "Toggle or check the PVP mod status",
	privs = { server = true },
	func = function(name, param)
		param = param:lower()
		if param == "on" then
            xp_penalty.metadata:set_int("enabled",1)
			return true, "PVP mod enabled."
		elseif param == "off" then
			xp_penalty.metadata:set_int("enabled",0)
			return true, "PVP mod disabled."
		elseif param == "status" then
            local enabled = xp_penalty.metadata:get_int("enabled")
			if enabled == 1 then
				return true, "Mod is currently ENABLED."
			else
				return true, "Mod is currently DISABLED."
			end
		else
			return false, "Usage: /xppcmd <on|off|status>"
		end
	end
})