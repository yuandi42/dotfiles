# dotfiles

Personal configuration for my Arch linux.

## Screenshot

![Screenshot](unixporn.png 'WIP though')

## Programs for my daily use.  

### Basic 

Display sever: X-org. Is there really another decent choice?

Compositor: picom. It works pretty well without heavily config.

Window Manager: My bloated build of dwm 6.3.

Display manager: None, just `startx` is the best since I don't need to take
care of two profiles in this way.

Notification server: dunst.

Clipboard manager: xclip.

Hotkey daemon: sxhkd. It takes over most my hotkeys of scripts and other
non-WM-related keybindings. May help a lot if one day I decide to do a WM
hopping.

Terminal: alacritty. An easily customizable terminal.

Shell: bash which every noobs use, with starship prompt as my shell prompt.
Well, I plan to switch from starship to a normal PS1, use dash as my login
shell and zsh as my interact shell.

Web browser: Firefox for my daily use, with modified `user.js`,
`userChrome.css`, and `vimFx`. Yeah, you can use this classic addon with a bit
of hacking. And I also use Luakit from some simple tasks such as html preview.

Text editing: vim for certain. It's so powerful and extensible that other
editors look just like toys compared to our mighty beast. 

### Utilities 

File manager: vifm for terminal, pcmanfm for GUI.

Music/audio player: mpd with ncmpcpp.

Video player: mpv. Every cool guys already use it.

Torrent client: Transmission-cli.

Git client: lazygit

Screenshot utility: maim.

Project V client: v2raya.

PDF viewer: zathura.

Image viewer: sxiv.

Application laucher: my own build of `dmenu_run` with ability to store history
and run command in terminal.
