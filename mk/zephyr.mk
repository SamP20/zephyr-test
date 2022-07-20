
export ZEPHYR_EXTRA_MODULES := $(PROJECT_ROOT)my_module/
export ZEPHYR_BASE := $(PROJECT_ROOT)zephyrproject/zephyr/
# export ZEPHYR_TOOLCHAIN_VARIANT := gnuarmemb
ZEPHYR_APP_DIR := $(PROJECT_ROOT)applications/

ZEPHYR_LAST_BUILD_FILENAME := $(PROJECT_ROOT).lastbuild
ZEPHYR_LAST_BUILD := $(file <$(ZEPHYR_LAST_BUILD_FILENAME))


zephyr_target = $(ZEPHYR_APP_ALIASES:%=%.$(1))

# Besides the initial CMake target, we use app aliases everywhere.
# This has a few benefits:
# * Aliases are easier to remember, e.g. `make flash.my_alias` instead
#   of `make flash.my_app/my_board@1.0.0`.
# * Makes the makefile syntax easier. Using the alias name as the
#   build directory avoids the need to map every utility command.


$(BUILD_DIR)%/build.ninja: | $(BUILD_DIR)%/
	cd $(@D) && cmake -GNinja -DBOARD=$(ZEPHYR_BOARD) $(ZEPHYR_APP_DIR)$(ZEPHYR_APP_NAME)

$(BUILD_DIR)%/:
	mkdir -p $@


# Add pattern rules for each output type.
# Only one of these will actually be used by the application
$(BUILD_DIR)%/zephyr/zephyr.elf: $(BUILD_DIR)%/build.ninja update-lastbuild-file-%
	ninja -C $(<D)

$(BUILD_DIR)%/zephyr/zephyr.hex: $(BUILD_DIR)%/build.ninja update-lastbuild-file-%
	ninja -C $(<D)

$(BUILD_DIR)%/zephyr/zephyr.bin: $(BUILD_DIR)%/build.ninja update-lastbuild-file-%
	ninja -C $(<D)


.PHONY: $(call zephyr_target,flash)
$(call zephyr_target,flash): %.flash: $(BUILD_DIR)%/build.ninja
	ninja -C $(<D) flash

.PHONY: flash
flash: $(ZEPHYR_LAST_BUILD).flash


# Special rule to update the .lastbuild file.
update-lastbuild-file-%:
	$(file >$(ZEPHYR_LAST_BUILD_FILENAME),$*)
