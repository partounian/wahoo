#!/usr/bin/env sh
make O=out ARCH=arm64 wahoo_defconfig
make -j"$(nproc --all)" O=out ARCH=arm64 CC='/toolchains/clang-4691093/bin/clang' CLANG_TRIPLE=aarch64-linux-android- CROSS_COMPILE_ARM32='/toolchains/aarch64-linux-android-4.9/bin/aarch64-linux-android-' CROSS_COMPILE='/toolchains/arm-linux-androideabi-4.9/bin/aarch64-linux-android-'
