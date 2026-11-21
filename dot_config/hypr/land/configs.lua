-- ~/.config/hypr/land/configs.lua

hl.config({
    xwayland = {
        force_zero_scaling = true
    }
})

hl.config({
    general = {
        border_size = 2,

        gaps_in  = 5,
        gaps_out = 5,


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
        dim_special = 0.8,

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
    ecosystem = {
        no_update_news = true,
        no_donation_nag = true,
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

hl.config({
    misc = {
        col = {
            splash = CACHYLGREEN,
        },
        middle_click_paste = false,
        enable_swallow = true,
        swallow_regex = "(kitty|ghostty|[Kk]onsole|Alacritty|gnome-terminal|xfce[0-9]?-terminal)",
        vrr = 3,
    },
    render = {
        direct_scanout = 2,
        -- Use the option below if you find games constantly black screening for a couple seconds whenever direct scanout enables/disables
        -- non_shader_cm = 0,
    },
})

