
export ZEPHYR_EXTRA_MODULES := $(PROJECT_ROOT)my_module/
export ZEPHYR_BASE := $(PROJECT_ROOT)zephyrproject/zephyr/

lastbuild.%:
ifeq ($(OS),Windows_NT)
	mklink /D ${BUILD_DIR}lastbuild ${BUILD_DIR}$(patsubst lastbuild.%,%,$@)
else
	ln -s ${BUILD_DIR}$(patsubst lastbuild.%,%,$@) ${BUILD_DIR}lastbuild
endif


flash: flash.lastbuild

flash.%:
	ninja -C${BUILD_DIR}$(patsubst flash.%,%,$@) flash