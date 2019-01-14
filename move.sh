rm -r ../AnyKernel2-wahoo/dtbs/*
echo "removed dtbs"
cp out/arch/arm64/boot/dts/htc/* ../AnyKernel2-wahoo/dtbs/
echo "Added new dtbs"
rm -r ../AnyKernel2-wahoo/dtbs/modules.order
rm -r ../AnyKernel2-wahoo/kernel/*
echo "Removed old kernel file"
cp out/arch/arm64/boot/Image.lz4 ../AnyKernel2-wahoo/kernel
echo "Added new kernel file"
echo "Done"
