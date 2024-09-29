### Install dependencies

```sh
apt-get update && apt-get install u-boot-tools -y
```

### Make scripts

```sh
## Clean previous scripts
make clean

## Make init script for s9xx tv boxes
make s905_init_aml_autoscript

## Make boot Armbian script for s9xx tv boxes
make boot_s9xx_armbian_mmc
```
