 #  _____ _   _ _      
#  |  _  | | (_) |     
#  | | | | |_ _| | ___ 
#  | | | | __| | |/ _ \
#  \ \/' / |_| | |  __/
 #  \_/\_\\__|_|_|\___|
 #  TODO: I think necessary funcs have been setted up already. May
 #  little polish the screen bar and write a readme later.
#   Well, seems that I need to rewrite the colorscheme from scratch.

from libqtile import bar, layout, widget
from libqtile.config import Click, Drag, Group, Key, Match, Screen
import os, re, shutil, socket, subprocess
from libqtile import bar, hook, layout, qtile, widget, extension
from libqtile.lazy import lazy
from typing import List

mod = "mod4" # super key.
myTerm ="alacritty"

# Gruvbox colorscheme.
bg = ["#282828", "#3C3836"] 
fg = ["#EBDBB2", "#fbf1c7"]
grey = ["#A89984", "#928374"]
red = ["#FB4934", "#CC241d"]
green = ["#98971A", "#B8BB26"]
blue = ["#458588", "#83A598"]
purple = ["#B16286", "#D3869B"]
transparency = ["#00000000", "#00000000"]

keys = [
    # Switch between windows
    Key([mod], "h", lazy.layout.left(), desc="Move focus to left"),
    Key([mod], "l", lazy.layout.right(), desc="Move focus to right"),
    Key([mod], "j", lazy.layout.down(), desc="Move focus down"),
    Key([mod], "k", lazy.layout.up(), desc="Move focus up"),
    Key([mod], "e", lazy.layout.next(),
        desc="Move window focus to other window"),

    # Move windows between left/right columns or move up/down in current stack.
    Key([mod, "shift"], "h", lazy.layout.swap_left(),
        desc="Move window to the left"),
    Key([mod, "shift"], "l", lazy.layout.swap_right(),
        desc="Move window to the right"),
    Key([mod, "shift"], "j", lazy.layout.shuffle_down(),
        desc="Move window down"),
    Key([mod, "shift"], "k", lazy.layout.shuffle_up(), desc="Move window up"),
    Key([mod, "shift"], "e", lazy.layout.flip(),
        desc = "Switch which horizontal side the main pane will occupy"),

    # Adjust the size of windows.
    Key([mod], "i", lazy.layout.grow(), desc="Window grows"),
    Key([mod], "m", lazy.layout.shrink(), desc="Window shrinks"),
    Key([mod], "o", lazy.layout.maximize(), 
        desc="Main pane get maximized/minimized"),
    Key([mod], "r", lazy.layout.reset(), 
        desc="Reset all client windows to their default sizes"),

    # Floating window operation
    Key([mod], "c", lazy.window.toggle_floating(),
        desc="Change the focused window to/from floating mode"),
    Key([mod], "w", lazy.window.bring_to_front(),
        desc="Bring underlying window to the top and change it to floating"),
    
    # Switch between groups.
    Key([mod], "period", lazy.screen.next_group(skip_empty=True),
        desc="move to next active group"),
    Key([mod], "comma", lazy.screen.prev_group(skip_empty=True),
        desc="move to previous active group"),

    # Toggle between different layouts as defined below
    Key([mod, "shift"], "Tab", lazy.next_layout(), desc="Toggle between layouts"),

    # kill windows, reload config, shutdown qtile.
    Key([mod], "q", lazy.window.kill(), desc="Kill focused window"),
    Key([mod, "control"], "r", lazy.reload_config(), desc="Reload config"),
    Key([mod, "control"], "q", lazy.shutdown(), desc="Shutdown Qtile"),

    # the built-in application laucher of qtile, seldom use.
    Key([mod, "shift"], "r", lazy.spawncmd(),
        desc="Spawn a command using a prompt widget"),

    # vertical list of all open windows in dmenu. Switch to selected.
    Key([mod], "Tab", lazy.run_extension(extension.WindowList(
        dmenu_prompt = ' ',
        dmenu_command = "dmenu -i -l 5",
    )), desc="list all open windows"),
]

