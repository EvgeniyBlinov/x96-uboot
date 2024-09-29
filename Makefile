SRC_SCRIPT=s905_init_aml_autoscript
BUILD_DIR=builds
DIRS=$(BUILD_DIR)
IMAGES=$(BUILD_DIR)/aml_autoscript $(BUILD_DIR)/emmc_autoscript $(BUILD_DIR)/s905_autoscript

all: \
		build \
		create_archive

s905_init_aml_autoscript:
	$(MAKE) SRC_SCRIPT=s905_init_aml_autoscript

boot_s9xx_armbian_mmc:
	$(MAKE) SRC_SCRIPT=boot_s9xx_armbian_mmc

build: $(IMAGES)

create_archive: \
		build
	zip -RE -jX $(BUILD_DIR)/aml_autoscript.zip \
		$(BUILD_DIR)/aml_autoscript

$(DIRS):
	mkdir -p $@

$(IMAGES): \
		$(DIRS)
	mkimage \
		-A arm64 \
		-T script \
		-C none \
		-d script/$(SRC_SCRIPT).txt $@

clean:
	rm -rf $(BUILD_DIR)/
