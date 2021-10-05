import subprocess
from typing import List  # noqa: F401
from os import path
from libqtile import bar, layout, widget, hook
from libqtile.config import Click, Drag, Group, Key, Match, Screen
from libqtile.lazy import lazy

mod = "mod4"
terminal = "alacritty"
scripts = {
    "autostart": path.expanduser("~/.config/qtile/scripts/autostart.sh"),
    "lock_screen": path.expanduser("~/.config/qtile/scripts/lock.sh"),
}

keys = [
    # Change screen focus
    Key([mod], "a", lazy.to_screen(0), desc="Focus primary screen"),
    Key([mod], "s", lazy.to_screen(1), desc="Focus secondary screen"),
    # Switch between windows
    Key([mod], "h", lazy.layout.left(), desc="Move focus to left"),
    Key([mod], "l", lazy.layout.right(), desc="Move focus to right"),
    Key([mod], "j", lazy.layout.down(), desc="Move focus down"),
    Key([mod], "k", lazy.layout.up(), desc="Move focus up"),
    Key([mod], "space", lazy.layout.next(),
        desc="Move window focus to other window"),

    # Move windows between left/right columns or move up/down in current stack.
    # Moving out of range in Columns layout will create new column.
    Key([mod, "shift"], "h", lazy.layout.shuffle_left(),
        desc="Move window to the left"),
    Key([mod, "shift"], "l", lazy.layout.shuffle_right(),
        desc="Move window to the right"),
    Key([mod, "shift"], "j", lazy.layout.shuffle_down(),
        desc="Move window down"),
    Key([mod, "shift"], "k", lazy.layout.shuffle_up(), desc="Move window up"),

    # Grow windows. If current window is on the edge of screen and direction
    # will be to screen edge - window would shrink.
    Key([mod, "control"], "h", lazy.layout.grow_left(),
        desc="Grow window to the left"),
    Key([mod, "control"], "l", lazy.layout.grow_right(),
        desc="Grow window to the right"),
    Key([mod, "control"], "j", lazy.layout.grow_down(),
        desc="Grow window down"),
    Key([mod, "control"], "k", lazy.layout.grow_up(), desc="Grow window up"),
    Key([mod], "n", lazy.layout.normalize(), desc="Reset all window sizes"),
    # Change the volume if our keyboard has keys
    Key(
        [], "XF86AudioRaiseVolume",
        lazy.spawn("amixer -c 0 -q set Master 2dB+")
    ),
    Key(
        [], "XF86AudioLowerVolume",
        lazy.spawn("amixer -c 0 -q set Master 2dB-")
    ),
    Key(
        [], "XF86AudioMute",
        lazy.spawn("amixer -D pulse set Master toggle")
    ),
    # Toggle between split and unsplit sides of stack.
    # Split = all windows displayed
    # Unsplit = 1 window displayed, like Max layout, but still with
    # multiple stack panes
    Key([mod, "shift"], "Return", lazy.layout.toggle_split(),
        desc="Toggle between split and unsplit sides of stack"),
    Key([mod, "shift"], "Return", lazy.spawn(
        terminal), desc="Launch terminal"),

    # Toggle between different layouts as defined below
    Key([mod, "shift"], "Tab", lazy.next_layout(),
        desc="Toggle between layouts"),
    Key([mod], "w", lazy.window.kill(), desc="Kill focused window"),

    Key([mod, "control"], "Tab", lazy.window.toggle_floating(),
        desc="Toggle between float / tile mode"),

    Key([mod, "control"], "r", lazy.restart(), desc="Restart Qtile"),
    Key([mod, "control"], "q", lazy.spawn(
        "light-locker-command -l")),

    Key([mod], "Tab", lazy.spawn("rofi -show window"),
        desc="Switch programs from ROFI"),
    Key([mod, "control"], "Escape", lazy.shutdown(), desc="Lock screen"),
    Key([mod], "space", lazy.spawn("rofi -show drun"),
        desc="Run programs from ROFI"),

    Key([mod, "shift"], "f", lazy.window.toggle_fullscreen(),)
]

groups = [Group(i) for i in "1234567890"]

for i in groups:
    keys.extend([
        # mod1 + letter of group = switch to group
        Key([mod], i.name, lazy.group[i.name].toscreen(),
            desc="Switch to group {}".format(i.name)),

        # mod1 + shift + letter of group = switch to & move focused window to group
        Key([mod, "shift"], i.name, lazy.window.togroup(i.name, switch_group=True),
            desc="Switch to & move focused window to group {}".format(i.name)),
        # Or, use below if you prefer not to switch to that group.
        # # mod1 + shift + letter of group = move focused window to group
        # Key([mod, "shift"], i.name, lazy.window.togroup(i.name),
        #     desc="move focused window to group {}".format(i.name)),
    ])

gruvbox_colors = dict(
    bg0='#3c3836',
    bg="#282828",
    fg="#d4be98",
    red="#ea6992",
    green='#a9b665',
    blue='#7daea3',
    yellow='#d8a657',
    orange="#e78a4e",
    aqua='#89b482',
    purple='#d3869b',
    bg_red='#3c1f1e',
    bg_green='#32361a',
    bg_blue='#2e3b3b',
    bg_yellow='#473c29'
)

