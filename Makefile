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

#build: \
		#$(DIRS)
	#mkimage -A arm -O linux -T script -C none -d script/$(SRC_SCRIPT).txt $(BUILD_DIR)/$(SRC_SCRIPT)

#create_archive:
	#zip -jX $(BUILD_DIR)/$(SRC_SCRIPT).zip \
		#script/$(SRC_SCRIPT).txt \
		#$(BUILD_DIR)/$(SRC_SCRIPT)

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
