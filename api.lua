-- api.lua

-- Load kill data for a player
function xp_penalty.get_kill_data(player_name)
	local raw = xp_penalty.metadata:get_string(player_name)
	if raw == "" then return {} end
	return core.deserialize(raw) or {}
end

-- Save kill data for a player
function xp_penalty.set_kill_data(player_name, data)
	xp_penalty.metadata:set_string(player_name, core.serialize(data))
end

-- Log a kill in the killer's metadata
function xp_penalty.log_kill(killer_name, victim_name)
	local data = xp_penalty.get_kill_data(killer_name)
	data[victim_name] = os.time()
	xp_penalty.set_kill_data(killer_name, data)
end

-- Check if this is a repeat kill within the limit
function xp_penalty.is_repeat_kill(killer_name, victim_name)
	local data = xp_penalty.get_kill_data(killer_name)
	local last_time = data[victim_name]
	if last_time and os.difftime(os.time(), last_time) <= xp_penalty.repeat_kill_window then
		return true
	end
	return false
end
