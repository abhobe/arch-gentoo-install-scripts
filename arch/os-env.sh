pacman -S vim
ln -sf /usr/share/zoneinfo/America/Los_Angeles /etc/localtime
hwclock --systohc
vim /etc/locale.gen
locale-gen
echo "LANG=en_US.UTF-8" > /etc/locale.conf
vim /etc/hostname
vim /etc/hosts
pacman -S networkmanager
systemctl enable NetworkManager
pacman -S grub efibootmgr
mkdir /boot/efi
mount /dev/sda1 /boot/efi
grub-install --target=x86_64-efi --efi-directory=/boot/efi  --bootloader-id=GRUB
grub-mkconfig -o /boot/grub/grub.cfg
