SCRIPT_DIR := $(dir $(lastword $(MAKEFILE_LIST)))

include $(SCRIPT_DIR)pyvenv.mk
include $(SCRIPT_DIR)fileops.mk