-- ~/.config/hypr/hyprland.lua

local prefs = require("land.prefs")
require("land.binds")
require("land.animations")
require("land.inputs")
require("land.monitors")

-- Autostart
hl.on("hyprland.start", function ()
    for _, prog in ipairs(prefs.startups) do
        hl.exec_cmd(prog)
    end
    hl.exec_cmd(prefs.scripts_dir .. "/startup_wallpaper")
end)

hl.env("XCURSOR_SIZE", "24")
hl.env("HYPRCURSOR_SIZE", "24")
hl.env("QT_QPA_PLATFORMTHEME", "qt6ct")

require("land.configs")
require("land.windows")

