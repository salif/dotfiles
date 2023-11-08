
# Load Colemak keyboard layout
ls /usr/share/kbd/keymaps/**/*colemak*.map.gz | xargs -I {} basename {} .map.gz
loadkeys colemak

test -d /sys/firmware/efi/efivars && echo "EFI" || echo "Not EFI"

ip link

# rfkill list
# If the card is hard-blocked, use the hardware button (switch) to unblock it.
# If the card is not hard-blocked but soft-blocked, use the following command:
# rfkill unblock wifi

iwctl
# device list
# station `device` scan
# station `device` get-networks
# station `device` connect `SSID`

timedatectl set-ntp true
timedatectl status

fdisk -l
cfdisk
# /dev/sd``1  1G EFI System
# /dev/sd``2  8G Linux swap
# /dev/sd``3 64G Linux filesystem
# /dev/sd``4 64G Linux filesystem
lsblk -f

mkfs.fat -F32 -n ABOOT /dev/sd``1
mkswap -L ASWAP /dev/sd``2
mkfs.ext4 -L AROOT -F /dev/sd``3
mkfs.ext4 -L AHOME -F /dev/sd``4
lsblk -f

swapon /dev/sd``2
mount /dev/sd``3 /mnt
mkdir /mnt/efi
mount /dev/sd``1 /mnt/efi
mkdir -p /mnt/mnt/home
mount /dev/sd``4 /mnt/mnt/home
lsblk

pacstrap /mnt base linux linux-firmware base-devel networkmanager micro zsh \
              nano sof-firmware man-db man-pages texinfo

genfstab -U /mnt >> /mnt/etc/fstab
less /mnt/etc/fstab

arch-chroot /mnt
ln -sf /usr/share/zoneinfo/Europe/Sofia /etc/localtime
hwclock --systohc

micro /etc/locale.gen
locale-gen

echo "LANG=en_US.UTF-8
LC_NUMERIC=bg_BG.UTF-8
LC_TIME=bg_BG.UTF-8
LC_MONETARY=bg_BG.UTF-8
LC_PAPER=bg_BG.UTF-8
LC_NAME=bg_BG.UTF-8
LC_ADDRESS=bg_BG.UTF-8
LC_TELEPHONE=bg_BG.UTF-8
LC_MEASUREMENT=bg_BG.UTF-8
LC_IDENTIFICATION=bg_BG.UTF-8" >> /etc/locale.conf
less /etc/locale.conf

echo "arch" > /etc/hostname
less /etc/hostname

echo "
127.0.0.1    localhost
::1    localhost
127.0.1.1    arch.localdomain arch" >> /etc/hosts
less /etc/hosts
getent hosts

passwd

pacman -S grub efibootmgr freetype2 os-prober
grub-install --target=x86_64-efi --efi-directory=/efi --bootloader-id=GRUB
pacman -S intel-ucode
grub-mkconfig -o /boot/grub/grub.cfg

pacman -Ss xf86-video
pacman -S xorg xf86-video-intel xf86-input-libinput mesa intel-media-driver \
          lightdm lightdm-slick-greeter sudo acpid rng-tools --needed

ls -1 /usr/share/xgreeters/
micro /etc/lightdm/lightdm.conf
# greeter-session=lightdm-slick-greeter

EDITOR=micro visudo
# Uncomment %wheel ALL=(ALL) ALL

systemctl enable lightdm
systemctl enable NetworkManager
systemctl enable acpid
systemctl enable rngd

echo "KEYMAP=colemak" >> /etc/vconsole.conf
less /etc/vconsole.conf

echo '
Section "InputClass"
        Identifier "system-keyboard"
        MatchIsKeyboard "on"
        Option "XkbModel" "pc105"
        Option "XkbLayout" "us"
        Option "XkbVariant" "colemak"
        Option "XkbOptions" "numpad:mac,shift:both_shiftlock,terminate:ctrl_alt_bksp,grp:lalt_lshift_toggle"
EndSection' >> /etc/X11/xorg.conf.d/00-keyboard.conf

# cp /etc/pacman.d/mirrorlist /etc/pacman.d/mirrorlist.backup
# reflector --protocol http --latest 70 --sort rate --save /etc/pacman.d/mirrorlist

pacman-key --recv-key 3056513887B78AEB --keyserver keyserver.ubuntu.com
pacman-key --lsign-key 3056513887B78AEB
pacman -U 'https://cdn-mirror.chaotic.cx/chaotic-aur/chaotic-keyring.pkg.tar.zst' \
          'https://cdn-mirror.chaotic.cx/chaotic-aur/chaotic-mirrorlist.pkg.tar.zst'
micro /etc/pacman.conf
pacman -Syyu

pacman -S cinnamon cinnamon-translations yay git gnome-terminal gnome-keyring --needed
pacman -S baobab bash-completion bibata-cursor-theme crda dialect \
          dconf-editor djvulibre ethtool flat-remix flat-remix-gtk galculator \
          gcolor2 gimp gnome-disk-utility gnome-logs gnome-online-accounts \
          gnome-screenshot gnome-system-log gnome-system-monitor gnome-builder \
          gnu-free-fonts gvfs-goa gvfs-google gvfs-gphoto2 gvfs-mtp iso-flag-png \
          keepassxc lightdm-settings nemo-fileroller nemo-seahorse neofetch \
          network-manager-applet noto-fonts-emoji p7zip parcellite pkgfile redshift \
          seahorse tree visual-studio-code-bin vlc xclip xdg-user-dirs-gtk xed xreader --needed

useradd -m -G wheel,adm,storage,power -s /usr/bin/zsh `user` 
passwd `user`
chfn `user`

su -l `user`

systemctl --user enable redshift-gtk
