SCRIPT_DIR := $(dir $(lastword $(MAKEFILE_LIST)))

export PROJECT_ROOT := $(shell git rev-parse --show-toplevel)/
BUILD_DIR := ${PROJECT_ROOT}build/




include $(SCRIPT_DIR)fileops.mk
include $(SCRIPT_DIR)zephyr.mk