SCRIPT_DIR := $(dir $(lastword $(MAKEFILE_LIST)))

ALL_APPS += my_app.myboard@2.0

my_app.%: lastbuild.my_app.%
	cmake -B${BUILD_DIR}$@ -GNinja -DBOARD=$(patsubst my_app.%,%,$@) ${SCRIPT_DIR}
	ninja -C${BUILD_DIR}$@