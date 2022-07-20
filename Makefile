export PROJECT_ROOT := $(shell git rev-parse --show-toplevel)/
BUILD_DIR := $(PROJECT_ROOT)build/


include applications/my_app/module.mk

# This needs to be at the end so the pre-defined targets know what to build
include mk/common.mk