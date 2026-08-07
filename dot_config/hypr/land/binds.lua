-- ~/.config/hypr/land/binds.lua

local prefs = require("land.prefs")

hl.bind(prefs.mainMod .. " + C", hl.dsp.window.close())

hl.bind(prefs.mainMod .. " + M", hl.dsp.exec_cmd("loginctl lock-session"))
hl.bind(prefs.mainMod .. " + SHIFT + M", hl.dsp.exec_cmd("kitty --start-as=fullscreen -e sh -c 'sleep 1 && unimatrix'"))

hl.bind(prefs.mainMod .. " + Q", hl.dsp.exec_cmd(prefs.terminal))
hl.bind(prefs.mainMod .. " + SHIFT + Q", hl.dsp.exec_cmd(prefs.ide))
hl.bind(prefs.mainMod .. " + CTRL + Q", hl.dsp.exec_cmd(prefs.ide2))

hl.bind(prefs.mainMod .. " + S", hl.dsp.exec_cmd(prefs.fileManager))
hl.bind(prefs.mainMod .. " + SHIFT + S", hl.dsp.exec_cmd(prefs.fileAnalyzer))

-- Browser
hl.bind(prefs.mainMod .. " + W", hl.dsp.exec_cmd(prefs.browser .. " --profile " .. prefs.browser_dir1))
hl.bind(prefs.mainMod .. " + SHIFT + W", hl.dsp.exec_cmd(prefs.browser .. " --profile " .. prefs.browser_dir2))
hl.bind(prefs.mainMod .. " + CTRL + W", hl.dsp.exec_cmd(prefs.browser .. " --private-window --profile " .. prefs.browser_dir1))
hl.bind(prefs.mainMod .. " + D", hl.dsp.exec_cmd(prefs.browser .. " --new-tab 'https://open.spotify.com' --profile " .. prefs.browser_dir1))

hl.bind(prefs.mainMod .. " + T", hl.dsp.window.float({ action = "toggle" }))
hl.bind(prefs.mainMod .. " + SHIFT + T", hl.dsp.window.pseudo())
hl.bind(prefs.mainMod .. " + F", hl.dsp.window.fullscreen())
hl.bind(prefs.mainMod .. " + Y", hl.dsp.layout("togglesplit"))    -- dwindle only

hl.bind("ALT + Tab", hl.dsp.window.cycle_next())
hl.bind(prefs.mainMod .. " + Tab",   hl.dsp.exec_cmd(prefs.noctCall .. "window-switcher"))

-- Move focus
hl.bind(prefs.mainMod .. " + H", hl.dsp.focus({ direction = "left" }))
hl.bind(prefs.mainMod .. " + L", hl.dsp.focus({ direction = "right" }))
hl.bind(prefs.mainMod .. " + K", hl.dsp.focus({ direction = "up" }))
hl.bind(prefs.mainMod .. " + J", hl.dsp.focus({ direction = "down" }))

-- Move windows
hl.bind(prefs.mainMod .. " + SHIFT + H", hl.dsp.window.move({ direction = "left" }))
hl.bind(prefs.mainMod .. " + SHIFT + L", hl.dsp.window.move({ direction = "right" }))
hl.bind(prefs.mainMod .. " + SHIFT + K", hl.dsp.window.move({ direction = "up" }))
hl.bind(prefs.mainMod .. " + SHIFT + J", hl.dsp.window.move({ direction = "down" }))

-- Switch workspaces with mainMod + [0-9]
-- Move active window to a workspace with mainMod + SHIFT + [0-9]
for i = 1, 10 do
    local key = i % 10 -- 10 maps to key 0
    hl.bind(prefs.mainMod .. " + " .. key,          hl.dsp.focus({ workspace = i}))
    hl.bind(prefs.mainMod .. " + SHIFT + " .. key,  hl.dsp.window.move({ workspace = i }))
end

-- Special workspace
hl.bind(prefs.mainMod .. " + Z",         hl.dsp.workspace.toggle_special("magic"))
hl.bind(prefs.mainMod .. " + SHIFT + Z", hl.dsp.window.move({ workspace = "special:magic" }))

-- Scroll through existing workspaces
hl.bind(prefs.mainMod .. " + mouse_down",   hl.dsp.focus({ workspace = "e+1" }))
hl.bind(prefs.mainMod .. " + mouse_up", hl.dsp.focus({ workspace = "e-1" }))
hl.bind(prefs.mainMod .. " + period",   hl.dsp.focus({ workspace = "e+1" }))
hl.bind(prefs.mainMod .. " + comma",    hl.dsp.focus({ workspace = "e-1" }))
hl.bind(prefs.mainMod .. " + SHIFT + period",   hl.dsp.window.move({ workspace = "e+1" }))
hl.bind(prefs.mainMod .. " + SHIFT + comma",    hl.dsp.window.move({ workspace = "e-1" }))

-- Move/resize windows with mainMod + LMB/RMB and dragging
hl.bind(prefs.mainMod .. " + mouse:272", hl.dsp.window.drag(),   { mouse = true })
hl.bind(prefs.mainMod .. " + mouse:273", hl.dsp.window.resize(), { mouse = true })

