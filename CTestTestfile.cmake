# CMake generated Testfile for 
# Source directory: /users/Wei_Hao/XNNPACK
# Build directory: /users/Wei_Hao/XNNPACK
# 
# This file includes the relevant testing commands required for 
# testing this directory and lists subdirectories to be tested as well.
add_test(add-nc-test "add-nc-test")
add_test(add-nd-test "add-nd-test")
add_test(argmax-pooling-nhwc-test "argmax-pooling-nhwc-test")
add_test(average-pooling-nhwc-test "average-pooling-nhwc-test")
add_test(channel-pad-nc-test "channel-pad-nc-test")
add_test(channel-shuffle-nc-test "channel-shuffle-nc-test")
add_test(clamp-nc-test "clamp-nc-test")
add_test(convolution-nhwc-test "convolution-nhwc-test")
add_test(convolution-nchw-test "convolution-nchw-test")
add_test(deconvolution-nhwc-test "deconvolution-nhwc-test")
add_test(divide-nd-test "divide-nd-test")
add_test(fully-connected-nc-test "fully-connected-nc-test")
add_test(global-average-pooling-nwc-test "global-average-pooling-nwc-test")
add_test(global-average-pooling-ncw-test "global-average-pooling-ncw-test")
add_test(hardswish-nc-test "hardswish-nc-test")
add_test(leaky-relu-nc-test "leaky-relu-nc-test")
add_test(max-pooling-nhwc-test "max-pooling-nhwc-test")
add_test(maximum-nd-test "maximum-nd-test")
add_test(minimum-nd-test "minimum-nd-test")
add_test(multiply-nd-test "multiply-nd-test")
add_test(prelu-nc-test "prelu-nc-test")
add_test(resize-bilinear-nhwc-test "resize-bilinear-nhwc-test")
add_test(sigmoid-nc-test "sigmoid-nc-test")
add_test(softmax-nc-test "softmax-nc-test")
add_test(subtract-nd-test "subtract-nd-test")
add_test(unpooling-nhwc-test "unpooling-nhwc-test")
add_test(f16-gemm-minmax-test "f16-gemm-minmax-test")
add_test(f16-spmm-minmax-test "f16-spmm-minmax-test")
add_test(f32-argmaxpool-test "f32-argmaxpool-test")
add_test(f32-avgpool-minmax-test "f32-avgpool-minmax-test")
add_test(f32-clamp-test "f32-clamp-test")
add_test(f32-conv-hwc-test "f32-conv-hwc-test")
add_test(f32-conv-hwc2spchw-test "f32-conv-hwc2spchw-test")
add_test(f32-dwconv-spchw-test "f32-dwconv-spchw-test")
add_test(f32-dwconv-test "f32-dwconv-test")
add_test(f32-dwconv-minmax-test "f32-dwconv-minmax-test")
add_test(f32-gavgpool-spchw-test "f32-gavgpool-spchw-test")
add_test(f32-gavgpool-minmax-test "f32-gavgpool-minmax-test")
add_test(f32-gemm-test "f32-gemm-test")
add_test(f32-gemm-minmax-test "f32-gemm-minmax-test")
add_test(f32-gemminc-minmax-test "f32-gemminc-minmax-test")
add_test(f32-hswish-test "f32-hswish-test")
add_test(f32-ibilinear-test "f32-ibilinear-test")
add_test(f32-igemm-test "f32-igemm-test")
add_test(f32-igemm-minmax-test "f32-igemm-minmax-test")
add_test(f16-igemm-minmax-test "f16-igemm-minmax-test")
add_test(f32-maxpool-minmax-test "f32-maxpool-minmax-test")
add_test(f32-pavgpool-minmax-test "f32-pavgpool-minmax-test")
add_test(f32-ppmm-minmax-test "f32-ppmm-minmax-test")
add_test(f32-prelu-test "f32-prelu-test")
add_test(f32-raddexpminusmax-test "f32-raddexpminusmax-test")
add_test(f32-raddextexp-test "f32-raddextexp-test")
add_test(f32-raddstoreexpminusmax-test "f32-raddstoreexpminusmax-test")
add_test(f32-rmax-test "f32-rmax-test")
add_test(f32-sigmoid-test "f32-sigmoid-test")
add_test(f32-spmm-minmax-test "f32-spmm-minmax-test")
add_test(f16-vadd-minmax-test "f16-vadd-minmax-test")
add_test(f16-vaddc-minmax-test "f16-vaddc-minmax-test")
add_test(f16-vdiv-minmax-test "f16-vdiv-minmax-test")
add_test(f16-vdivc-minmax-test "f16-vdivc-minmax-test")
add_test(f16-vrdivc-minmax-test "f16-vrdivc-minmax-test")
add_test(f16-vmax-test "f16-vmax-test")
add_test(f16-vmaxc-test "f16-vmaxc-test")
add_test(f16-vmin-test "f16-vmin-test")
add_test(f16-vminc-test "f16-vminc-test")
add_test(f16-vmul-minmax-test "f16-vmul-minmax-test")
add_test(f16-vmulc-minmax-test "f16-vmulc-minmax-test")
add_test(f16-vsub-minmax-test "f16-vsub-minmax-test")
add_test(f16-vsubc-minmax-test "f16-vsubc-minmax-test")
add_test(f16-vrsubc-minmax-test "f16-vrsubc-minmax-test")
add_test(f32-vadd-minmax-test "f32-vadd-minmax-test")
add_test(f32-vaddc-minmax-test "f32-vaddc-minmax-test")
add_test(f32-vdiv-minmax-test "f32-vdiv-minmax-test")
add_test(f32-vdivc-minmax-test "f32-vdivc-minmax-test")
add_test(f32-vrdivc-minmax-test "f32-vrdivc-minmax-test")
add_test(f32-vmax-test "f32-vmax-test")
add_test(f32-vmaxc-test "f32-vmaxc-test")
add_test(f32-vmin-test "f32-vmin-test")
add_test(f32-vminc-test "f32-vminc-test")
add_test(f32-vmul-minmax-test "f32-vmul-minmax-test")
add_test(f32-vmulc-minmax-test "f32-vmulc-minmax-test")
add_test(f32-vmulcaddc-minmax-test "f32-vmulcaddc-minmax-test")
add_test(f32-vscaleexpminusmax-test "f32-vscaleexpminusmax-test")
add_test(f32-vscaleextexp-test "f32-vscaleextexp-test")
add_test(f32-vsub-minmax-test "f32-vsub-minmax-test")
add_test(f32-vsubc-minmax-test "f32-vsubc-minmax-test")
add_test(f32-vrsubc-minmax-test "f32-vrsubc-minmax-test")
add_test(q8-avgpool-minmax-test "q8-avgpool-minmax-test")
add_test(q8-dwconv-minmax-test "q8-dwconv-minmax-test")
add_test(q8-gavgpool-test "q8-gavgpool-minmax-test")
add_test(q8-gemm-minmax-test "q8-gemm-minmax-test")
add_test(q8-igemm-minmax-test "q8-igemm-minmax-test")
add_test(q8-vadd-minmax-test "q8-vadd-minmax-test")
add_test(u8-clamp-test "u8-clamp-test")
add_test(u8-lut32norm-test "u8-lut32norm-test")
add_test(u8-maxpool-minmax-test "u8-maxpool-minmax-test")
add_test(u8-rmax-test "u8-rmax-test")
add_test(x32-packx-test "x32-packx-test")
add_test(x32-pad-test "x32-pad-test")
add_test(x32-unpool-test "x32-unpool-test")
add_test(x32-zip-test "x32-zip-test")
add_test(x8-lut-test "x8-lut-test")
add_test(x8-zip-test "x8-zip-test")
add_test(requantization-test "requantization-test")
subdirs("clog")
subdirs("cpuinfo")
subdirs("pthreadpool")
subdirs("psimd")
subdirs("FP16")
subdirs("googletest")
subdirs("deps/googlebenchmark")
