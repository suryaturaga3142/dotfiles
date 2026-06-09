-- ~/.config/hypr/land/configs.lua

-- Network Manager Connection Editor
hl.window_rule({
  match  = { class = "nm-connection-editor" },
  float  = true,
  size   = { 400, 500 },
  center = true
})

-- Blueman Manager
hl.window_rule({
  match  = { class = "blueman-manager" },
  float  = true,
  size   = { 600, 500 },
  center = true
})

-- Pulseaudio Control
hl.window_rule({
  match  = { class = "org.pulseaudio.pavucontrol" },
  float  = true,
  size   = { 600, 500 },
  center = true
})

-- CopyQ Clipboard Manager (glitchy in search)
hl.window_rule({
  match = { class = "com.github.hluk.copyq" },
  float = true,
  size  = { 500, 400 },
  move  = { "cursor_x-(window_w*0.5)", "cursor_y-(window_h*0.5)" },

  no_anim    = true,
  no_blur    = true,
  no_dim     = true,
  no_shadow  = true,
  opaque     = true,
  force_rgbx = true
})

-- GIMP main window (doesnt work yet)
hl.window_rule({
  match      = { class = "gimp", title = "GNU*" },
  fullscreen = true
})

local suppressMaximizeRule = hl.window_rule({
    -- Ignore maximize requests from all apps
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

