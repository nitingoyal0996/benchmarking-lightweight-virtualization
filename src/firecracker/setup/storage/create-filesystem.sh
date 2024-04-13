# alpine reference: https://kruzenshtern.org/7-create-a-custom-firecracker-image.html
# ubuntu reference: https://happybear.medium.com/building-ubuntu-20-04-root-filesystem-for-firecracker-e3f4267e58cc

(# Set up a login terminal on the serial console (ttyS0):
ln -s agetty /etc/init.d/agetty.ttyS0
echo ttyS0 > /etc/securetty
rc-update add agetty.ttyS0 default

# # Make sure special file systems are mounted on boot:
rc-update add devfs boot
rc-update add procfs boot
rc-update add sysfs boot

# # Then, copy the newly configured system to the fs image:
for d in bin etc lib root sbin usr; do tar c "/$d" | tar x -C /my-rootfs; done
for dir in dev proc run sys var; do mkdir /my-rootfs/${dir}; done)

# # All done, exit docker shell
exit)