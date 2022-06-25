
export ZEPHYR_EXTRA_MODULES = ${PROJECT_ROOT}applications/module
export ZEPHYR_BASE = ${PROJECT_ROOT}zephyrproject/zephyr

lastbuild.%:
ifeq ($(OS),Windows_NT)
	mklink /D ${BUILD_DIR}lastbuild ${BUILD_DIR}$(patsubst lastbuild.%,%,$@)
else
	ln -s ${BUILD_DIR}$(patsubst lastbuild.%,%,$@) ${BUILD_DIR}lastbuild
endif


flash: flash.last_build

flash.%:
	cd ${BUILD_DIR} && ninja flash