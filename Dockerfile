FROM ubuntu:latest

RUN apt update && \
  apt upgrade -y && \
  apt install -y automake bc build-essential bzip2 ccache curl dpkg-dev git gperf \
  libghc-bzlib-dev libncurses-dev libz-dev libssl-dev liblz4-tool \
  make pngquant python-networkx schedtool squashfs-tools zlib1g && \
  apt clean

RUN mkdir /toolchains && cd /toolchains && \
  git clone https://android.googlesource.com/platform/prebuilts/gcc/linux-x86/aarch64/aarch64-linux-android-4.9 && \
  git clone https://android.googlesource.com/platform/prebuilts/gcc/linux-x86/arm/arm-linux-androideabi-4.9 && \
  git clone -b android-9.0.0_r30 https://android.googlesource.com/platform/prebuilts/clang/host/linux-x86 clang && \
  git clone https://android.googlesource.com/platform/external/lz4 && \
  git clone https://android.googlesource.com/platform/external/dtc && \
  git clone https://android.googlesource.com/platform/system/libufdt

ENV PATH=$PATH:/toolchains
ENV USE_CCACHE=1
ENV ANDROID_JACK_VM_ARGS="-Xmx12g -Dfile.encoding=UTF-8 -XX:+TieredCompilation"

WORKDIR /src

CMD ["./compile.sh"]
