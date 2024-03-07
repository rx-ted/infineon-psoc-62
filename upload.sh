# arm-none-eabi-objcopy.exe -O ihex output/rtthread.elf output/rtthread.hex
make.exe -j32
./tools/openocd/openocd.exe -s tools/scripts -f interface/kitprog3.cfg -f target/psoc6_2m.cfg  -c " program ./output/rtthread.hex exit"