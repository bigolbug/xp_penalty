xp_penalty = {}
local setting = core.settings
-- config.lua

-- Time window (in seconds) to detect repeated kills
xp_penalty.repeat_kill_window = tonumber(setting:get("xp_penalty.repeat_kill_window")) or 300  -- 5 minutes
if not setting:get("xp_penalty.penalty") then
    xp_penalty.penalty = 0.25
else
    xp_penalty.penalty = tonumber(setting:get("xp_penalty.penalty"))/100    
end
xp_penalty.metadata = core.get_mod_storage()