source /etc/profile
export PS1="(chroot) ${PS1}"
mount /dev/sda1 /boot
emerge-webrsync
eselect profile list
eselect profile set 8
emerge --ask --verbose --update --deep --newuse @world
echo "America/Los_Angeles" > /etc/timezone
emerge --config sys-libs/timezone-data
echo "en_US.UTF-8 UTF-8" > /etc/locale.gen
locale-gen
eselect locale list
eselect locale set 3
env-update && source /etc/profile && export PS1="(chroot) ${PS1}"
emerge --ask sys-kernel/gentoo-sources
emerge --ask sys-kernel/installkernel-gentoo
emerge --ask sys-kernel/gentoo-kernel-bin
emerge --ask sys-kernel/linux-firmware
nano -w /etc/conf.d/hostname
emerge --ask --noreplace net-misc/netifrc
cd /etc/init.d
ln -s net.lo net.eth0
rc-update add net.eth0 default
nano -w /etc/hosts
passwd
emerge --ask app-admin/sysklogd
rc-update add sysklogd default
emerge --ask sys-apps/mlocate
emerge --ask net-misc/dhcpcd
echo 'GRUB_PLATFORMS="efi-64"' >> /etc/portage/make.conf
emerge --ask sys-boot/grub:2
grub-install --target=x86_64-efi --efi-directory=/boot
grub-mkconfig -o /boot/grub/grub.cfg
