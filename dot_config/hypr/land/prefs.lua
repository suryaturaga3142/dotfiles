-- ~/.config/hypr/land/prefs.lua

return {
    mainMod     = "SUPER",
    terminal    = "kitty",
    ide         = "code",
    fileManager = "dolphin",
    menu        = "fuzzel",
    browser     = "google-chrome-stable",

    scripts_dir = os.getenv("HOME") .. "/.local/bin",

    startups    = {
        "hypridle",
        "blueman-applet",
        "waybar",
        "mako",
        "awww-daemon",
        "copyq"
    }
}

