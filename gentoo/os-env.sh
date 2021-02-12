source /etc/profile
export PS1="(chroot) ${PS1}"
mount /dev/sda1 /boot
emerge-webrsync
eselect profile list
eselect profile set 1
emerge --verbose --update --deep --newuse @world
echo "America/Los_Angeles" > /etc/timezone
emerge --config sys-libs/timezone-data
echo "en_US.UTF-8 UTF-8" > /etc/locale.gen
locale-gen
eselect locale list
eselect locale set 4
env-update && source /etc/profile && export PS1="(chroot) ${PS1}"
emerge sys-kernel/gentoo-sources
emerge sys-kernel/installkernel-gentoo
emerge sys-kernel/gentoo-kernel-bin
emerge sys-kernel/linux-firmware
nano -w /etc/conf.d/hostname
emerge --noreplace net-misc/netifrc
echo 'config_enp0s3="dhcp"' >> /etc/conf.d/net
cd /etc/init.d
ln -s net.lo net.enp0s3
rc-update add net.enp0s3 default
nano -w /etc/hosts
passwd
emerge app-admin/sysklogd
rc-update add sysklogd default
emerge sys-apps/mlocate
emerge net-misc/dhcpcd
echo 'GRUB_PLATFORMS="efi-64"' >> /etc/portage/make.conf
emerge sys-boot/grub:2
grub-install --target=x86_64-efi --efi-directory=/boot
grub-mkconfig -o /boot/grub/grub.cfg
