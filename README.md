# Arch and Gentoo Install Scripts
Here are my arch and gentoo install scripts. They run one time without any input except partitioning.

## Settings
### General
- `GRUB` as bootloader
- All commands are assuming this is an `efi` system
- `/dev/sda1/` is the boot partition formated in `fat32`
- `/dev/sda2/` is the root partition formated in `ext4`
- Locale is `en_US.UTF-8`
### Gentoo
- Networking interface is `enp0s3` since I am doing this on VirtualBox
- The stage 3 tarball is `current-stage3-amd64`
- `OpenRC` is the init system
- The profile for `emerge` is `default/linux/amd64/17.0/desktop/plasma`
- The script `emerges` the following
  - `sys-kernel/gentoo-sources`
  - `sys-kernel/installkernel-gentoo`
  - `sys-kernel/gentoo-kernel-bin`
  - `sys-kernel/linux-firmware`
  - `net-misc/netifrc`
  - `app-admin/sysklogd`
  - `sys-apps/mlocate`
  - `net-misc/dhcpcd`
  - `sys-boot/grub:2`
  
  Feel free to change any of the scripts to suit your needs
## Install
### Arch
After logging on to the Arch ISO, run the following:
```bash
wget -O live-env.sh https://git.io/JLNRS
sh live-env.sh
wget -O os-env.sh https://git.io/JLNR5
sh os-env.sh
rm os-env.sh
exit
umount -R /mnt
reboot
```
### Gentoo
After logging on to your preferred installation environment, run the following:
```bash
wget -O live-env.sh https://git.io/JLN0I
sh live-env.sh
wget -O os-env.sh https://git.io/JLN4h
sh os-env.sh
rm os-env.sh
exit
umount -l /mnt/gentoo/dev{/shm,/pts,}
umount -R /mnt/gentoo
reboot
```