groups = [
    # nerd fonts is needed.
    Group(""),
    Group("", matches = [Match(wm_class = ["Zathura","p3x-onenote"]) ]),
    Group("", matches = [Match(wm_class = ["qutebrowser","firefox"]) ]),
    Group(""),
    Group("", layout = 'max', matches = [Match(wm_class = ["Steam", "Gamehub", "itch"]) ]),
    Group(""),
]

for i in range(1, 7):
    keys.extend([
        # mod + number of group = switch to group
        Key([mod], str(i), 
            lazy.group[groups[i-1].name].toscreen(),
            desc="Switch to group {}".format(groups[i-1].name)),

        # mod + shift + number of group = switch to & move focused window to group
        Key([mod, "shift"], str(i),
            lazy.window.togroup(groups[i-1].name, switch_group=True),
            desc="Switch to & move focused window to group {}".format(groups[i-1].name)),
    ])

layouts = [
    layout.MonadTall(
        margin = 5,
        border_width = 2,
        border_focus = green,
        border_normal = bg,
    ),
    layout.Max(),
]

prompt = "{0}@{1}: ".format(os.environ["USER"], socket.gethostname())

widget_defaults = dict(
    background = bg[1],
    foreground = fg[1],
    font = "sans",
    fontsize = 20,
    padding = 2,
)
extension_defaults = widget_defaults.copy()
textbox_defaults = dict(
    background = transparency,
    foreground = widget_defaults["background"],
    fontsize = widget_defaults["fontsize"] + 5,
    padding = 0,
)

# Welcome to the hell.
screens = [
    Screen(
        top =  
            bar.Bar(
                [
                    widget.TextBox(fmt = "", **textbox_defaults),
                    widget.GroupBox(
                        inactive = grey[0],
                        active = widget_defaults["foreground"],
                        fontsize = 19,
                        font = "NotoSansMono Nerd Font Mono",
                        highlight_method = 'line',
                        highlight_color = widget_defaults["background"],
                        urgent_alert_method = 'line',
                        urgent_border = red[0],
                        this_current_screen_border = green[0],
                        this_screen_border = green[0],
                        borderwidth = 3,
                        disable_drag = False,
                        margin = 1,
                    ),
                    widget.TextBox(fmt = "", ),
                    widget.CurrentLayoutIcon(custom_icon_paths = [os.path.expanduser("~/.config/qtile/icons")], scale = 0.8),
                    widget.Prompt(),
                    widget.TextBox(fmt = "", **textbox_defaults),
                    widget.Spacer(background = transparency),
                    widget.TextBox(fmt = "", **textbox_defaults),
                    widget.TextBox(fmt = "", font = "NotoSansMono Nerd Font Mono"),
                    widget.Clock(font = "Monospace",format = "%a, %b %d - %H:%M",),
                    widget.TextBox(fmt = "", **textbox_defaults),
                    widget.Spacer(background = transparency),
                    widget.TextBox(fmt = "", **textbox_defaults),
                    # python-psutil is needed.
                    widget.TextBox(fmt = "", font = "NotoSansMono Nerd Font Mono"),
                    widget.CPU(
                        format = '{load_percent}%, ',
                        mouse_callbacks = {'Button1': lambda: qtile.cmd_spawn(myTerm + ' -e htop')},
                    ),
                    widget.ThermalSensor(
                        fmt = '{}',
                        foreground = widget_defaults["foreground"],
                        foreground_alert = red,
                        tag_sensor = "Core 0",
                        threshold = 75,
                        mouse_callbacks = {'Button1': lambda: qtile.cmd_spawn(myTerm + ' -e htop')},
                    ),
                    # python-iwlib is needed.
                    widget.TextBox(fmt = "", ),
                    widget.TextBox(fmt = "", font = "NotoSansMono Nerd Font Mono"),
                    widget.Wlan(
                        format = '{percent:2.0%}',
                        disconnected_message = 'None',
                        mouse_callbacks = {'Button1': lambda: qtile.cmd_spawn(myTerm + ' -e iwctl')},
                    ),
                    widget.TextBox(fmt = "", ),
                    widget.TextBox(fmt = "", font = "NotoSansMono Nerd Font Mono"),
                    widget.Backlight(
                        fmt = '{}',
                        change_command = 'light -S {0}',
                        backlight_name = 'intel_backlight',
                        step = 5
                    ),
                    widget.TextBox(fmt = "", ),
                    widget.TextBox(fmt = "", font = "NotoSansMono Nerd Font Mono"),
                    widget.Volume(fmt = '{}',step = 5,),
                    widget.TextBox(fmt = "", ),
                    widget.Battery(
                        charge_char = '',
                        discharge_char = '',
                        empty_char = '',
                        format = '{char} {percent:2.0%}',
                        full_char = '',
                        unknown_char = '',
                        low_percentage = 0.2,
                        notify_below = 20,
                    ),
                    widget.TextBox(fmt = "", ),
                    widget.Systray(),
                    widget.TextBox(fmt = "", **textbox_defaults),
                ],
                27, 
                # get opacity of background and widgets remain visible.
                opacity = 1,
                margin = [10, 5, 10, 5],
                background = transparency,
            ),
        bottom = bar.Gap(10),
        right = bar.Gap(10),
        left = bar.Gap(10),
    ),
]

