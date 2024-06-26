#!/bin/bash

#Скрипты модулей хранятся в каталоге /usr/lib/dracut/modules.d/. Для того, чтобы добавить свой модуль, создаем там папку с именем 01test:
#Для того, чтобы добавить свой модуль, создаем там папку с именем 01test:

mkdir /usr/lib/dracut/modules.d/01test

#В нее поместим два скрипта:

#1. module-setup.sh - который устанавливает модуль и вызывает скрипт test.sh
#2. test.sh - собственно сам вызываемый скрипт, в нём у нас рисуется пингвинчик
#Сборка

mkinitrd -f -v /boot/initramfs-$(uname -r).img $(uname -r)

#проверить
lsinitrd -m /boot/initramfs-$(uname -r).img | grep test
#test


#После чего можно пойти двумя путями для проверки:
#Перезагрузиться и руками выключить опции rghb и quiet и увидеть вывод
#Либо отредактировать grub.cfg, убрав эти опции