layouts = [
    layout.Columns(
        margin=5,
        border_focus=gruvbox_colors["red"],
        border_normal=gruvbox_colors["bg0"]),
    layout.TreeTab(
        font='JetBrainsMono Nerd Font Mono',
        active_bg=gruvbox_colors["red"],
        active_fg=gruvbox_colors["bg"],
        urgent_bg=gruvbox_colors["yellow"],
        urgent_fg=gruvbox_colors["bg"],
        inactive_bg=gruvbox_colors["blue"],
        inactive_fg=gruvbox_colors["bg"],
        bg_color=gruvbox_colors["bg0"],
        section_fg=gruvbox_colors["fg"],
        sections=["Tabs"]
    ),
    layout.MonadTall(
        border_focus=gruvbox_colors["red"],
        border_normal=gruvbox_colors["bg0"],
        margin=5),
    layout.Tile(
        margin=5,
        border_focus=gruvbox_colors["red"],
        border_normal=gruvbox_colors["bg0"]),
    # Try more layouts by unleashing below layouts.
    # layout.Bsp(),
    # layout.MonadWide(),
    # layout.RatioTile(),
    # layout.TreeTab(),
    # layout.VerticalTile(),
    # layout.Zoomy(),
]

widget_defaults = dict(
    font='JetBrainsMono Nerd Font Mono',
    fontsize=14,
    padding=3,
)
extension_defaults = widget_defaults.copy()


hidpi_monitor_settngs = dict(
    fontsize=16
)

