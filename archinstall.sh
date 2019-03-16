#!/bin/bash

#Update the system clock
timedatectl set-ntp true

#Create a linux partition that covers the whole disk
echo 'type=83' | sfdisk /dev/sda

#Format the created partition
mkfs.ext4 /dev/sda1

mount /devsda1 /mnt

#Create a mirrorlist
curl -s "https://www.archlinux.org/mirrorlist/?country=NL&protocol=https&use_mirror_status=on" | sed -e 's/^#Server/Server/' > /etc/pacman.d/mirrorlist

#Install base packages
pacstrap /mnt base

#Generate fstab with UUID labels
genfstab -U /mnt >> /mnt/etc/fstab

#Change root into new system
arch-chroot /mnt

#Set the timezone 
ln -sf /usr/share/zoneinfo/Europe/Amsterdam /etc/localtime

#Generate /etc/adjtime
hwclock --systohc

sed -i '/en_US.UTF/s/^#//g' /etc/locale.gen
