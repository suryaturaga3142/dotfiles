# dotfiles

My dotfiles and configs for CachyOS Hyprland. I keep things pretty simple and minimal, nothing fancy. My main priority has been keeping a unified workflow across nvim, tmux and hyprland. As someone who spends a very large amount of time on their laptop for work (local and remote), that's super important to me. Hyprland sometimes gets this rap of being more eye candy. While I admit it's easy to go down that path, I've kept things very functional and oriented to supporting long hours of constant work.

> [!IMPORTANT]
> Just to give an update. When I said I kept things modular above, I was talking about my previous setup involving waybar, mako, etc. I've since switched to Noctalia Shell, and I'm not going back. So really all the other stuff can be ignored. I left it there just for reference.
>
> If you're looking for the essence of my current environment, it's made up of [Hyprland](dot_config/hypr), [Noctalia Shell](dot_config/noctalia), [Nvim](dot_config/nvim), [Bash](dot_bashrc), and [Tmux](dot_tmux.conf). I like my [Claude Settings](dot_claude/settings.json) too :)
> 
> Fun times!

I think I've done a good job at the unified workflow aspect. At least, I've come to the point where it's all in my muscle memory now, and I don't really work with any other setup. As we all know how ricing goes, though, this is a constantly evolving repo. We'll see what changes come my way, especially since I'm using Hyprland lol. My scripting (and life enjoyment) has gone up significantly since I kicked Windows out of my life. Interesting feeling to be studying comp arch and OS alongside doing all this.

When looking at dotfiles online, I noticed many following an all-or-nothing approach to others adopting their files. I don't really like that philosophy, I think it's better to be able to pick and choose what you want to use from different sources. In that spirit, I've kept things in this repo to be _as_ modular as possible. Piece by piece, you can take from here what you like, and that includes my legacy configs. In addition to making this repo easier to maintain for me, I think it also allows you to learn more about building and customizing your own Arch setup.

Putting aside tmux for a second (I only use it for persistent remote sessions), consider the completely unified workflow between nvim and Hyprland. It's all lua, and I've grown to really like the language! Very happy with my terminal environment. I honestly use nvim more than Zed. It's a really nice feeling to have such a nice custom setup.

The best part about using an Arch-based distro with Hyprland is that you have to build pretty much everything. CachyOS gave me a huge advantage of performance upgrades out of the box. I had to then write configs for key binds, color schemes, notifications, wallpapers, app menu, the status bar, etc. Stuff like opening certain applications needed scripts and desktop files. Everything from screenshots to displaying battery and adjusting volume needed scripts! So it did feel like I was doing a good amount of building. The credit for this is definitely shared by CachyOS and Hyprland. Quickshell is about to join and make a goated trio :)

> [!TIP]
> When creating your own build, it's definitely worth using the help of AI. I'm a basic Gemini user and relied on AI assisted debugging and development a fair amount at the start. Soon enough the vision was in my head and I stopped needing it. AI does help a lot, but more important is reading the tool manuals lol.
> 
> Regardless, I think it's a new tool one can make use of! The Linux community is understandably skeptical, but I think it's great help for personal use. It is my strong opinion that resisting AI now is like resisting Google in 2000.
> 
> I more recently integrated Copilot and Claude Code into my nvim setup, it's been a game changer for sure.

Building everything like this and setting up distroboxes, ephemeral podmans, and background services did teach me a lot about how my system works. Overcoming challenges like setting up fingerprint auth and a hibernation swapfile were def learning experiences. A couple months in, I was trying to fix a latency issue with writes to disk and ended up breaking my whole system and had to restart lol. Coincidentally a few weeks after Noctalia v5 was released so not bad.

My biggest challenge was probably putting together an actually stable [yaml file](system/ov10a10.yaml) for my IPU6 camera being used by libcamera. The more I learnt, the more I realised what was possible. Ricing is a fun place to spiral down, I do hope I can give back to the open source community someday.

Hope you like it! Look below for pics of my desktop.

> [!CAUTION]
> I'm on Arch, btw

### Latest

![Walkthrough](imgs/walkthrough.gif)
<br/>
*Walkthrough of my current setup*

### Legacy

![Lock Screen](imgs/hyprlock.png)
<br/>
*Hyprlock Screen*

![Home Screen](imgs/old_home_screen.png)
<br/>
*Legacy Home Screen*

![Nvim Tree](imgs/nvim_tree.png)
<br/>
*Neovim Tree*

![Nvim Code](imgs/nvim_code.png)
<br/>
*Neovim Home*

![Nvim Telescope](imgs/nvim_telescope.png)
<br/>
*Neovim Telescope*

![Tmux](imgs/tmux.png)
<br/>
*My tmux workspace*

![Fuzzel](imgs/fuzzel_apps.png)
<br/>
*Fuzzel App Menu*

![mpris](imgs/waybar_mpris.png)
<br/>
*Waybar media manager*

![calendar](imgs/waybar_calendar.png)
<br/>
*Waybar calendar popup*

![bluetooth](imgs/waybar_bluetooth.png)
<br/>
*Waybar bluetooth menu*

![wifi](imgs/waybar_wifi.png)
<br/>
*Waybar WiFi menu*

![btop](imgs/btop.png)
</br>
*btop*

Surya Turaga
