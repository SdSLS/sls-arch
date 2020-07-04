echo "CLI NO CUCK"
echo "teni q tener  una conexion no cuck establecida" ; wifi-menu && lsblk
echo "particionado automatico"
mkfs.fat -F32 /dev/sda1
mkfs.ext4 /dev/sda2
mount /dev/sda2 /mnt
mkdir /mnt/efi
mount /dev/sda1 /mnt/efi
pacstrap /mnt base linux linux-firmware
echo "ADVERTENCIA: ESTO PUEDE PRODUCIR CALAMBRE DE PIJA" && 
	genfstab -U /mnt >> /mnt/etc/fstab && 
	arch-chroot /mnt && ln -sf /usr/share/zoneinfo/America/Argentina/Buenos_Aires /etc/localtime
hwclock --systohce
echo "es_AR-UTF" > /etc/locale.gen
cat /etc/locale.gen
locale-gen
echo "LANG=en_US.UTF-8" > /etc/locale.conf
echo "copu-cuk" > /etc/hostname
echo "127.0.0.1	localhost ::1	localhost	127.0.1.1	arch.localdomain	coopu-cuk" > /etc/hosts
fallocate -l 4GB /swapfile
chmod 600 /swapfile
mkswap /swapfile
swapon /swapfile

passwd
pacman -S grub efibootmg networkmanager network-manager-applet wireless_tools wpa_supplicant dialog os-prober mtools dosfstools base-devel linux-headers && 
	grub-install --target=x86_64-efi --efi-directory=/efi --bootloader-id=GRUB &&
	grub-mkconfig -o /boot/grub/grub.cfg
exit
umount -a
echo "espero q te laves la pija"
reboot






























































