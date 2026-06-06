
hl.config({
    input = {
        kb_layout = "us",
        
        follow_mouse = 1,
        sensitivity = 0,

        left_handed = true,
        scroll_method = "on_button_down",
        scroll_button = 274,

        touchpad = {
            natural_scroll = true,
        }
    }
})

hl.gesture({
    workspace_swipe = true,
    fingers = 3,
    direction = "horizontal",
    action = "workspace"
})

