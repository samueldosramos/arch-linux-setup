# Arch Linux Installation Guide

## Pre-installation

### Set the keyboard layout

```
loadkeys br-abnt2

setfont Lat2-Terminus16
```

### Connect to the internet

- DHCP

Wired network connection and access to a DHCP server (eg: router). This option starts automatically.

```
dhcpcd
```

- Wired

Before starting the configuration it is necessary to deactivate dhcp

```
systemctl stop dhcpcd.service
```

Identify the network interface

```
ip link
```

Enable the network interface, for example, to `eth0`:

```
ip link set eth0 up
```

- WI-FI

```
rfkill unblock wifi
wifi-menu
```

Choose the network and enter your password.

Finally, test the network with:

```
ping -c 3 www.google.com
```

### Partition the disks

```
cfdisk /dev/sda  (ou cfdisk/dev/sda)

```

- Obs: Do the same with cfdisk / dev / sdb according to partitions

Example layouts:

```
sda1 - 512M     - EF00 - /boot
sda2 - 4G	- 8200 - /swap
sda3 - 40G      - 8300 - /root
sda4 - ~G 	- 8300 - /home	(replace ~ to remainder of the device)
```

### Format the partitions

```
mkfs.fat -F32 /dev/sda1

mkfs.ext4 /dev/sda3

mkfs.ext4 /dev/sda4
```

### Mount the file systems

To view the current partitioning layout:

```
lsblk /dev/sda
```

Mount the partitions in this order:

```
mount /dev/sda3 /mnt

mkdir /mnt/boot && mount /dev/sda1 /mnt/boot

mkswap -L swap /dev/sda2 && swapon /dev/sda2

mkdir /mnt/home && mount /dev/sda4 /mnt/home
```

## Installation

### Select the mirrors

```
mv /etc/pacman.d/mirrorlist /etc/pacman.d/mirrorlist.new

vi /etc/pacman.d/mirrorlist.new

:%s/^Server/#Server/g

/\.br
```

Use `x` to uncomment (remove the # before the server where you have Brazil).
Use `n` to jump to another mirror.
To exit `ESC` and type:
`:wq`

Then:

```
mv /etc/pacman.d/mirrorlist.new /etc/pacman.d/mirrorlist
```

### Install the base packages

```
pacstrap /mnt base base-devel
```

---

## Configure the system

### Fstab

```
genfstab -U -p /mnt >> /mnt/etc/fstab
```

### Change root into the new system:

```
arch-chroot /mnt
```

### Terminal font and keyboard

If you changed the keyboard map at the beginning of the installation process, reload that configuration again because your environment has changed:

```
loadkeys br-abnt2

setfont Lat2-Terminus16
```

If you want keyboard and font changes to persist after restarting, edit the `vconsole.conf` file:

```
nano /etc/vconsole.conf
```

Write it:

```
KEYMAP=br-abnt2
FONT=Lat2-Terminus16
FONT_MAP=
```

### Localization

```
rm /etc/localtime
ln -s /usr/share/zoneinfo/America/Bahia /etc/localtime

vi /etc/locale.gen
```

Uncomment the language you are going to use (en_US.UTF-8 UTF-8)

```
/en_US
```

Press `x` to uncomment.
To exit, press `ESC` and type:

```
:wq
```

Then:

```
locale-gen

echo LANG=en_US.UTF-8 > /etc/locale.conf

export LANG=en_US.UTF-8
```

### Initramfs

```
mkinitcpio -p linux
```

### Root password

Set the root password:

```
passwd
```

### Add a regular user

```
useradd -c "MyName" -m -d /home/myname myname
```

- Note: Replace `MyName` with the user name with uppercase and with quotation marks and `myname` by the system user, that is, login.

And now create the user password

```
passwd myname
```

### Boot loader

Install systemd-boot:

```
bootctl install
```

Create a boot entry in `/boot/loader/entries/arch.conf`, replacing `/dev/sda3` with a root partition:

```
nano /boot/loader/entries/arch.conf
```

It should look like this:

```
title          Arch Linux
linux          /vmlinuz-linux
initrd         /intel-ucode.img
initrd         /initramfs-linux.img
options        root=/dev/sda3 rw
```

- Note: If your processor is not Intel, remove the initrd `intel-ucode.img`

Modify `/boot/loader/loader.conf` to select the input default suffix:

```
nano /boot/loader/loader.conf
```

It should look like this:

```
timeout 3
default arch
```

If your processor is Intel, also install the package below that enables you to load the manufacturer's microcode at boot time

```
pacman -S intel-ucode
```

### Install sudo

```

pacman -S sudo

```

Open the sudoers file

```

nano /etc/sudoers

```

And uncomment the option (removing `#`)

```

# %wheel ALL=(ALL) ALL

```

And add, on the bottom line:

```

myname ALL=(ALL) ALL

```

- Note: change `myname` by name

Save and exit the file with `Ctrl + x`.

### Enable multilib

```

nano /etc/pacman.conf

```

Scroll down to where the `multilib` is and remove the `#` from the lines below:

```

#[multilib]
#Include = /etc/pacman.d/mirrorlist

```

Save and exit with `Ctrl + x`.

### Enable AUR packages

Open `pacman.conf`

```

nano /etc/pacman.conf

```

Scroll down to the end of the file and add

```

[archlinuxfr]
SigLevel = Never
Server = http://repo.archlinux.fr/$arch

```

Save and exit with `Ctrl + x`.

### Network configuration

Create the hostname file:

```
echo myhostname > /etc/hostname
```

- Note: change `myhostname` to whatever you want

Add matching entries to hosts:

```
nano /etc/hosts
```

It should look like this:

```
127.0.0.1	localhost
::1		localhost
127.0.1.1	myhostname.localdomain	myhostname
```

- Note: change `myhostname` to whatever you want

Install the necessary packages for the network to work:

```
pacman -Sy wireless_tools wpa_supplicant dialog

pacman -S networkmanager

systemctl enable NetworkManager

systemctl enable NetworkManager.service

systemctl enable wpa_supplicant.service
```

Disable dhcp:

```
systemctl disable dhcpcd.service

systemctl disable dhcpcd@.service
```

### Finishing the system installation

Unmount the partitions and restart with:

```
exit

umount -R /mnt

reboot

```

Remove the installation media.

## Post-installation

### Network conection

```
sudo rfkill unblock wifi

nmtui

ping -c 3 www.google.com
```

### Install Gnome

Install light Gnome:

```
sudo pacman -S gnome-shell gnome-terminal gdm nautilus xdg-user-dirs-gtk
```

Enable and start gdm:

```
sudo systemctl enable gdm
sudo systemctl start gdm

```

### Install Git

```

pacman -Sy git

```

### Finish

Reboot

```
reboot
```
