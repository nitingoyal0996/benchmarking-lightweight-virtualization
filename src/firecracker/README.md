# Setup Firecracker #

[/firecracker-microvm/firecracker/docs](https://github.com/firecracker-microvm/firecracker/tree/main/docs)

## Step 1. Install firecracker and add it as executable ##

```bash
chmod +x ~/src/install-firecracker.sh
sudo ~/src/install-firecracker.sh
```

## Step 2. Install dependencies - Linux Kernel, Root FS ##

```bash
chmod +x ~/src/install-firecracker-dependencies.sh
sudo ~/src/install-firecracker-dependencies.sh
```

## Step 3. Create MicroVM kernel configuration JSON file ##

`touch ~/src/microvm-configs.json`

## Step 4. Add VM configurations ##

`vim ~/src/microvm-configs.json`

- Paste the baseline configs provided with `microvm-configs.json`
- Update the path for the dependencies - `kernel_image_path` and `path_on_host` variables in config.json
- Save and exit file - `!wq`

The `microvm-configs.json` file arguments could be customized as per the system requirements. `firecracker` api documentation is available at [/firecracker/swagger/firecracker.yaml](https://github.com/firecracker-microvm/firecracker/blob/main/src/firecracker/swagger/firecracker.yaml)

## Step 5. Run a MicroVM ##

```bash
chmod +x ~/src/run.sh
sudo ~/src/run.sh
```
