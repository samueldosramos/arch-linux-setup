# KDE Setup in Arch Linux

This is a simple dotfiles and scripts to install and customizing _Arch Linux_ with _KDE_.

## Features

_Check linked files to more details._

### Installation guide

- [arch-installation-guide](arch-installation-guide.md) - Installation guide including _Arch Linux_ and _KDE_.

### Installation files

- [apps.sh](install/apps.sh) - installs applications.
- [dotfiles.sh](install/dotfiles.sh) - install and configure dotfiles.
- [drivers.sh](install/drivers.sh) - install Linux drivers.
- [npm.sh](install/npm.sh) - install npm packages.
- [setup.sh](install/setup.sh) - main installer.
- [util.sh](install/util.sh) - support functions for other installers.
- [yay.sh](install/yay.sh) - install Yay.

**Note:** _These files will be discarded later._

### Settings Files

- [gitconfig](.gitconfig) - basic git settings.
- [gitignore_global](.gitignore_global) - global gitignore.
- [zshrc](.zshrc) - terminal configs with aliases, paths, plugins and theme.

**Note:** _These files are permanent._

## Installation

First, install _Arch Linux_ and the _KDE_ base. Follow the [Arch Linux Installation Guide](arch-installation-guide.md) to install them.

If you already have _Arch Linux_ and _KDE_ installed, run these commands:

```
git clone https://github.com/samuelramox/arch-linux-setup.git && cd arch-linux-setup

./install/setup.sh
```

### Setup after installation

#### Configure alsa

```bash
alsamixer
```

All channels will be muted by default. Then use the `M` key to change. Then use the arrow keys to increase or decrease the volume. Disable the `Master` and `PCM` channels. Depending on your speaker configuration, if you have a 5.1 system for example, you will want to mute the Front, Surround, etc

```bash
sudo alsactl store
```

#### Enable Yay colors in the terminal

```bash
sudo nano /etc/pacman.conf
```

Uncomment the `Color` flag in the options. An example of how it will look:

```json
#{{{ Misc options
    UseSyslog
    Color
    TotalDownload
    CheckSpace
    VerbosePkgLists
#}}}
```

#### Optimizing KDE performance

##### Disable Kwallet

Install `kwalletmanager` and then perform the steps below:

`System Settings → Account Details → KDE Wallet → Uncheck the Enable KDE wallet subsystem box`

##### Disable Baloo

`System Settings → Workspace → Search → File Search`

#### Terminal - Change font

`Terminal → Preferences → Profiles → Text → Change Font. I use Hack Nerd Font with 13px`

#### Visual Studio Code config

`Code → Preference → Settings (or CTRL + ,) and add or edit the following values:`

```json
"editor.fontFamily": "JetBrains Mono",
"editor.fontLigatures": true,
"editor.fontSize": 13,
"terminal.integrated.fontFamily": "JetBrains Mono",
"terminal.integrated.fontSize": 13,
```

## Resources

- [Arch Linux](https://www.archlinux.org/)
- [KDE Wiki](https://wiki.archlinux.org/index.php/KDE)
- [Oh My Zsh](https://github.com/robbyrussell/oh-my-zsh)
- [Powerlevel10k theme for Zsh](https://github.com/romkatv/powerlevel10k)
- [Nerd Fonts](https://nerdfonts.com/)
