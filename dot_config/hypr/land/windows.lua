-- ~/.config/hypr/land/configs.lua

-- Run hyprctl clients to see the stuff to match
-- Pay attention to initialClass and initialTitle tho,
-- has to match those bc those are on startup

--[[
-- Bitwarden Popup
hl.window_rule({
    match = { class = "firefox", title = ".*Bitwarden.*" },
    float = true,
    center = true
})

-- Brightspace Login
hl.window_rule({
    match = { class = "google-chrome", title = "Login - Purdue University System - Google Chrome" },
    float = true,
    center = true
})
]]

-- STM32CubeMX
hl.window_rule({
    match = { class = "com-st-microxplorer-maingui-STM32CubeMX" },
    float = true,
    center = true
})

-- Qalculate GTK
hl.window_rule({
    match = { class = "qalculate-gtk" },
    float = true,
    center = true
})

-- nRF Connect Power Profiler
hl.window_rule({
    match = { class = "nrfconnect", title = "Power Profiler.*" },
    float = true,
    center = true
})

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

  --no_anim    = true,
  --no_blur    = true,
  --no_dim     = true,
  --no_shadow  = true,
  --opaque     = true,
  --force_rgbx = true
})

-- GIMP main window (needs allowance in below suppression rule)
hl.window_rule({
  match      = { class = "gimp", title = "GNU.*" },
  fullscreen = true
})

local suppressMaximizeRule = hl.window_rule({
    -- Ignore maximize requests from all apps
    -- To add to list of exceptions, (gimp|something|something...)
    name  = "suppress-maximize-events",
    match = { class = ".*" },
    match = { class = "^(?!^(gimp)$).*" },

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

