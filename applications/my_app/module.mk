SCRIPT_DIR := $(dir $(lastword $(MAKEFILE_LIST)))

ZEPHYR_APP_ALIASES += board_app_alias

# Final application output
# This could also depend on other outputs such as signed images
PHONY: board_app_alias
board_app_alias: $(BUILD_DIR)board_app_alias/zephyr/zephyr.bin
board_app_alias: ZEPHYR_BOARD=nucleo_h753zi
board_app_alias: ZEPHYR_APP_NAME=my_app