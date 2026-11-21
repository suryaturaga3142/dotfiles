-- ~/.config/hypr/land/workspaces.lua

local prefs = require("land.prefs")

hl.workspace_rule({ workspace = "1", monitor = prefs.mon1, default = true, persistent = true })
hl.workspace_rule({ workspace = "2", monitor = prefs.mon1, default = true, persistent = true })
hl.workspace_rule({ workspace = "3", monitor = prefs.mon1, default = true, persistent = true })

--if (prefs.mon2 ~= nil) then
--    hl.workspace_rule({ workspace = "4", monitor = prefs.mon2, default = true, persistent = true })
--    hl.workspace_rule({ workspace = "5", monitor = prefs.mon2, default = true, persistent = true })
--    hl.workspace_rule({ workspace = "6", monitor = prefs.mon2, default = true, persistent = true })
--end

