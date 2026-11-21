# dotfiles

My dotfiles and configs for CachyOS Hyprland. I keep things pretty simple and minimal, nothing fancy. My main priority has been keeping a unified workflow across nvim, tmux and hyprland. As someone who spends a very large amount of time on their laptop for work (local and remote), that's super important to me. Hyprland sometimes gets this rap of being more eye candy. While I admit it's easy to go down that path, I've kept things very functional and oriented to supporting long hours of constant work.

I'm running this on a Framework 13 Pro, and it's been a great experience. Huge respect for these guys. But again, my configs aren't constantly updated or anything, I set it up to support my workflow as a student and that's it. Take a look at my commit logs if you like, there was a spike when I was setting up things, but now it's just the occasional update.

> [!IMPORTANT]
> Just to give an update. I've been on Noctalia Shell for a while. So really all the other stuff like mako and waybar can be ignored. I left it there just for reference.
>
> If you're looking for the essence of my current environment, it's made up of [Hyprland](dot_config/hypr), [Noctalia Shell](dot_config/noctalia), [Nvim](dot_config/nvim), [Bash](dot_bashrc), and [Tmux](dot_tmux.conf). I like my [Claude Settings](dot_claude/settings.json) too :)
> 
> Fun times!

I think I've done a good job at the unified workflow aspect. At least, I've come to the point where it's all in my muscle memory now, and I don't really work with any other setup. When looking at dotfiles online, I noticed many following an all-or-nothing approach to others adopting their files. I don't really like that philosophy, I think it's better to be able to pick and choose what you want to use from different sources. In that spirit, I've kept things in this repo to be _as_ modular as possible. Piece by piece, you can take from here what you like, and that includes my legacy configs. In addition to making this repo easier to maintain for me, I think it also allows you to learn more about building and customizing your own Arch setup.

Putting aside tmux for a second (I only use it for persistent remote sessions), consider the completely unified workflow between nvim and Hyprland. It's all lua, and I've grown to really like the language! Very happy with my terminal environment. I honestly use nvim more than Zed. It's a really nice feeling to have such a nice custom setup.

> [!TIP]
> When creating your own build, it's definitely worth using the help of AI. I'm a basic Gemini user and relied on AI assisted debugging and development a fair amount at the start. Soon enough the vision was in my head and I stopped needing it. AI does help a lot, but more important is reading the tool manuals lol.
> 
> Regardless, I think it's a new tool one can make use of! The Linux community is understandably skeptical, but I think it's great help for personal use. It is my strong opinion that resisting AI now is like resisting the internet in 2000.
> 
> I more recently integrated Copilot and Claude Code into my nvim setup, it's been a game changer for sure.

Building everything like this and setting up distroboxes, ephemeral podmans, and background services did teach me a lot about how my system works. Overcoming challenges like setting up fingerprint auth and a hibernation swapfile were def learning experiences. A couple months in, I was trying to fix a latency issue with writes to disk and ended up breaking my whole system and had to restart lol. That's when the switch to Framework happened.

My biggest challenge was probably putting together an actually stable [yaml file](system/ov10a10.yaml) for my IPU6 camera being used by libcamera. The more I learnt, the more I realised what was possible. Ricing is a fun place to spiral down, I do hope I can give back to the open source community someday.

Hope you like it! Look below for pics of my desktop.

> [!CAUTION]
> I'm on Arch, btw

### Latest

Work in progress.

Surya Turaga
