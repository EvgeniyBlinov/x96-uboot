SRC_SCRIPT=aml_autoscript
#SRC_SCRIPT=s905_autoscript
BUILD_DIR=builds
DIRS=$(BUILD_DIR)

all: \
		build \
		create_archive

build: \
		$(DIRS)
	mkimage -A arm -O linux -T script -C none -d script/$(SRC_SCRIPT).txt $(BUILD_DIR)/$(SRC_SCRIPT)

create_archive:
	zip -jX $(BUILD_DIR)/$(SRC_SCRIPT).zip \
		script/$(SRC_SCRIPT).txt \
		$(BUILD_DIR)/$(SRC_SCRIPT)

$(DIRS):
	mkdir -p $@

clean:
	rm -rf $(BUILD_DIR)/
