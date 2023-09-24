The repo contains my daily configuration of X11 window manager, shell and other
not-so-vital stuff. The distro I use is Arch Linux, however, scripts and config
here may be helpful for other distributions.

All dotfiles are managed by GNU stow, and are separated according to categories
roughly. Note that since version 2.30, `stow(1)` added new options `--dotfiles`,
which enables special handling for "dotfiles", and a file and dir in this
repo whose name begins with "dot-" actually correspond to a real hidden
file/dir in home dir.

# Overview

This repo doesn't aim to provide anyone a work-out-of-box desktop environment.
Instead, it shows a policy of how I organize my desktop services. Certainly,
this policy isn't for everyone. You'd better just use it as a reference.

There are 2 principles when it comes to organize my dotfiles:

1. The fewer hidden files and dirs in my home dir, the better.

2. The more programs are under supervision and control, the better.

Hence, my instructions should be useful for control freaks and psychopaths.

# Shell

/bin/sh is a symlink to `dash(1)` (for scripting); `zsh(1)` is my login shell as
well as interactive shell.

## Environment Variables

There are too many ways to set envars: pam\_env, shell profiles
(/etc/profile.d/, .profile, ...), etc. Considering principle 1, I set envars in
various files and some of them are not even showed in this repo, so further
explanation is needed.

Most envars are set in [.config/shell/profile](./shell/dot-config/shell/profile),
which is sourced when login, as
[.config/zsh/.zprofile](./shell/dot-config/zsh/.zprofile) is symlinked to it.
Note that the symlink [.zprofile](./shell/dot-zprofile) exists only for
compatibility and historical reason. I set the envar `ZDOTDIR` to
`~/.config/zsh` in `/etc/security/pam_env.conf` (latter file is not included in
this repo).

Some GUI-related envars are set in [xprofile](./X11/dot-config/X11/xprofile)
(such as envars used by input method). And fzf-related envars are set in
[.config/zsh/.zshrc](./shell/dot-config/zsh/.zshrc).

envars set in [.config/shell/profile](./shell/dot-config/shell/profile) can be
divided into 3 types:

1. User-specific stuff, from default `EDITOR` to `PATH`, and etc.

