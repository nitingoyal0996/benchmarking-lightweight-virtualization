# Firecracker #

## 1. Setup ##

Run below -

```bash
chmod +x setup

# install firecracker
bash ~/setup/preinstall.sh
bash ~/setup/install.sh
bash ~/setup/setup.sh
```

### Test Setup ###

```bash
incus --version

# run the first image
```

## 2. Cleanup ##

We remove the package source, installed incus and zfs packages, and cleanup the /var/lib/incus files and setup for incus, installed on the machine.

```bash
chmod +x cleanup

bash ~/cleanup/cleanup.sh
```
