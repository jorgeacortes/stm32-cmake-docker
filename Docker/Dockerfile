FROM ubuntu:focal

MAINTAINER Jorge A. Cortés <contact@jorgeacortes.com>
LABEL description="Image for compiling STM32 families with cmake"

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update \
    && apt-get install -y make gcc cmake git wget g++ \
# Temporary directory
    && mkdir -p /home/stm32/temp \
    && cd /home/stm32/temp \
# Download gcc-arm-none-eabi toolchain for compiling STM32
    && wget https://developer.arm.com/-/media/Files/downloads/gnu-rm/9-2020q2/gcc-arm-none-eabi-9-2020-q2-update-x86_64-linux.tar.bz2  \
    && mkdir /home/stm32/lib \
    && tar xjf gcc-arm-none-eabi-9-2020-q2-update-x86_64-linux.tar.bz2 -C /home/stm32/lib \
# Download stm32-cmake project for using CMake for STM32. G4 family not supported.
    && cd /home/stm32/lib \
    && git clone --depth=1 https://github.com/ObKo/stm32-cmake \
# Download Firmware for F0, F1, F3, F4, F7, L0, L1, L4, G0, G4 and H7 families.
# Clean not needed files from repository to reduce size.
    && git clone --depth=1 https://github.com/STMicroelectronics/STM32CubeF0 \
    && mv STM32CubeF0/Drivers Drivers && rm -rf STM32CubeF0 && mkdir STM32CubeF0 && mv Drivers STM32CubeF0/Drivers \
    && git clone --depth=1 https://github.com/STMicroelectronics/STM32CubeF1 \
    && mv STM32CubeF1/Drivers Drivers && rm -rf STM32CubeF1 && mkdir STM32CubeF1 && mv Drivers STM32CubeF1/Drivers \
    && git clone --depth=1 https://github.com/STMicroelectronics/STM32CubeF2 \
    && mv STM32CubeF2/Drivers Drivers && rm -rf STM32CubeF2 && mkdir STM32CubeF2 && mv Drivers STM32CubeF2/Drivers \
    && git clone --depth=1 https://github.com/STMicroelectronics/STM32CubeF3 \
    && mv STM32CubeF3/Drivers Drivers && rm -rf STM32CubeF3 && mkdir STM32CubeF3 && mv Drivers STM32CubeF3/Drivers \
    && git clone --depth=1 https://github.com/STMicroelectronics/STM32CubeF4 \
    && mv STM32CubeF4/Drivers Drivers && rm -rf STM32CubeF4 && mkdir STM32CubeF4 && mv Drivers STM32CubeF4/Drivers \
    && git clone --depth=1 https://github.com/STMicroelectronics/STM32CubeF7 \
    && mv STM32CubeF7/Drivers Drivers && rm -rf STM32CubeF7 && mkdir STM32CubeF7 && mv Drivers STM32CubeF7/Drivers \
    && git clone --depth=1 https://github.com/STMicroelectronics/STM32CubeL0 \
    && mv STM32CubeL0/Drivers Drivers && rm -rf STM32CubeL0 && mkdir STM32CubeL0 && mv Drivers STM32CubeL0/Drivers \
    && git clone --depth=1 https://github.com/STMicroelectronics/STM32CubeL1 \
    && mv STM32CubeL1/Drivers Drivers && rm -rf STM32CubeL1 && mkdir STM32CubeL1 && mv Drivers STM32CubeL1/Drivers \
    && git clone --depth=1 https://github.com/STMicroelectronics/STM32CubeL4 \
    && mv STM32CubeL4/Drivers Drivers && rm -rf STM32CubeL4 && mkdir STM32CubeL4 && mv Drivers STM32CubeL4/Drivers \
    && git clone --depth=1 https://github.com/STMicroelectronics/STM32CubeG0 \
    && mv STM32CubeG0/Drivers Drivers && rm -rf STM32CubeG0 && mkdir STM32CubeG0 && mv Drivers STM32CubeG0/Drivers \
    && git clone --depth=1 https://github.com/STMicroelectronics/STM32CubeG4 \
    && mv STM32CubeG4/Drivers Drivers && rm -rf STM32CubeG4 && mkdir STM32CubeG4 && mv Drivers STM32CubeG4/Drivers \
    && git clone --depth=1 https://github.com/STMicroelectronics/STM32CubeH7 \
    && mv STM32CubeH7/Drivers Drivers && rm -rf STM32CubeH7 && mkdir STM32CubeH7 && mv Drivers STM32CubeH7/Drivers \
# Delete not needed packages and folders
    && apt-get remove -y wget \
    && rm -rf /var/lib/apt/lists/* \
    && rm -rf /home/stm32/temp \
# Create working directory for sharing with repository
    && mkdir /home/stm32/ws

WORKDIR /home/stm32/ws

# Define paths
ENV STM32_CMAKE_MODULES=/home/stm32/lib/stm32-cmake/cmake \
    STM32_FW_F0=/home/stm32/lib/STM32CubeF0 \
    STM32_FW_F1=/home/stm32/lib/STM32CubeF1 \
    STM32_FW_F2=/home/stm32/lib/STM32CubeF2 \
    STM32_FW_F3=/home/stm32/lib/STM32CubeF3 \
    STM32_FW_F4=/home/stm32/lib/STM32CubeF4 \
    STM32_FW_F7=/home/stm32/lib/STM32CubeF7 \
    STM32_FW_L0=/home/stm32/lib/STM32CubeL0 \
    STM32_FW_L1=/home/stm32/lib/STM32CubeL1 \
    STM32_FW_L4=/home/stm32/lib/STM32CubeL4 \
    STM32_FW_G0=/home/stm32/lib/STM32CubeG0 \
    STM32_FW_G4=/home/stm32/lib/STM32CubeG4 \
    STM32_FW_H7=/home/stm32/lib/STM32CubeH7 \
    ARM_TOOLCHAIN=/home/stm32/lib/gcc-arm-none-eabi-9-2020-q2-update
