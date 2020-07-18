FROM ubuntu:focal

MAINTAINER Jorge A. Cortés <contact@jorgeacortes.com>
LABEL description="Image for compiling STM32 families with cmake"

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update \
    && apt-get install -y make gcc cmake git \
    && rm -rf /var/lib/apt/lists/*

RUN apt-get update \
    && apt-get install -y wget \
    && rm -rf /var/lib/apt/lists/*

RUN useradd --user-group --system --create-home --no-log-init stm32
USER stm32
RUN mkdir /home/stm32/temp
WORKDIR /home/stm32/temp

# Download gcc-arm-none-eabi toolchain for compiling STM32
RUN wget https://developer.arm.com/-/media/Files/downloads/gnu-rm/9-2020q2/gcc-arm-none-eabi-9-2020-q2-update-x86_64-linux.tar.bz2
RUN mkdir /home/stm32/lib
RUN tar xjf gcc-arm-none-eabi-9-2020-q2-update-x86_64-linux.tar.bz2 -C /home/stm32/lib

WORKDIR /home/stm32/lib
# Download stm32-cmake project for using CMake for STM32
RUN git clone --depth=1 https://github.com/ObKo/stm32-cmake

# Download Firmware for F0, F1, F3, F4, F7, L0, L1, G0, H7 families
RUN git clone --depth=1 https://github.com/STMicroelectronics/STM32CubeF0
RUN git clone --depth=1 https://github.com/STMicroelectronics/STM32CubeF1
RUN git clone --depth=1 https://github.com/STMicroelectronics/STM32CubeF2
RUN git clone --depth=1 https://github.com/STMicroelectronics/STM32CubeF3
RUN git clone --depth=1 https://github.com/STMicroelectronics/STM32CubeF4
RUN git clone --depth=1 https://github.com/STMicroelectronics/STM32CubeF7
RUN git clone --depth=1 https://github.com/STMicroelectronics/STM32CubeL0
RUN git clone --depth=1 https://github.com/STMicroelectronics/STM32CubeL1
RUN git clone --depth=1 https://github.com/STMicroelectronics/STM32CubeG0
RUN git clone --depth=1 https://github.com/STMicroelectronics/STM32CubeH7

RUN rm -rf /home/stm32/temp/


# Define paths
ENV STM32_CMAKE_MODULES /home/stm32/lib/stm32-cmake/cmake
ENV STM32_FW_F0 /home/stm32/lib/STM32CubeF0
ENV STM32_FW_F1 /home/stm32/lib/STM32CubeF1
ENV STM32_FW_F2 /home/stm32/lib/STM32CubeF2
ENV STM32_FW_F3 /home/stm32/lib/STM32CubeF3
ENV STM32_FW_F4 /home/stm32/lib/STM32CubeF4
ENV STM32_FW_F7 /home/stm32/lib/STM32CubeF7
ENV STM32_FW_L0 /home/stm32/lib/STM32CubeL0
ENV STM32_FW_L1 /home/stm32/lib/STM32CubeL1
ENV STM32_FW_G0 /home/stm32/lib/STM32CubeG0
ENV STM32_FW_H7 /home/stm32/lib/STM32CubeH7
ENV ARM_TOOLCHAIN /home/stm32/lib/gcc-arm-none-eabi-9-2020-q2-update

# Shared directory folder
RUN mkdir /home/stm32/ws
WORKDIR /home/stm32/ws