screens = [
    Screen(
        top=bar.Bar(
            [
                widget.TextBox(
                    "",
                    fontsize=38,
                    foreground=gruvbox_colors["bg"],
                    background=gruvbox_colors["orange"]
                ),
                widget.GroupBox(
                    urgent_border=gruvbox_colors["red"],
                    active=gruvbox_colors["bg_blue"],
                    foreground=gruvbox_colors["bg"],
                    this_current_screen_border=gruvbox_colors["blue"],
                    background=gruvbox_colors["yellow"],
                    other_screen_border=gruvbox_colors["purple"],
                    this_screen_border=gruvbox_colors["purple"],
                    other_current_screen_border=gruvbox_colors["blue"],
                    fontsize=hidpi_monitor_settngs["fontsize"]),
                widget.TextBox(
                    "",
                    fontsize=38,
                    foreground=gruvbox_colors["orange"],
                ),
                widget.WindowName(
                    foreground=gruvbox_colors["fg"],
                    fontsize=hidpi_monitor_settngs["fontsize"]),
                widget.TextBox(
                    "",
                    fontsize=38,
                    foreground=gruvbox_colors["orange"],
                ),
                widget.Chord(
                    chords_colors={
                        'launch': ("#ff0000", "#ffffff"),
                    },
                    name_transform=lambda name: name.upper(),
                    fontsize=hidpi_monitor_settngs["fontsize"]
                ),
                widget.Pomodoro(
                    background=gruvbox_colors["aqua"],
                    color_active=gruvbox_colors["bg"],
                    color_break=gruvbox_colors["bg"],
                    color_inactive=gruvbox_colors["bg0"],
                    foreground=gruvbox_colors["bg"],
                    length_pomodori=25,
                    length_short_break=5,
                    length_long_break=15,
                ),
                widget.TextBox('', fontsize=34,
                               foreground=gruvbox_colors["bg"],
                               background=gruvbox_colors["blue"],
                               ),
                widget.Volume(
                    foreground=gruvbox_colors["bg"],
                    background=gruvbox_colors["blue"],
                    fontsize=hidpi_monitor_settngs["fontsize"]),
                widget.Net(
                    foreground=gruvbox_colors["bg"],
                    background=gruvbox_colors["yellow"],
                    format="{down} ↓↑ {up}",
                    fontsize=hidpi_monitor_settngs["fontsize"],
                ),
                widget.ThermalSensor(
                    fmt=" {}",
                    show_tag=False,
                    foreground=gruvbox_colors["bg"],
                    background=gruvbox_colors["red"],
                    fontsize=hidpi_monitor_settngs["fontsize"],
                ),
                widget.CPUGraph(
                    core="all",
                    samples=100,
                    border_color=gruvbox_colors["bg"],
                    graph_color=gruvbox_colors["bg_blue"],
                    background=gruvbox_colors["orange"],
                    foreground=gruvbox_colors["bg"]
                ),
                widget.MemoryGraph(
                    samples=100,
                    border_color=gruvbox_colors["bg"],
                    graph_color=gruvbox_colors["bg_blue"],
                    background=gruvbox_colors["orange"],
                    foreground=gruvbox_colors["bg"]
                ),
                widget.CurrentLayoutIcon(
                    background=gruvbox_colors["green"],
                    foreground=gruvbox_colors["bg"],
                    scale=0.8),
                widget.CurrentLayout(
                    background=gruvbox_colors["green"],
                    foreground=gruvbox_colors["bg"],
                ),
                widget.Clock(
                    format=' %Y-%m-%d %I:%M %p',
                    background=gruvbox_colors["aqua"],
                    foreground=gruvbox_colors["bg"],
                    fontsize=hidpi_monitor_settngs["fontsize"]),
                widget.Systray(
                    background=gruvbox_colors["yellow"],
                ),
            ],
            35,
            background=gruvbox_colors["bg0"],
            margin=[8, 8, 8, 8]
        ),
    ),
    Screen(
        top=bar.Bar(
            [
                widget.TextBox(
                    "",
                    fontsize=28,
                    foreground=gruvbox_colors["bg"],
                    background=gruvbox_colors["orange"]
                ),
                widget.GroupBox(
                    urgent_border=gruvbox_colors["red"],
                    active=gruvbox_colors["bg_blue"],
                    foreground=gruvbox_colors["bg"],
                    this_current_screen_border=gruvbox_colors["blue"],
                    background=gruvbox_colors["yellow"],
                    other_screen_border=gruvbox_colors["purple"],
                    this_screen_border=gruvbox_colors["purple"],
                    other_current_screen_border=gruvbox_colors["blue"],
                ),
                widget.TextBox(
                    "",
                    fontsize=28,
                    foreground=gruvbox_colors["orange"],
                ),
                widget.WindowName(foreground=gruvbox_colors["fg"]),
                widget.TextBox(
                    "",
                    fontsize=28,
                    foreground=gruvbox_colors["orange"],
                ),
                widget.Chord(
                    chords_colors={
                        'launch': ("#ff0000", "#ffffff"),
                    },
                    name_transform=lambda name: name.upper(),
                ),
                widget.TextBox('', fontsize=28,
                               foreground=gruvbox_colors["bg"],
                               background=gruvbox_colors["blue"],
                               ),
                widget.Volume(
                    foreground=gruvbox_colors["bg"],
                    background=gruvbox_colors["blue"],
                    fontsize=widget_defaults["fontsize"]),
                widget.Net(
                    foreground=gruvbox_colors["bg"],
                    background=gruvbox_colors["yellow"],
                    format="{down} ↓↑ {up}",
                ),
                widget.ThermalSensor(
                    fmt=" {}",
                    show_tag=False,
                    foreground=gruvbox_colors["bg"],
                    background=gruvbox_colors["red"],
                    fontsize=widget_defaults["fontsize"],
                ),
                widget.CPUGraph(
                    core="all",
                    samples=100,
                    border_color=gruvbox_colors["bg"],
                    graph_color=gruvbox_colors["bg_blue"],
                    background=gruvbox_colors["orange"],
                    foreground=gruvbox_colors["bg"]
                ),
                widget.MemoryGraph(
                    samples=100,
                    border_color=gruvbox_colors["bg"],
                    graph_color=gruvbox_colors["bg_blue"],
                    background=gruvbox_colors["orange"],
                    foreground=gruvbox_colors["bg"]
                ),
                widget.CurrentLayoutIcon(
                    background=gruvbox_colors["green"],
                    foreground=gruvbox_colors["bg"],
                    scale=0.8),
                widget.CurrentLayout(
                    background=gruvbox_colors["green"],
                    foreground=gruvbox_colors["bg"],
                ),
                widget.Clock(
                    format=' %Y-%m-%d %I:%M %p',
                    background=gruvbox_colors["aqua"],
                    foreground=gruvbox_colors["bg"],
                    fontsize=widget_defaults["fontsize"]),
            ],
            30,
            background=gruvbox_colors["bg0"],
            margin=[4, 4, 4, 4]
        ),
    )
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
main = None  # WARNING: this is deprecated and will be removed soon
follow_mouse_focus = True
bring_front_click = False
cursor_warp = False
floating_layout = layout.Floating(float_rules=[
    # Run the utility of `xprop` to see the wm class and name of an X client.
    *layout.Floating.default_float_rules,
    Match(wm_class='confirmreset'),  # gitk
    Match(wm_class='makebranch'),  # gitk
    Match(wm_class='maketag'),  # gitk
    Match(wm_class='ssh-askpass'),  # ssh-askpass
    #Match(wm_class="steam_app_*"),
    Match(title='branchdialog'),  # gitk
    Match(title='pinentry'),  # GPG key password entry
    Match(title="Game"),
], border_focus=gruvbox_colors["blue"])
auto_fullscreen = True
auto_minimize = False
focus_on_window_activation = "smart"

# XXX: Gasp! We're lying here. In fact, nobody really uses or cares about this
# string besides java UI toolkits; you can see several discussions on the
# mailing lists, GitHub issues, and other WM documentation that suggest setting
# this string if your java app doesn't work correctly. We may as well just lie
# and say that we're a working one by default.
#
# We choose LG3D to maximize irony: it is a 3D non-reparenting WM written in
# java that happens to be on java's whitelist.
wmname = "LG3D"


@ hook.subscribe.startup_once
def autostart():
    subprocess.call([scripts["autostart"]])
    subprocess.Popen("redshift")
    subprocess.Popen("light-locker")
