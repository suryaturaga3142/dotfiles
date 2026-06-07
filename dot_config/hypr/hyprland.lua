-- ~/.config/hypr/hyprland.lua

local prefs = require("land.prefs")
require("land.binds")
require("land.inputs")
require("land.animations")
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

hl.config({
    xwayland = {
        force_zero_scaling = true
    }
})

hl.config({
    general = {
        border_size = 2,

        gaps_in  = 5,
        gaps_out = 10,


        col = {
            active_border   = { colors = {"rgba(3388ffee)", "rgba(22ff22ee)", "rgba(ff0066ee)"}, angle = 60 },
            inactive_border = "rgba(444444cc)",
        },

        resize_on_border = false,

        -- Allows screen tearing and reducing jitter when true
        allow_tearing = false,

        layout = "dwindle",
    },

    decoration = {
        rounding       = 10,
        rounding_power = 2,

        active_opacity   = 1.0,
        inactive_opacity = 0.8,

        dim_inactive = true,
        dim_strength = 0.2,

        shadow = {
            enabled      = true,
            range        = 4,
            render_power = 3,
            color        = 0xee1a1a1a,
        },

        blur = {
            enabled   = true,
            size      = 3,
            passes    = 1,
            vibrancy  = 0.1696,
        },
    },

    animations = {
        enabled = true,
        workspace_wraparound = true
    },
})

hl.config({
    dwindle = {
        preserve_split = true,
        smart_split = true
    },
})

hl.config({
    master = {
        new_status = "master",
    },
})

hl.config({
    scrolling = {
        fullscreen_on_one_column = true,
    },
})


local suppressMaximizeRule = hl.window_rule({
    -- Ignore maximize requests from all apps. You'll probably like this.
    name  = "suppress-maximize-events",
    match = { class = ".*" },

    suppress_event = "maximize",
})
-- suppressMaximizeRule:set_enabled(false)

hl.window_rule({
    -- Fix some dragging issues with XWayland
    name  = "fix-xwayland-drags",
    match = {
        class      = "^$",
        title      = "^$",
        xwayland   = true,
        float      = true,
        fullscreen = false,
        pin        = false,
    },

    no_focus = true,
})

-- Hyprland-run windowrule
hl.window_rule({
    name  = "move-hyprland-run",
    match = { class = "hyprland-run" },

    move  = "20 monitor_h-120",
    float = true,
})

