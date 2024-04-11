#!/bin/bash

#текущее состояние системы
#sudo -i
vgs


#VolGroup00

vgrename VolGroup00 vg_otus
# Volume group "VolGroup00" successfully renamed to "vg_otus"
#Далее правим /etc/fstab, /etc/default/grub, /boot/grub2/grub.cfg. Меняем VolGroup00 на vg_otus

sed -i 's/VolGroup00/vg_otus/g' /etc/fstab

sed -i 's/VolGroup00/vg_otus/g' /etc/default/grub

sed -i 's/VolGroup00/vg_otus/g' /boot/grub2/grub.cfg

#Пересоздаем initrd image, чтобы он знал новое название Volume Group

mkinitrd -f -v /boot/initramfs-$(uname -r).img $(uname -r)

#*** Creating image file ***
#*** Creating image file done ***
#*** Creating initramfs image file '/boot/initramfs-3.10.0-862.2.3.el7.x86_64.img' done ***

vgs

#vg_otus

#reboot