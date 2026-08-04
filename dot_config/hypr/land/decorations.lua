-- ~/.config/hypr/land/decorations.lua

hl.config({
    general = {
        gaps_in = 3,
        gaps_out = 8,
        border_size = 2,

        extend_border_grab_area = 10,
        resize_on_border = true,

        col = {
            active_border = {
                colors = { CACHYLRED, CACHYLGREEN, CACHYLBLUE },
                angle = 60,
            },
            inactive_border = CACHYGRAY,
        },

        -- Allows screen tearing and reducing jitter when true
        allow_tearing = false,

        layout = "dwindle",
    },

    group = {
        col = {
            border_active = CACHYLBLUE,
            border_inactive = CACHYGRAY,
            border_locked_active = CACHYDBLUE,
            border_locked_inactive = CACHYGRAY,
        },
        groupbar = {
            col = {
                active = CACHYLGREEN,
                inactive = CACHYGRAY,
                locked_active = CACHYDBLUE,
                locked_inactive = CACHYGRAY,
            },
        },
    },

    decoration = {
        rounding = 10,

        active_opacity = 0.95,
        inactive_opacity = 0.85,
        fullscreen_opacity = 1,

        dim_inactive = true,
        dim_strength = 0.2,
        dim_special = 0.8,

        blur = {
            enabled   = true,
            size      = 3,
            passes    = 1,
            vibrancy  = 0.1696,
            special = true,
        },
    },

    animations = {
        enabled = true,
        workspace_wraparound = true
    },
})