# Drag floating layouts.
mouse = [
    Drag([mod], "Button1", lazy.window.set_position_floating(),
         start=lazy.window.get_position()),
    Drag([mod], "Button3", lazy.window.set_size_floating(),
         start=lazy.window.get_size()),
    Click([mod], "Button2", lazy.window.bring_to_front())
]

dgroups_key_binder = None
dgroups_app_rules = []  # type: List
follow_mouse_focus = True
bring_front_click = True
cursor_warp = False
floating_layout = layout.Floating(
    border_width = 2,
    fullscreen_border_width = 0,
    border_focus = blue,
    border_normal = grey,
    float_rules=[
    # Run the utility of `xprop` to see the wm class and name of an X client.
    *layout.Floating.default_float_rules,
    Match(wm_class='confirmreset'),  # gitk
    Match(wm_class='makebranch'),  # gitk
    Match(wm_class='maketag'),  # gitk
    Match(wm_class='ssh-askpass'),  # ssh-askpass
    Match(wm_class='icalingua'),
    Match(wm_class='goldendict'),
    Match(title='branchdialog'),  # gitk
    Match(title='pinentry'),  # GPG key password entry
])
auto_fullscreen = True
focus_on_window_activation = "smart"
reconfigure_screens = True

# To prevent mpv from floating, 
# see more in https://github.com/qtile/qtile/issues/2651.
@hook.subscribe.client_new
def disable_floating(window):
    disable_rules = [ Match(wm_class="mpv")]
    if any(window.match(rule) for rule in disable_rules):
        window.togroup(qtile.current_group.name)
        window.cmd_disable_floating()

# When a window is created in a group which isn't current group,
# auto switch to that group.
# see more in https://github.com/qtile/qtile/issues/3325.
@hook.subscribe.client_managed
def auto_switch(window):
    if window.group.name != qtile.current_group.name:
        window.group.cmd_toscreen()

# Run autostart.sh when startup qtile.
@hook.subscribe.startup_once
def autostart():
    subprocess.Popen([os.path.expanduser("~/.config/qtile/autostart.sh")])

# If things like steam games want to auto-minimize themselves when losing
# focus, should we respect this or not?
auto_minimize = False

# We choose LG3D to maximize irony: it is a 3D non-reparenting WM written in
# java that happens to be on java's whitelist.
wmname = "LG3D"
