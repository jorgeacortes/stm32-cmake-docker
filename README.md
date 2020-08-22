# About

![Build action](https://github.com/jorgeacortes/stm32-cmake-docker/workflows/Build%20action/badge.svg)

This project is a sample project that contains a docker image that allows to compile STM32 ARM Cortex-M microcontrollers using cmake.

Supported families are: F0, F1, F2, F3, F4, F7, L0, L1, L4, G0 and H7.
G4 family is not supported by STM32 CMake modules.

## Project contents

* Dockerfile for creating base image. Prebuilt image already uploaded at docker hub.
  * Docker image: docker pull [cortesja/stm32-cmake:latest](https://hub.docker.com/r/cortesja/stm32-cmake)
* stm32-docker-cmake.ioc: Sample project configured with STM32CubeMX for board NUCLEO-F072RB.
* CMakeLists.txt file for compiling with cmake.
* build.sh / clean.sh bash script for compiling project inside the container.
* docker-clean.bat and docker-compile.bat as examples for launching docker from Windows cmd or powershell.
* Project and launch files for flashing and debugging with STM32CubeIDE.

## Sample usage

```
# build project
docker run --rm -v $(pwd):/home/stm32/ws cortesja/stm32-cmake:latest bash -c "sh build.sh"
```

## Versions

* Ubuntu 20.04
* Cmake: 3.16.3
* STM32CubeMX 5.6.1
* STM32 FW: git clones from 22/08/2020 - You can review versions inside the image
* ARM Toolchain: gcc-arm-none-eabi-9-2020-q2-update
* STM32 CMake Modules: git clone from 22/08/2020 - You can review versions inside the image

## Open topics

* Flashing
* Add Github actions example for compiling

## Credits

* STM32 CMake Modules provided by: https://github.com/ObKo/stm32-cmake
