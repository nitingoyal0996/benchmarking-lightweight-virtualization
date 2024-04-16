# alpine reference: https://kruzenshtern.org/7-create-a-custom-firecracker-image.html
# ubuntu reference: https://happybear.medium.com/building-ubuntu-20-04-root-filesystem-for-firecracker-e3f4267e58cc

# install qemu if not already present
apt install qemu-img

# Create the new root filesystem with QEMU tools
qemu-img create -f raw ./rootfs.ext4 250M
# Format
mkfs.ext4 rootfs.ext4
# Mount the file system somewhere so that we could work with it
mount rootfs.ext4 /temp/my-rootfs.ext4

# run docker alpine image
docker run -it --rm -v /tmp/my-rootfs:/my-rootfs alpine

##################################################################### 
# Into the docker shell
##################################################################### 
apk add openrc
apk add util-linux

# Set up a login terminal on the serial console (ttyS0):
(
ln -s agetty /etc/init.d/agetty.ttyS0
echo ttyS0 > /etc/securetty
rc-update add agetty.ttyS0 default

# Make sure special file systems are mounted on boot:
rc-update add devfs boot
rc-update add procfs boot
rc-update add sysfs boot

# Then, copy the newly configured system to the fs image:
for d in bin etc lib root sbin usr; do tar c "/$d" | tar x -C /my-rootfs; done
for dir in dev proc run sys var; do mkdir /my-rootfs/${dir}; done
)

# before exiting setup password for alpine root (you'd need it to access firecracker VM)

# exit
exit


##################################################################### 
# host terminal
##################################################################### 
unmount /tmp/my-rootfs