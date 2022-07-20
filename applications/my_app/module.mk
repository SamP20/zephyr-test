SCRIPT_DIR := $(dir $(lastword $(MAKEFILE_LIST)))

ZEPHYR_APP_ALIASES += my_alias

# Final application output
# This could also depend on other outputs such as signed images
PHONY: my_alias
my_alias: $(BUILD_DIR)my_alias/zephyr/zephyr.bin
my_alias: ZEPHYR_BOARD=nucleo_h753zi
my_alias: ZEPHYR_APP_NAME=my_app