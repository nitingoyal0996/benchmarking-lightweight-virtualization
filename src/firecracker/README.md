# Firecracker #

## 1. Setup ##

Run below -

```bash
chmod +x setup

# install firecracker
bash ~/setup/install.sh
bash ~/setup/prereqs.sh

# setup bridge network on the host
bash ~/setup/network/host/bridge.sh

# run firecracker vm
bash ~/setup/run.sh
```

After the vm has started run the commands given in script `init/setup/network/guest/setup.sh` on the guest vm shell in order to connect the VM with the tap interface we created on the bridge on our host.

## 2. Cleanup ##

We remove the binaries, network configurations installed on the machine.

```bash
chmod +x cleanup

bash ~/cleanup/cleanup.sh
```
