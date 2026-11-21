-- ~/.config/hypr/land/prefs.lua

local home = os.getenv("HOME")
-- LOVE IT
local browser = "zen-browser"

local launchPrefix = "uwsm app -- " -- if you are not using UWSM, make this empty (e.g. "")

-- Personal and Work
local b_dir1, b_dir2
if browser == "firefox" then
    b_dir1 = home .. "/.config/mozilla/firefox/xpv5jqwp.default-release"
    b_dir2 = b_dir1
elseif browser == "zen-browser" then
    b_dir1 = home .. "/.config/zen/'938jml0n.Default (release)'"
    b_dir2 = b_dir1
else
    b_dir1 = ""
    b_dir2 = b_dir1
end

-- local scr_dir = home .. ".local/bin"
-- local startup_wallpaper = scr_dir .. "/startup_wallpaper"

return {
    mainMod      = "SUPER",
    noctCall     = "noctalia msg ",
    launchPrefix = launchPrefix,

    terminal     = "kitty",
    ide          = "zeditor",
    ide2         = "code",

    fileManager  = "dolphin",
    fileAnalyzer = "filelight",
    perfAnalyzer = "btop",
    calculator   = "gnome-calculator",

    scripts_dir  = home .. "/.local/bin",

    browser      = browser,
    browser_dir1 = b_dir1,
    browser_dir2 = b_dir2,

    mon1         = "eDP-1",
    mon2         = "DP-2"

}

