#!/bin/sh

iwctl
echo ""

lsblk
echo""

read -p "Using lsblk command, what is the name of the device? " target

timedatectl set-timezone America/Monterrey

echo -e "g\nn\n\n\n+1G\nn\n\n\n+8G\nn\n\n\n\nt\n1\n1\nt\n2\nswap\nt\n3\n23\nw\n" | fdisk /dev/$target

if [ "$target" = "nvme0n1" ]; then
	rootp=$target"p3"
	suap=$target"p2"
	efip=$target"p1"
else
	rootp=$target"3"
	suap=$target"2"
	efip=$target"1"
fi

mkfs.ext4 /dev/$rootp
mkswap /dev/$suap
mkfs.fat -F 32 /dev/$efip

mount /dev/$rootp /mnt
mkdir /mnt/boot
mount /dev/$efip /mnt/boot
swapon /dev/$suap

pacstrap -K /mnt base linux linux-lts linux-firmware grub openssh tmux fastfetch btop cups git base-devel yazi networkmanager iwd dhcpcd neovim man-pages pulseaudio blueman sudo xorg

pacstrap -K /mnt intel-ucode # replace with amd-ucode if needed

genfstab -U /mnt >> /mnt/etc/fstab

arch-chroot /mnt
