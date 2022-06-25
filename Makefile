PROJECT_ROOT := $(shell git rev-parse --show-toplevel)/

include mk/common.mk

include applications/app1/module.mk
include applications/app2/module.mk