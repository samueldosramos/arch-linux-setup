# Gnome Setup in Arch Linux

This is a simple dotfiles and scripts to install and customizing Arch Linux with Gnome.

## Features

_Check linked files to more details._

### Settings Files:

- [bash_profile](.bash_profile) - some fallback configs to Terminal.app.
- [gitconfig](.gitconfig) - basic git settings.
- [gitignore_global](.gitignore_global) - global gitignore.
- [zshrc](.zshrc) - terminal configs with aliases, paths, plugins and theme.

### Installation files:

- [apps.sh](install/apps.sh) - installs applications.
- [drivers.sh](install/drivers.sh) - install linux drivers.
- [npm.sh](install/npm.sh) - install npm packages.
- [setup.sh](install/setup.sh) - main installer.
- [util.sh](install/util.sh) - support functions for other installers.
- [vscode.sh](install/vscode.sh) - VSCode plugins installer.
- [yay.sh](install/yay.sh) - install Yay.
- [zsh.sh](install/zsh.sh) - Zsh installer.

### Others files:

- [settings.json](vscode/settings.json) - VSCode customization.

---

## Installation:

### Setup before installation

#### Arch Linux

Install Arch Linux using this guide:

[Arch Linux Installation Guide](https://gist.github.com/samuelramox/f1d397089a2ad4b1dbce8bab22dbc8da)

#### Gnome Shell

After install Arch Linux, install basic Gnome:

```
sudo pacman -S gnome-shell gnome-terminal gdm nautilus xdg-user-dirs-gtk
```

Enable and start gdm

```
systemctl enable gdm

sudo systemctl start gdm
```

#### This scripts

Download and install this script:

```
git clone https://github.com/samuelramox/gnome-setup.git && cd gnome-setup

./install/setup.sh
```

### Setup after installation

#### Configure alsa:

```
alsamixer
```

All channels will be muted by default. Then use the `M` key to change. Then use the arrow keys to increase or decrease the volume. Disable the `Master` and `PCM` channels. Depending on your speaker configuration, if you have a 5.1 system for example, you will want to mute the Front, Surround, etc

```
sudo alsactl store
```

#### Enable Yay colors in the terminal

```

sudo nano /etc/pacman.conf

```

Uncomment the `Color` flag in the options. An example of how it will look:

```

#{{{ Misc options
    UseSyslog
    Color
    TotalDownload
    CheckSpace
    VerbosePkgLists
#}}}

```

#### Terminal - Shortcut:

Settings → Keyboard → Custom shortcuts → Add:

```
Name: gnome-terminal
Command: gnome-terminal
Shortcut: Ctrl + alt + t
```

#### Terminal - Change font:

Terminal → Preferences → Profiles → Text → Change Font. I use Hack Nerd Font with 13px.

#### Visual Studio Code config:

**Note:** _Step needed only if you have skipped the VSCode configuration script_
Code → Preference → Settings (or CTRL + ,) and add or edit the following values:
`"terminal.integrated.fontFamily": "Hack Nerd Font"`
`"terminal.integrated.fontSize": 14`

---

## Resources:

- [Arch Linux](https://www.archlinux.org/)
- [Gnome Wiki](https://wiki.archlinux.org/index.php/GNOME)
- [Adapta GTK Theme](https://github.com/adapta-project/adapta-gtk-theme)
- [Materia Theme](https://github.com/nana-4/materia-theme)
- [Paper Icons](https://snwh.org/paper)
- [Suru Icons](https://snwh.org/suru)
- [Suru Plus Icons](https://github.com/gusbemacbe/suru-plus)
- [Oh My Zsh](https://github.com/robbyrussell/oh-my-zsh)
- [Powerlevel9k theme for Zsh](https://github.com/bhilburn/powerlevel9k)
- [Nerd Fonts](https://nerdfonts.com/)
