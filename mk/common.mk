SCRIPT_DIR := $(dir $(lastword $(MAKEFILE_LIST)))

include $(SCRIPT_DIR)fileops.mk
include $(SCRIPT_DIR)zephyr.mk