2. [XDG base directory](https://specifications.freedesktop.org/basedir-spec/basedir-spec-latest.html)

3. envars for XDG base dir support, as not every applications and utilities
   support that standard by default. For example (though codes below aren't
   actually in the profile file):
   ```
   export GNUPGHOME="${XDG_DATA_HOME:-$HOME/.local/share}/gnupg"
   export PASSWORD_STORE_DIR="${XDG_DATA_HOME:-$HOME/.local/share}/password-store"
   export WGETRC="${XDG_CONFIG_HOME:-$HOME/.config}/wgetrc"
   ```
   In this way we reach principle 1: fewer files/dirs in home dir. Of course,
   there are applications that just don't follow the standard and we can do
   nothing about it (`.mozilla` ...). Additionally, for XDG user dirs check out
   "Misc" section.

The second and third kinds of envars can be set in `/etc/profile.d/` or
pam\_env. And I do recommend you to carefully set those vars in these two ways
to reach principle 1. Though it doesn't show in this repo, I actually set XDG
base directory using pam\_env. And there is
[example](https://github.com/Conaclos/profile.d) for how to set envvars in
`/etc/profile.d/`.

# X11 and related programs

The window manager I use is
[dwm-flexipatch](https://github.com/bakkeby/dwm-flexipatch), polished by
[flexipatch-finalizer](https://github.com/bakkeby/flexipatch-finalizer). Same
goes my terminal, [st-flexipatch](https://github.com/bakkeby/st-flexipatch).
Also [dwmblocks-async](https://github.com/UtkarshVerma/dwmblocks-async) is used
as a statusbar. You can check my config and patches list in
[suckless](./suckless) dir.

WM-related keybindings are handled by `dwm(1)` itself, while `sxhkd(1)` deals
with other keybindings.

## How does X session start

When user login tty1 and source [profile file](./shell/dot-config/shell/profile),
X user session is automatically launched by `startx(1)`. `startx(1)` will source
scripts (that matter) below:

1. [xinitrc](./X11/dot-config/X11/xinitrc): It will source xresources and
   xprofile, then exec into xexec.

2. [xresources](./X11/dot-config/X11/xresources): Basically .Xresources. DPI and
   X-colorscheme is set here.

3. [xprofile](./X11/dot-config/X11/xprofile): Maybe the most important part. It
   set GUI-related envvars, then runs oneshot commands to setup desktop, for
   instance, `xwallpaper(1)` and `fcitx5-remote(1)`. Next, it creates a tmp
   scandir in `XDG_RUNTIME_DIR`, recursively copy all the files and subdirs in
   [service dir](./X11/dot-local/share/X11/sv) into scandir. Finally, a
   `s6-svscan(1)` is started in background, scanning the scandir, start
   services/daemons needed by desktop, and then supervising them. We will talk
   about those services later.

4. [xexec](./X11/dot-config/X11/xexec): Last step. It is a dead simple execline
   script in which `dwm(1)` is firstly launched, and when `dwm(1)` process is
   over, it will terminate `s6-svscan(1)` process started in xprofile, then
   removed the tmp scandir.

The reason why xexec exists is that `startx` doesn't offer any mechanics to run
certain commands when a X user session is closed. I know I can remove `exec`
before `dwm`, add a few lines at the end of xinitrc. But the result of this idea
------ a useless `bin/sh` hanging as parent of dwm when I using desktop, it just
makes me sick.

### Optional: logging your desktop daemons

S6 supervision suite has built-in logging function and we can take full use of
it. It will be helpful when debugging (i.e. useless in most instances). Let's
take our X hotkey daemon `sxhkd(1)` for example.

First Let's create a sub service dir `log` in [sxhkd service
dir](./X11/dot-local/share/X11/sv/sxhkd), `s6-svscan(1)` would treat `sxhkd/log`
dir as a service dir, and open then maintain a pipeline between sxhkd service
and the log service. Everything that `sxhkd/run` writes to its stdout will
appear on `sxhkd/log/run`'s stdin. And a simple example for `log/run` is below:

```
#!/bin/sh

LOGDIR="${HOME}/.local/share/X11/log/sxhkd"
mkdir -p "${LOGDIR}"
s6-log -b n20 s1000000 T "${LOGDIR}"
```

The `sxhkd(1)` daemon would be correctly logged the next time you start X
session. Or if you want it to get logged now, you can create these logdir and
run script in `$X11_SV_DIR`, then restart the service using `s6-svc -r`. Happy
logging, you freak!

## User service/daemon

Here service and daemon share the same meaning: a long-lived process. And a user
service/daemon is just a long-lived process run by user. Most of the time user
expects those daemons running silently in background and get correctly
supervision.

You may wonder: why am I using `s6-svscan(1)` just for launching things like
`sxhkd(1)`? Why not just `sxhkd &` in xinitrc? Well, always remember principle
2, we want every longrun process are controlled and supervised, if it's
possible. A supervision suite can automatically (re)start those daemons, and
endows users with a decent way to control and log them.

You may then ask: why not systemd user unit? Because systemd user instance
doesn't fir my need. For we desktop Linux user, user services/daemons can be
divided into 3 types (again):

1. Services that has nothing to do with your graphical session, such as
   `mpd(1)`, `syncthing(1)` and so on.

2. Daemons that should start with graphical session, and one daemon corresponds
   to one graphical session. When another graphical session is launched in other
   tty/seat, another corresponding daemons should starts with it. For example,
   your graphical panel. It should start when you launch your WM, and when you
   launch another WM in another tty (don't ask why, it just could happen), you
   cannot expect the previous panel process to work in your new X session. Get
   it?

3. Daemons that are related to graphical session, but no need to start a new one
   for a new graphical session as the old daemon still works with the new
   session. Those kinds of daemons are rare, but they exist, such as
   [darkman service](https://gitlab.com/WhyNotHugo/darkman).

The first type of services should handled by your system-wide user services
manager. For systemd guys, here is systemd user instance. For systemd-haters,
here is chimera linux's
[turnstile project](https://github.com/chimera-linux/turnstile), as well as
[instructions on gentoo wiki](https://wiki.gentoo.org/wiki/OpenRC/User_services).

The second type of services are launched and supervised by `s6-svscan(1)` here.
Systemd user instance cannot deal with those services as there can be only one
systemd user instance for one user. A daemontools-inspired supervision tool (such
as runit and s6), on the opposite, doesn't care who launch it and how many s6
processes are running.

S6 suite is chosen here since it is simple, robust, grokkable, well documented
and actively maintained. Moreover, Another benefit to use a process supervision
is that we no longer have to concern the timing of starting services, as s6
would automatically restart failed daemons.

The third type of services are a bit tricky to handle. I personally choose to
organize them using systemd user instance. Because 99% of the time I work on my
PC with a desktop launched, and the daemons wouldn't cause any trouble even if
no graphical session exists. You can check out that service file,
[sb-sv.service](./X11/dot-config/systemd/user/sb-sv.service), a simple
`s6-svscan(1)` process to automatically refresh my dwmblocks.

### Bonus: Window manager as user desktop service

Since window manager is a long-lived process, why not try to supervise it using
s6 suite? I've tried `dwm(1)` and `openbox(1)` and both of them works well. I
just create a new service dir called wm in
[desktop services scandir](./X11/dot-local/share/X11/sv), and that service run
script is quite simple:

```
#!/bin/execlineb -P
fdmove -c 2 1
importas HOME HOME
cd "${HOME}" dwm
```

And final section in xinitrc should be something like `exec s6-svscan
$X11_SV_DIR` as window manager is now part of s6 services. That is it. The
advantages we get by doing so are:

1. Things get simpler and more unified. Now we can quit X user session by
   running `s6-svscanctl -t`. And we can control window manager like other
   desktop daemons using `s6-svc`.

2. It satisfies my obsessive-compulsive disorder.

However there is also a con. I haven't test it seriously, but it feels like the
window manager will start a little slower when running it as a s6 service. I
guess that's because window manager doesn't enjoy any special treatment in this
way, and is started with other desktop services in parallel by `s6-svscan(1)`.
Hence in this repo we don't use this method to start wm. Anyway, you can give
it a try.

# Misc

In [that dir](./misc) there are:

1. A few interesting scripts. They are:
   * `newf`, a simple shell script to create new files, for further info, run
     `newf -h`.
   *  `xsetwp`, a little wrapper for `xwallpaper(1)`.

2. My font config.

3. My XDG user dirs setup.

4. A few desktop entry.

# Other tips

In this repo there is a setup script to install my dotfiles. **DO NOT USE IT**
unless you use a [patched version of GNU stow](https://github.com/aspiers/stow/pull/70).
The implementation of `stow --dotfiles` is quite buggy now and cannot handle
dot-directory properly.
