### Install dependencies

```sh
apt-get update && apt-get install u-boot-tools -y
```

### Make script

```sh
mkimage -A arm -O linux -T script -C none -d aml_autoscript.txt aml_autoscript
```

or

```sh
mkimage -A arm -O linux -T script -C none -d s905_autoscript.txt s905_autoscript
```
