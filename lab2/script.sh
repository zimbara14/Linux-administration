# 1
fdisk /dev/sda
# n ; p ; 3 ; default ; +300MB ; w

# 2
blkid /dev/sda3 | awk -F '"' '{print $2}' > ~/sda3uuid

# 3 (1)
parted /dev/sda3
# (parted) mklabel ext4 ; mkpart ; primary ; ext4 ; start end
# 3 (2)
mkfs.ext4 /dev/sda3 -b 4096

# 4
dumpe2fs /dev/sda3 -h

# 5
tune2fs /dev/sda3 -c 2 -i 2m

# 6
mkdir /mnt/newdisk
mount -t ext4 /dev/sda3 /mnt/newdisk

# 7
ln -s /mnt/newdisk ~/newdisk_symlink

# 8
mdkir /mnt/newdisk/dir1

# 9
echo -e ‘/dev/sda3 /mnt/newdisk ext4 noexec,noatime 0 0’ > /etc/fstab

# 10
umount /dev/sda3
fdisk /dev/sda
# p ; d ; p ; 3 ; n ; p ; 3 ; enter ; +350MB ; no ; w
reboot
e2fsck /dev/sda3
resize2fs /dev/sda3
mount /dev/sda3

# 11
umount /dev/sda3
e2fsck /dev/sda3 -n
mount /dev/sda3

# 12
fdisk /dev/sda
# n ; p ; enter ; +12MB ; w
mkfs.ext4 /dev/sda4
tune2fs -J location=dev/sda4 /dev/sda3

# 13
fdisk /dev/sdb
# n ; e	; enter ; enter ; enter ; n ; enter ; +100MB ; n; enter ; +100MB ; w

# 14
vgcreate vg /dev/sdb5 /dev/sdb6
lvcreate -l 100%FREE -n lg vg
mkfs.ext4 /dev/vg/lg
mkdir /mnt/supernewdisk
mount /dev/vg/lg /mnt/supernewdisk
