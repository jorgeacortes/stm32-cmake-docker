docker run --rm -v %cd%/..:/home/stm32/ws cortesja/stm32-cmake:latest bash -c "sh build.sh 2>&1 | tee out.txt"
