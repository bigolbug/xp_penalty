xp_penalty = {}

-- config.lua

-- Time window (in seconds) to detect repeated kills
xp_penalty.repeat_kill_window = 300  -- 5 minutes
xp_penalty.penalty = 0.25         -- XP to remove for repeat kills
xp_penalty.metadata = core.get_mod_storage()