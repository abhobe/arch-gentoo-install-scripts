lsblk
cfdisk
mkfs.fat -F32 /dev/sda1
mkfs.ext4 /dev/sda2
mount /dev/sda2 /mnt/gentoo
cd /mnt/gentoo
wget https://bouncer.gentoo.org/fetch/root/all/releases/amd64/autobuilds/20210103T214503Z/stage3-amd64-20210103T214503Z.tar.xz
mv stage3-amd64-20210103T214503Z.tar.xz  stage3-amd64.tar.xz
mv  /mnt/gentoo/etc/portage/make.conf /mnt/gentoo/etc/portage/make.conf.orig
cp make.conf /mnt/gentoo/etc/portage/make.conf
cp --dereference /etc/resolv.conf /mnt/gentoo/etc/
mount --types proc /proc /mnt/gentoo/proc
mount --rbind /sys /mnt/gentoo/sys
mount --make-rslave /mnt/gentoo/sys
mount --rbind /dev /mnt/gentoo/dev
mount --make-rslave /mnt/gentoo/dev
chroot /mnt/gentoo /bin/bash