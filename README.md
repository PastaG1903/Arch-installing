# Arch-installing

These files are meant to be an alternative to the archinstall command.
I made these after I noticed some inconsistencies during package installation in archinstall.
Feel free to modify them as you want.
Please check out the comments inside the script.

## archinstall_1
This first file is to be executed in the live iso environment.
You may either copy these files into the live iso or mount an external drive with the files.
>[!warning]
>Before mounting the drive with the files, I suggest you create a directory other than /mnt for this purpose.
>I may suggest naming it /mount out of convinience.

Once the files are available, you are to execute the first script.
You will know it has finished running if you are chrooted into /mnt (root partition)

## archinstall_2
This second file is to be ran inside the chrooted directory for the root partition.
Again, you may either mount the drive to access the files from there or copy them into a new directory.
Accessing the script from the mounted drive is encouraged over copying them.
For this script, you do can mount the drive in the /mnt directory inside root.
This script adds the hostname, user, passwords, so it will require manual intervention at some points.

## After running both scripts
When you are done, you are free to keep using pacman to install more packages or anything else.
SDDM will already be installed and enabled, with KDE Plasma as DE. This should let you login upon reboot.
When you are ready, exit the chroot and reboot. You can optionally unmount the partitions before reboot.

## Yay installer
Installation of the AUR helper Yay will require the makepkg command, which is not recommended to be run as root.
Instead, log into your user account, open up a terminal emulator (kitty installed by default) or open a tty (Ctrl+Alt+F3).
Then, execute the yay_installer script. You will be prompted to install go, yay, and yay-debug via pacman.
With this, you will now have access to the AUR.

*Default packages*
- base
- base-devel
- linux
- linux-lts
- linux-firmware
- grub
- efibootmgr
- openssh
- tmux
- fastfetch
- btop
- cups
- git
- yazi
- networkmanager
- iwd
- neovim
- man-pages
- pulseaudio
- blueman
- sudo
- xorg
- sddm
- sddm-kcm
- wayland
- plasma
- kitty
