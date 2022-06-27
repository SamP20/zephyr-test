# zephyr-test
Playing with a Zephyr project

## Layout overview

* zephyrproject. Created using the `west init` command and commited as git submodules (can also use
  subrepo).
* applications. Folder containing zephyr applications and module.
  - my_app. Example application. Can be built for various boards.
  - module. Contains additional boards, drivers, and subsystems.
* libs. Libraries/tools that can be compiled standalone. Can be a mix of python, C etc.
  - hw_testlib. Hardware testing python library. Provides various hardware drivers as pytest
    fixtures. Can be pip installed.
  - commslib. Comunications library. Provides C api and command spec for communicating with
    applications. Can be compiled into the application, and also as a standalone C library with
    scripted language bindings (Python, Ruby etc.).
* tests. Various tests.
  - hardware. Tests using physical hardware. Run by pytest.
  - integration. Integration test using Zephyr's emulated posix kernel.
  - unit. Unit tests without the Zephyr kernel.


## Makefile
  
A single root `Makefile` is provided for convenient high-level build commands/orchestration. Each
component of the project should be simple to build/run by hand however. For example the applications
only need the `ZEPHYR_BASE` and `ZEPHYR_EXTRA_MODULES` environment variable set (could even be
simplified to just `PROJECT_ROOT`) when calling `cmake`. Standalone `libs` should be buildable
entirely within their subfolder.
  
The last application build is symlinked to `build/lastbuild`. This makes it easier to run build
specific commands such as `flash`, `debug`, `build` (to rebuild), `menuconfig`, `install` etc. You
can always use the more specific versions too e.g. `flash.my_app.my_board@2.0`

## CI

The sole purpose of the CI scripts is to determine which makefile commands to run and when. It should
be easy to run the same commands locally (assuming hardware/software dependencies are met).
