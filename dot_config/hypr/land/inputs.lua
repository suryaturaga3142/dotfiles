-- ~/.config/hypr/land/inputs.lua

hl.config({
    input = {
        sensitivity = 0,
        accel_profile = "flat",
        
        left_handed = true,
        --scroll_method = "on_button_down",
        --scroll_button = 274,

        touchpad = {
            natural_scroll = true,
            scroll_factor = 0.7,
            disable_while_typing = true,
        }
    },
    -- Uncomment the section below to enable software cursors; this can help with cursor display or behavior issues
    --cursor = {
        --no_hardware_cursors = 1,
    --},
})

hl.gesture({
    workspace_swipe = true,
    fingers = 3,
    direction = "horizontal",
    action = "workspace"
})

hl.gesture({
    fingers = 3,
    direction = "up",
    action = "fullscreen"
})

hl.gesture({
    fingers = 3,
    direction = "down",
    action = "float"
})

hl.gesture({
    workspace_swipe = true,
    fingers = 4,
    direction = "horizontal",
    action = "workspace"
})

hl.gesture({ 
    fingers = 4, 
    direction = "up", 
    action = function() 
        hl.exec_cmd("kitty") 
    end 
})

hl.gesture({ 
    fingers = 4, 
    direction = "down", 
    action = "close"
})

