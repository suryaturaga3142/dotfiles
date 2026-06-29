-- ~/.config/hypr/land/prefs.lua

local home = os.getenv("HOME")
local s_browser = "firefox"

-- Personal and Work
local b_dir1, b_dir2
if s_browser == "firefox" then
    b_dir1 = home .. "/.config/mozilla/firefox/pws40znd.default-release"
    b_dir2 = home .. "/.config/mozilla/firefox/'1JbbuVWh.Profile 1'"
elseif s_browser == "google-chrome-stable" then
    b_dir1 = "Default"
    b_dir2 = "'Profile 3'"
else
    b_dir1 = ""
    b_dir2 = ""
end

-- local scr_dir = home .. ".local/bin"
-- local startup_wallpaper = scr_dir .. "/startup_wallpaper"

return {
    mainMod     = "SUPER",
    terminal    = "kitty",
    ide         = "code",
    fileManager = "dolphin",
    menu        = "fuzzel",
    browser     = s_browser,

    scripts_dir = home .. "/.local/bin",

    browser_dir1 = b_dir1,
    browser_dir2 = b_dir2,

    startups    = {
        "hypridle",
        "blueman-applet",
        "waybar",
        "mako",
        "awww-daemon",
        "copyq"
    }
}

