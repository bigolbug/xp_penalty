XP_Penalty Mod for Minetest
==========================

Description:
------------
XP Penalty is a server-side mod that tracks player-vs-player (PVP) kills and penalizes repeat kills
within a specified time window. If a player kills the same victim multiple times within a configurable
time limit, they lose XP using the xp_redo mod. This helps prevent griefing or abuse in PVP-focused worlds.

Features:
---------
- Tracks who each player kills and when
- Penalizes repeat kills within a time window (default: 600 seconds)
- Deducts XP (default: 25% of XP) from the killer using xp_redo
- Includes chat command to toggle the mod on/off at runtime
- Configuration is persistent and customizable via minetest.conf

Dependencies:
-------------
- [xp_redo] mod (required)
  https://content.minetest.net/packages/xaenvironment/xp_redo/

File Structure:
---------------
- init.lua           - Loads the mod and handles player deaths
- api.lua            - Utility functions for kill tracking and XP penalties
- config.lua         - Reads mod configuration from minetest.conf
- chatcommands.lua   - Adds /xppcmd and /kill_log commands

Chat Commands:
--------------
- /xppcmd on         - Enable the smart PVP mod
- /xppcmd off        - Disable the mod
- /xppcmd status     - Show current mod status
- /kill_log          - View your recent kills and their timestamps

Configuration (minetest.conf):
------------------------------
You can add the following settings to your minetest.conf file:

    xp_penalty.repeat_kill_window = 300      # in seconds
    xp_penalty.penalty = 25             # percentage of XP to remove on repeat kill

Example Usage in Minetest.conf
------------------------------
# Time (in seconds) that counts as a repeat kill
xp_penalty.repeat_kill_window = 300

# XP penalty for repeated kills
xp_penalty.penalty = 25


Default Values:
---------------
- repeat_kill_window: 300 seconds (5 minutes)
- penalty: 25% of XP

Mod Author:
-----------
Mark MacLean / ChatGPT

License:
--------
MIT License (feel free to use, modify, and redistribute)

Notes:
------
- XP is only deducted when the killer and victim are both players.
- Kill data is saved persistently using Minetest's mod storage system.
- This mod does not block killing — it only penalizes repeated behavior.