hl.bind(prefs.mainMod .. " + right", hl.dsp.window.resize({x = 20,  y = 0, relative = true}), { repeating = true })
hl.bind(prefs.mainMod .. " + left",  hl.dsp.window.resize({x = -20, y = 0, relative = true}), { repeating = true })
hl.bind(prefs.mainMod .. " + up",    hl.dsp.window.resize({x = 0, y = -20, relative = true}), { repeating = true })
hl.bind(prefs.mainMod .. " + down",  hl.dsp.window.resize({x = 0,  y = 20, relative = true}), { repeating = true })

hl.bind(prefs.mainMod .. " + SHIFT + right", hl.dsp.window.move({x = 20,  y = 0, relative = true}), { repeating = true })
hl.bind(prefs.mainMod .. " + SHIFT + left",  hl.dsp.window.move({x = -20, y = 0, relative = true}), { repeating = true })
hl.bind(prefs.mainMod .. " + SHIFT + up",    hl.dsp.window.move({x = 0, y = -20, relative = true}), { repeating = true })
hl.bind(prefs.mainMod .. " + SHIFT + down",  hl.dsp.window.move({x = 0,  y = 20, relative = true}), { repeating = true })

-- Audio
hl.bind("XF86AudioRaiseVolume", hl.dsp.exec_cmd(prefs.noctCall .. "volume-up"),   { locked = true, repeating = true })
hl.bind("XF86AudioLowerVolume", hl.dsp.exec_cmd(prefs.noctCall .. "volume-down"), { locked = true, repeating = true })
hl.bind("XF86AudioMute",        hl.dsp.exec_cmd(prefs.noctCall .. "volume-mute"), { locked = true })
hl.bind("XF86AudioMicMute",     hl.dsp.exec_cmd(prefs.noctCall .. "mic-mute"),    { locked = true })

-- Media
hl.bind("XF86AudioPlay",  hl.dsp.exec_cmd(prefs.noctCall .. "media toggle"),   { locked = true })
hl.bind("XF86AudioPause", hl.dsp.exec_cmd(prefs.noctCall .. "media toggle"),   { locked = true })
hl.bind("XF86AudioNext",  hl.dsp.exec_cmd(prefs.noctCall .. "media next"),     { locked = true })
hl.bind("XF86AudioPrev",  hl.dsp.exec_cmd(prefs.noctCall .. "media previous"), { locked = true })

hl.bind(prefs.mainMod .. " + CTRL + right", hl.dsp.exec_cmd(prefs.noctCall .. "media next"),        { locked = true })
hl.bind(prefs.mainMod .. " + CTRL + left",  hl.dsp.exec_cmd(prefs.noctCall .. "media previous"),    { locked = true })
hl.bind(prefs.mainMod .. " + CTRL + SPACE", hl.dsp.exec_cmd(prefs.noctCall .. "media toggle"),  { locked = true })
hl.bind(prefs.mainMod .. " + CTRL + up",    hl.dsp.exec_cmd(prefs.noctCall .. "media next-player"),  { locked = true, repeating = true })
hl.bind(prefs.mainMod .. " + CTRL + down",  hl.dsp.exec_cmd(prefs.noctCall .. "media previous-player"), { locked = true, repeating = true })

-- Brightness
hl.bind("XF86MonBrightnessUp",   hl.dsp.exec_cmd(prefs.noctCall .. "brightness-up"),   { locked = true, repeating = true })
hl.bind("XF86MonBrightnessDown", hl.dsp.exec_cmd(prefs.noctCall .. "brightness-down"), { locked = true, repeating = true })

-- Utilities
hl.bind(prefs.mainMod .. " + E", hl.dsp.exec_cmd("snapshot"))
hl.bind(prefs.mainMod .. " + SHIFT + E", hl.dsp.exec_cmd("gimp"))
hl.bind(prefs.mainMod .. " + P",     hl.dsp.exec_cmd("hyprpicker -a -n"))

-- Noctalia Utilities
hl.bind(prefs.mainMod .. " + V", hl.dsp.exec_cmd(prefs.noctCall .. "panel-toggle clipboard"))
hl.bind(prefs.mainMod .. " + B", hl.dsp.exec_cmd(prefs.noctCall .. "panel-toggle wallpaper"))
hl.bind(prefs.mainMod .. " + A", hl.dsp.exec_cmd(prefs.noctCall .. "panel-toggle launcher"))
hl.bind(prefs.mainMod .. " + SHIFT + A", hl.dsp.exec_cmd(prefs.noctCall .. "panel-toggle control-center notifications"))

-- Screen Capture
hl.bind("Print",               hl.dsp.exec_cmd(prefs.noctCall .. "screenshot-region"))
hl.bind(prefs.mainMod .. " + Print", hl.dsp.exec_cmd(prefs.noctCall .. "screenshot-fullscreen"))

-- Toggle Window Swallowing
hl.bind(prefs.mainMod .. " + SHIFT + Y", function ()
    local swallow_enabled = hl.get_config("misc.enable_swallow")

    if swallow_enabled then
        -- If it's on, turn it off
        hl.config({
            misc = { enable_swallow = false }
        })
        hl.exec_cmd("notify-send -t 1500 'Hyprland' 'Window Swallow: Disabled' -a 'hyprctl' -e")
    else
        -- If it's off, turn it back on
        hl.config({
            misc = { enable_swallow = true }
        })
        hl.exec_cmd("notify-send -t 1500 'Hyprland' 'Window Swallow: Enabled' -a 'hyprctl' -e")
    end
end)

