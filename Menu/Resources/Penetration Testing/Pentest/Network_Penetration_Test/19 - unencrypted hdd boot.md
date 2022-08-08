<pre>
- Boot the machine with Kali
- fdisk -l
- look for (HPFS/NTFS/exFat) in the Type column of the about command
- mkdir /mnt/nts
- mount -t -ntfs-3g /dev/sda1 /mnt/nts
- cd /mnt/nts/Windows/System32/config/
- chntpw -h
- chntpw -l sam
- chntpw -i sam
- umount /mnt/nts
- reboot
</pre>
