// Copyright 2019 Google LLC
//
// This source code is licensed under the BSD-style license found in the
// LICENSE file in the root directory of this source tree.

#include <xnnpack.h>

#include <algorithm>
#include <functional>
#include <iostream>
#include <limits>
#include <random>

#include "models/models.h"

namespace models {

ExecutionPlan MobileNetV1(pthreadpool_t threadpool) {
  alignas(16) static float v2[150528];
  alignas(16) static float v3[301056];
  alignas(16) static float v4[301056];

  alignas(16) static float w0[648];
  alignas(16) static float w1[24];
  alignas(16) static float w2[216];
  alignas(16) static float w3[24];


  std::random_device random_device;
  auto rng = std::mt19937(random_device());
  std::bernoulli_distribution random_bool_generator(0.1);//Probability of 1's
  auto f32rng = std::bind(random_bool_generator, rng);
  std::generate(v2, v2 + 150528, std::ref(f32rng));
  std::generate(v3+301056, v3 + 301056, std::ref(f32rng));
  std::generate(w0, w0 + 648, std::ref(f32rng));
  std::generate(w1, w1 + 24, std::ref(f32rng));
  std::generate(w2, w2 + 216, std::ref(f32rng));
  std::generate(w3, w3 + 24, std::ref(f32rng));

  
  ExecutionPlan operators;
  xnn_status status;


  xnn_operator_t op0 = nullptr;
  status = xnn_create_convolution2d_nchw_f32(
    1 /* top padding */, 1 /* right padding */,
    1 /* bottom padding */, 1 /* left padding */,
    3 /* kernel height */, 3 /* kernel width */,
    2 /* subsampling height */, 2 /* subsampling width */,
    1 /* dilation_height */, 1 /* dilation_width */,
    1 /* groups */,
    3 /* input channels per group */,
    24 /* output_channels_per_group */,
    w0, w1,
    0.0f /* output min */, 6.0f /* output max */,
    XNN_FLAG_INPUT_NHWC/* flags */,
    &op0);
  if (status != xnn_status_success) {
    std::cerr << "failed to create operation #0" << std::endl;
    return ExecutionPlan();
  }
  operators.emplace_back(op0, xnn_delete_operator);

  status = xnn_setup_convolution2d_nchw_f32(
  op0,
  1,//size_t batch_size,
  224*224*3,//size_t input_batch_stride,
  112*112*24,//size_t output_batch_stride,
  224, //input_height,
  224, //input_width,
  &v2[0],//const float* input,
  &v3[0],//float* output,
  threadpool);
  if (status != xnn_status_success) {
    std::cerr << "failed to setup operation #0" << std::endl;
    return ExecutionPlan();
  }



  xnn_operator_t op1 = nullptr;
  status = xnn_create_convolution2d_nchw_f32(
    1 /* top padding */, 1 /* right padding */,
    1 /* bottom padding */, 1 /* left padding */,
    3 /* kernel height */, 3 /* kernel width */,
    1 /* subsampling height */, 1 /* subsampling width */,
    1 /* dilation_height */, 1 /* dilation_width */,
    24 /* groups */,
    1 /* input channels per group */,
    1 /* output_channels_per_group */,
    w2, w3,
    0.0f /* output min */, 6.0f /* output max */,
    0 /* flags */,
    &op1);

  if (status != xnn_status_success) {
    std::cerr << "failed to create operation #1" << std::endl;
    return ExecutionPlan();
  }
  operators.emplace_back(op1, xnn_delete_operator);
  status = xnn_setup_convolution2d_nchw_f32(
  op1,
  1,//size_t batch_size,
  112*112*24,//size_t input_batch_stride,
  112*112*24,//size_t output_batch_stride,
  112, //input_height,
  112, //input_width,
  &v3[0],//const float* input,
  &v4[0],//float* output,
  threadpool);

  if (status != xnn_status_success) {
    std::cerr << "failed to setup operation #1" << std::endl;
    return ExecutionPlan();
  }

  xnn_operator_t op2 = nullptr;
  status = xnn_create_convolution2d_nchw_f32(
    0 /* top padding */, 0 /* right padding */,
    0 /* bottom padding */, 0 /* left padding */,
    1 /* kernel height */, 1 /* kernel width */,
    1 /* subsampling height */, 1 /* subsampling width */,
    1 /* dilation_height */, 1 /* dilation_width */,
    1 /* groups */,
    24 /* input channels per group */,
    48 /* output_channels_per_group */,
    w4, w5,
    0.0f /* output min */, 6.0f /* output max */,
    0 /* flags */,
    &op2);
  if (status != xnn_status_success) {
    std::cerr << "failed to create operation #2" << std::endl;
    return ExecutionPlan();
  }
  operators.emplace_back(op2, xnn_delete_operator);

  status = xnn_setup_convolution2d_nchw_f32(
  op2,
  1,//size_t batch_size,
  112*112*24,//size_t input_batch_stride,
  112*112*48,//size_t output_batch_stride,
  112, //input_height,
  112, //input_width,
  &v4[0],//const float* input,
  &v5[0],//float* output,
  threadpool);

  if (status != xnn_status_success) {
    std::cerr << "failed to setup operation #2" << std::endl;
    return ExecutionPlan();
  }

  xnn_operator_t op3 = nullptr;
  status = xnn_create_convolution2d_nchw_f32(
    0 /* top padding */, 1 /* right padding */,
    1 /* bottom padding */, 0 /* left padding */,
    3 /* kernel height */, 3 /* kernel width */,
    2 /* subsampling height */, 2 /* subsampling width */,
    1 /* dilation_height */, 1 /* dilation_width */,
    48 /* groups */,
    1 /* input channels per group */,
    1 /* output_channels_per_group */,
    w6, w7,
    0.0f /* output min */, 6.0f /* output max */,
    0 /* flags */,
    &op3);

  if (status != xnn_status_success) {
    std::cerr << "failed to create operation #3" << std::endl;
    return ExecutionPlan();
  }
  operators.emplace_back(op3, xnn_delete_operator);
  status = xnn_setup_convolution2d_nchw_f32(
  op3,
  1,//size_t batch_size,
  112*112*48,//size_t input_batch_stride,
  56*56*48,//size_t output_batch_stride,
  112, //input_height,
  112, //input_width,
  &v5[0],//const float* input,
  &v6[0],//float* output,
  threadpool);
  if (status != xnn_status_success) {
    std::cerr << "failed to setup operation #3" << std::endl;
    return ExecutionPlan();
  }

  xnn_operator_t op4 = nullptr;
  status = xnn_create_convolution2d_nchw_f32(
    0 /* top padding */, 0 /* right padding */,
    0 /* bottom padding */, 0 /* left padding */,
    1 /* kernel height */, 1 /* kernel width */,
    1 /* subsampling height */, 1 /* subsampling width */,
    1 /* dilation_height */, 1 /* dilation_width */,
    1 /* groups */,
    48 /* input channels per group */,
    96 /* output_channels_per_group */,
    w8, w9,
    0.0f /* output min */, 6.0f /* output max */,
    0 /* flags */,
    &op4);
  if (status != xnn_status_success) {
    std::cerr << "failed to create operation #4" << std::endl;
    return ExecutionPlan();
  }
  operators.emplace_back(op4, xnn_delete_operator);

  status = xnn_setup_convolution2d_nchw_f32(
  op4,
  1,//size_t batch_size,
  56*56*48,//size_t input_batch_stride,
  56*56*96,//size_t output_batch_stride,
  56, //input_height,
  56, //input_width,
  &v6[0],//const float* input,
  &v7[0],//float* output,
  threadpool);
  if (status != xnn_status_success) {
    std::cerr << "failed to setup operation #4" << std::endl;
    return ExecutionPlan();
  }

  xnn_operator_t op5 = nullptr;
  status = xnn_create_convolution2d_nchw_f32(
    1 /* top padding */, 1 /* right padding */,
    1 /* bottom padding */, 1 /* left padding */,
    3 /* kernel height */, 3 /* kernel width */,
    1 /* subsampling height */, 1 /* subsampling width */,
    1 /* dilation_height */, 1 /* dilation_width */,
    96 /* groups */,
    1 /* input channels per group */,
    1 /* output_channels_per_group */,
    w10, w11,
    0.0f /* output min */, 6.0f /* output max */,
    0 /* flags */,
    &op5);

  if (status != xnn_status_success) {
    std::cerr << "failed to create operation #5" << std::endl;
    return ExecutionPlan();
  }
  operators.emplace_back(op5, xnn_delete_operator);
  status = xnn_setup_convolution2d_nchw_f32(
  op5,
  1,//size_t batch_size,
  56*56*96,//size_t input_batch_stride,
  56*56*96,//size_t output_batch_stride,
  56, //input_height,
  56, //input_width,
  &v7[0],//const float* input,
  &v8[0],//float* output,
  threadpool);
  if (status != xnn_status_success) {
    std::cerr << "failed to setup operation #5" << std::endl;
    return ExecutionPlan();
  }

  xnn_operator_t op6 = nullptr;
  status = xnn_create_convolution2d_nchw_f32(
    0 /* top padding */,  0/* right padding */,
    0 /* bottom padding */, 0 /* left padding */,
    1 /* kernel height */, 1 /* kernel width */,
    1 /* subsampling height */, 1 /* subsampling width */,
    1 /* dilation_height */, 1 /* dilation_width */,
    1 /* groups */,
    96 /* input channels per group */,
    96 /* output_channels_per_group */,
    w12, w13,
    0.0f /* output min */, 6.0f /* output max */,
    0 /* flags */,
    &op6);
  if (status != xnn_status_success) {
    std::cerr << "failed to create operation #6" << std::endl;
    return ExecutionPlan();
  }
  operators.emplace_back(op6, xnn_delete_operator);

  status = xnn_setup_convolution2d_nchw_f32(
  op6,
  1,//size_t batch_size,
  56*56*96,//size_t input_batch_stride,
  56*56*96,//size_t output_batch_stride,
  56, //input_height,
  56, //input_width,
  &v8[0],//const float* input,
  &v9[0],//float* output,
  threadpool);
  if (status != xnn_status_success) {
    std::cerr << "failed to setup operation #6" << std::endl;
    return ExecutionPlan();
  }

  xnn_operator_t op7 = nullptr;
  status = xnn_create_convolution2d_nchw_f32(
    0 /* top padding */, 1 /* right padding */,
    1 /* bottom padding */, 0 /* left padding */,
    3 /* kernel height */, 3 /* kernel width */,
    2 /* subsampling height */, 2 /* subsampling width */,
    1 /* dilation_height */, 1 /* dilation_width */,
    96 /* groups */,
    1 /* input channels per group */,
    1 /* output_channels_per_group */,
    w14, w15,
    0.0f /* output min */, 6.0f /* output max */,
    0 /* flags */,
    &op7);

  if (status != xnn_status_success) {
    std::cerr << "failed to create operation #7" << std::endl;
    return ExecutionPlan();
  }
  operators.emplace_back(op7, xnn_delete_operator);
  status = xnn_setup_convolution2d_nchw_f32(
  op7,
  1,//size_t batch_size,
  56*56*96,//size_t input_batch_stride,
  28*28*96,//size_t output_batch_stride,
  56, //input_height,
  56, //input_width,
  &v9[0],//const float* input,
  &v10[0],//float* output,
  threadpool);
  if (status != xnn_status_success) {
    std::cerr << "failed to setup operation #7" << std::endl;
    return ExecutionPlan();
  }

   xnn_operator_t op8 = nullptr;
  status = xnn_create_convolution2d_nchw_f32(
    0 /* top padding */, 0 /* right padding */,
    0 /* bottom padding */, 0 /* left padding */,
    1 /* kernel height */, 1 /* kernel width */,
    1 /* subsampling height */, 1 /* subsampling width */,
    1 /* dilation_height */, 1 /* dilation_width */,
    1 /* groups */,
    96 /* input channels per group */,
    192 /* output_channels_per_group */,
    w16, w17,
    0.0f /* output min */, 6.0f /* output max */,
    0 /* flags */,
    &op8);
  if (status != xnn_status_success) {
    std::cerr << "failed to create operation #8" << std::endl;
    return ExecutionPlan();
  }
  operators.emplace_back(op8, xnn_delete_operator);

  status = xnn_setup_convolution2d_nchw_f32(
  op8,
  1,//size_t batch_size,
  28*28*96,//size_t input_batch_stride,
  28*28*192,//size_t output_batch_stride,
  56, //input_height,
  56, //input_width,
  &v10[0],//const float* input,
  &v11[0],//float* output,
  threadpool);
  if (status != xnn_status_success) {
    std::cerr << "failed to setup operation #8" << std::endl;
    return ExecutionPlan();
  }

  xnn_operator_t op9 = nullptr;
  status = xnn_create_convolution2d_nchw_f32(
    1 /* top padding */, 1 /* right padding */,
    1 /* bottom padding */, 1 /* left padding */,
    3 /* kernel height */, 3 /* kernel width */,
    1 /* subsampling height */, 1 /* subsampling width */,
    1 /* dilation_height */, 1 /* dilation_width */,
    192 /* groups */,
    1 /* input channels per group */,
    1 /* output_channels_per_group */,
    w18, w19,
    0.0f /* output min */, 6.0f /* output max */,
    0 /* flags */,
    &op9);

  if (status != xnn_status_success) {
    std::cerr << "failed to create operation #9" << std::endl;
    return ExecutionPlan();
  }
  operators.emplace_back(op9, xnn_delete_operator);
  status = xnn_setup_convolution2d_nchw_f32(
  op9,
  1,//size_t batch_size,
  28*28*192,//size_t input_batch_stride,
  28*28*192,//size_t output_batch_stride,
  28, //input_height,
  28, //input_width,
  &v11[0],//const float* input,
  &v12[0],//float* output,
  threadpool);
  if (status != xnn_status_success) {
    std::cerr << "failed to setup operation #9" << std::endl;
    return ExecutionPlan();
  }

  xnn_operator_t op10 = nullptr;
  status = xnn_create_convolution2d_nchw_f32(
    0 /* top padding */,  0/* right padding */,
    0 /* bottom padding */, 0 /* left padding */,
    1 /* kernel height */, 1 /* kernel width */,
    1 /* subsampling height */,  1/* subsampling width */,
    1 /* dilation_height */, 1 /* dilation_width */,
    1 /* groups */,
    192 /* input channels per group */,
    192 /* output_channels_per_group */,
    w20, w21,
    0.0f /* output min */, 6.0f /* output max */,
    0 /* flags */,
    &op10);
  if (status != xnn_status_success) {
    std::cerr << "failed to create operation #10" << std::endl;
    return ExecutionPlan();
  }
  operators.emplace_back(op10, xnn_delete_operator);

  status = xnn_setup_convolution2d_nchw_f32(
  op10,
  1,//size_t batch_size,
  28*28*192,//size_t input_batch_stride,
  28*28*192,//size_t output_batch_stride,
  28, //input_height,
  28, //input_width,
  &v12[0],//const float* input,
  &v13[0],//float* output,
  threadpool);
  if (status != xnn_status_success) {
    std::cerr << "failed to setup operation #10" << std::endl;
    return ExecutionPlan();
  }

  xnn_operator_t op11 = nullptr;
  status = xnn_create_convolution2d_nchw_f32(
    0 /* top padding */, 1 /* right padding */,
    1 /* bottom padding */, 0 /* left padding */,
    3 /* kernel height */, 3 /* kernel width */,
    2 /* subsampling height */, 2 /* subsampling width */,
    1 /* dilation_height */, 1 /* dilation_width */,
    192 /* groups */,
    1 /* input channels per group */,
    1 /* output_channels_per_group */,
    w22, w23,
    0.0f /* output min */, 6.0f /* output max */,
    0 /* flags */,
    &op11);

  if (status != xnn_status_success) {
    std::cerr << "failed to create operation #11" << std::endl;
    return ExecutionPlan();
  }
  operators.emplace_back(op11, xnn_delete_operator);
  status = xnn_setup_convolution2d_nchw_f32(
  op11,
  1,//size_t batch_size,
  28*28*192,//size_t input_batch_stride,
  14*14*192,//size_t output_batch_stride,
  28, //input_height,
  28, //input_width,
  &v13[0],//const float* input,
  &v14[0],//float* output,
  threadpool);
  if (status != xnn_status_success) {
    std::cerr << "failed to setup operation #11" << std::endl;
    return ExecutionPlan();
  }

  xnn_operator_t op12 = nullptr;
  status = xnn_create_convolution2d_nchw_f32(
    0 /* top padding */,  0/* right padding */,
    0 /* bottom padding */, 0 /* left padding */,
    1 /* kernel height */, 1 /* kernel width */,
    1 /* subsampling height */, 1 /* subsampling width */,
    1 /* dilation_height */, 1 /* dilation_width */,
    1 /* groups */,
    192 /* input channels per group */,
    384 /* output_channels_per_group */,
    w24, w25,
    0.0f /* output min */, 6.0f /* output max */,
    0 /* flags */,
    &op12);
  if (status != xnn_status_success) {
    std::cerr << "failed to create operation #12" << std::endl;
    return ExecutionPlan();
  }
  operators.emplace_back(op12, xnn_delete_operator);

  status = xnn_setup_convolution2d_nchw_f32(
  op12,
  1,//size_t batch_size,
  14*14*192,//size_t input_batch_stride,
  14*14*384,//size_t output_batch_stride,
  14, //input_height,
  14, //input_width,
  &v14[0],//const float* input,
  &v15[0],//float* output,
  threadpool);
  if (status != xnn_status_success) {
    std::cerr << "failed to setup operation #12" << std::endl;
    return ExecutionPlan();
  }

  xnn_operator_t op13 = nullptr;
  status = xnn_create_convolution2d_nchw_f32(
    0 /* top padding */, 1 /* right padding */,
    1 /* bottom padding */, 0 /* left padding */,
    3 /* kernel height */, 3 /* kernel width */,
    1 /* subsampling height */, 1 /* subsampling width */,
    1 /* dilation_height */, 1 /* dilation_width */,
    384 /* groups */,
    1 /* input channels per group */,
    1 /* output_channels_per_group */,
    w26, w27,
    0.0f /* output min */, 6.0f /* output max */,
    0 /* flags */,
    &op13);

  if (status != xnn_status_success) {
    std::cerr << "failed to create operation #13" << std::endl;
    return ExecutionPlan();
  }
  operators.emplace_back(op13, xnn_delete_operator);
  status = xnn_setup_convolution2d_nchw_f32(
  op13,
  1,//size_t batch_size,
  14*14*384,//size_t input_batch_stride,
  14*14*384,//size_t output_batch_stride,
  14, //input_height,
  14, //input_width,
  &v15[0],//const float* input,
  &v16[0],//float* output,
  threadpool);
  if (status != xnn_status_success) {
    std::cerr << "failed to setup operation #13" << std::endl;
    return ExecutionPlan();
  }

  xnn_operator_t op14 = nullptr;
  status = xnn_create_convolution2d_nchw_f32(
    0 /* top padding */,  0/* right padding */,
    0 /* bottom padding */, 0 /* left padding */,
    1 /* kernel height */, 1 /* kernel width */,
    1 /* subsampling height */,  1/* subsampling width */,
    1 /* dilation_height */, 1 /* dilation_width */,
    1 /* groups */,
    384 /* input channels per group */,
    384 /* output_channels_per_group */,
    w28, w29,
    0.0f /* output min */, 6.0f /* output max */,
    0 /* flags */,
    &op14);
  if (status != xnn_status_success) {
    std::cerr << "failed to create operation #14" << std::endl;
    return ExecutionPlan();
  }
  operators.emplace_back(op14, xnn_delete_operator);

  status = xnn_setup_convolution2d_nchw_f32(
  op14,
  1,//size_t batch_size,
  14*14*384,//size_t input_batch_stride,
  14*14*384,//size_t output_batch_stride,
  14, //input_height,
  14, //input_width,
  &v16[0],//const float* input,
  &v17[0],//float* output,
  threadpool);
  if (status != xnn_status_success) {
    std::cerr << "failed to setup operation #14" << std::endl;
    return ExecutionPlan();
  }

  xnn_operator_t op15 = nullptr;
  status = xnn_create_convolution2d_nchw_f32(
    0 /* top padding */, 1 /* right padding */,
    1 /* bottom padding */, 0 /* left padding */,
    3 /* kernel height */, 3 /* kernel width */,
    1 /* subsampling height */, 1 /* subsampling width */,
    1 /* dilation_height */, 1 /* dilation_width */,
    384 /* groups */,
    1 /* input channels per group */,
    1 /* output_channels_per_group */,
    w30, w31,
    0.0f /* output min */, 6.0f /* output max */,
    0 /* flags */,
    &op15);

  if (status != xnn_status_success) {
    std::cerr << "failed to create operation #15" << std::endl;
    return ExecutionPlan();
  }
  operators.emplace_back(op15, xnn_delete_operator);
  status = xnn_setup_convolution2d_nchw_f32(
  op15,
  1,//size_t batch_size,
  14*14*384,//size_t input_batch_stride,
  14*14*384,//size_t output_batch_stride,
  14, //input_height,
  14, //input_width,
  &v17[0],//const float* input,
  &v18[0],//float* output,
  threadpool);
  if (status != xnn_status_success) {
    std::cerr << "failed to setup operation #15" << std::endl;
    return ExecutionPlan();
  }

  xnn_operator_t op16 = nullptr;
  status = xnn_create_convolution2d_nchw_f32(
    0 /* top padding */,  0/* right padding */,
    0 /* bottom padding */, 0 /* left padding */,
    1 /* kernel height */, 1 /* kernel width */,
    1 /* subsampling height */,  1/* subsampling width */,
    1 /* dilation_height */, 1 /* dilation_width */,
    1 /* groups */,
    384 /* input channels per group */,
    384 /* output_channels_per_group */,
    w32, w33,
    0.0f /* output min */, 6.0f /* output max */,
    0 /* flags */,
    &op16);
  if (status != xnn_status_success) {
    std::cerr << "failed to create operation #16" << std::endl;
    return ExecutionPlan();
  }
  operators.emplace_back(op16, xnn_delete_operator);

  status = xnn_setup_convolution2d_nchw_f32(
  op16,
  1,//size_t batch_size,
  14*14*384,//size_t input_batch_stride,
  14*14*384,//size_t output_batch_stride,
  14, //input_height,
  14, //input_width,
  &v18[0],//const float* input,
  &v19[0],//float* output,
  threadpool);
  if (status != xnn_status_success) {
    std::cerr << "failed to setup operation #16" << std::endl;
    return ExecutionPlan();
  }

  xnn_operator_t op17 = nullptr;
  status = xnn_create_convolution2d_nchw_f32(
    0 /* top padding */, 1 /* right padding */,
    1 /* bottom padding */, 0 /* left padding */,
    3 /* kernel height */, 3 /* kernel width */,
    1 /* subsampling height */, 1 /* subsampling width */,
    1 /* dilation_height */, 1 /* dilation_width */,
    384 /* groups */,
    1 /* input channels per group */,
    1 /* output_channels_per_group */,
    w34, w35,
    0.0f /* output min */, 6.0f /* output max */,
    0 /* flags */,
    &op17);

  if (status != xnn_status_success) {
    std::cerr << "failed to create operation #17" << std::endl;
    return ExecutionPlan();
  }
  operators.emplace_back(op17, xnn_delete_operator);
  status = xnn_setup_convolution2d_nchw_f32(
  op17,
  1,//size_t batch_size,
  14*14*384,//size_t input_batch_stride,
  14*14*384,//size_t output_batch_stride,
  14, //input_height,
  14, //input_width,
  &v19[0],//const float* input,
  &v20[0],//float* output,
  threadpool);
  if (status != xnn_status_success) {
    std::cerr << "failed to setup operation #17" << std::endl;
    return ExecutionPlan();
  }

  xnn_operator_t op18 = nullptr;
  status = xnn_create_convolution2d_nchw_f32(
    0 /* top padding */, 0 /* right padding */,
    0 /* bottom padding */, 0 /* left padding */,
    1 /* kernel height */, 1 /* kernel width */,
    1 /* subsampling height */, 1 /* subsampling width */,
    1 /* dilation_height */, 1 /* dilation_width */,
    1 /* groups */,
    384 /* input channels per group */,
    384 /* output_channels_per_group */,
    w36, w37,
    0.0f /* output min */, 6.0f /* output max */,
    0 /* flags */,
    &op18);

  if (status != xnn_status_success) {
    std::cerr << "failed to create operation #18" << std::endl;
    return ExecutionPlan();
  }
  operators.emplace_back(op18, xnn_delete_operator);
  status = xnn_setup_convolution2d_nchw_f32(
  op18,
  1,//size_t batch_size,
  14*14*384,//size_t input_batch_stride,
  14*14*384,//size_t output_batch_stride,
  14, //input_height,
  14, //input_width,
  &v20[0],//const float* input,
  &v21[0],//float* output,
  threadpool);
  if (status != xnn_status_success) {
    std::cerr << "failed to setup operation #18" << std::endl;
    return ExecutionPlan();
  }

  xnn_operator_t op19 = nullptr;
  status = xnn_create_convolution2d_nchw_f32(
    1 /* top padding */, 1 /* right padding */,
    1 /* bottom padding */, 1 /* left padding */,
    3 /* kernel height */, 3 /* kernel width */,
    1 /* subsampling height */, 1 /* subsampling width */,
    1 /* dilation_height */, 1 /* dilation_width */,
    384 /* groups */,
    1 /* input channels per group */,
    1 /* output_channels_per_group */,
    w38, w39,
    0.0f /* output min */, 6.0f /* output max */,
    0 /* flags */,
    &op19);

  if (status != xnn_status_success) {
    std::cerr << "failed to create operation #19" << std::endl;
    return ExecutionPlan();
  }
  operators.emplace_back(op19, xnn_delete_operator);
  status = xnn_setup_convolution2d_nchw_f32(
  op19,
  1,//size_t batch_size,
  14*14*384,//size_t input_batch_stride,
  14*14*384,//size_t output_batch_stride,
  14, //input_height,
  14, //input_width,
  &v21[0],//const float* input,
  &v22[0],//float* output,
  threadpool);
  if (status != xnn_status_success) {
    std::cerr << "failed to setup operation #19" << std::endl;
    return ExecutionPlan();
  }

  xnn_operator_t op20 = nullptr;
  status = xnn_create_convolution2d_nchw_f32(
    0 /* top padding */, 0 /* right padding */,
    0 /* bottom padding */, 0 /* left padding */,
    1 /* kernel height */, 1 /* kernel width */,
    1 /* subsampling height */, 1 /* subsampling width */,
    1 /* dilation_height */, 1 /* dilation_width */,
    1 /* groups */,
    384 /* input channels per group */,
    384 /* output_channels_per_group */,
    w40, w41,
    0.0f /* output min */, 6.0f /* output max */,
    0 /* flags */,
    &op20);

  if (status != xnn_status_success) {
    std::cerr << "failed to create operation #20" << std::endl;
    return ExecutionPlan();
  }
  operators.emplace_back(op20, xnn_delete_operator);
  status = xnn_setup_convolution2d_nchw_f32(
  op20,
  1,//size_t batch_size,
  14*14*384,//size_t input_batch_stride,
  14*14*384,//size_t output_batch_stride,
  14, //input_height,
  14, //input_width,
  &v22[0],//const float* input,
  &v23[0],//float* output,
  threadpool);
  if (status != xnn_status_success) {
    std::cerr << "failed to setup operation #20" << std::endl;
    return ExecutionPlan();
  }

  xnn_operator_t op21 = nullptr;
  status = xnn_create_convolution2d_nchw_f32(
    1 /* top padding */, 1 /* right padding */,
    1 /* bottom padding */, 1 /* left padding */,
    3 /* kernel height */, 3 /* kernel width */,
    1 /* subsampling height */, 1 /* subsampling width */,
    1 /* dilation_height */, 1 /* dilation_width */,
    384 /* groups */,
    1 /* input channels per group */,
    1 /* output_channels_per_group */,
    w42, w43,
    0.0f /* output min */, 6.0f /* output max */,
    0 /* flags */,
    &op21);

  if (status != xnn_status_success) {
    std::cerr << "failed to create operation #21" << std::endl;
    return ExecutionPlan();
  }
  operators.emplace_back(op21, xnn_delete_operator);
  status = xnn_setup_convolution2d_nchw_f32(
  op21,
  1,//size_t batch_size,
  14*14*384,//size_t input_batch_stride,
  14*14*384,//size_t output_batch_stride,
  14, //input_height,
  14, //input_width,
  &v23[0],//const float* input,
  &v24[0],//float* output,
  threadpool);
  if (status != xnn_status_success) {
    std::cerr << "failed to setup operation #21" << std::endl;
    return ExecutionPlan();
  }

  xnn_operator_t op22 = nullptr;
  status = xnn_create_convolution2d_nchw_f32(
    0 /* top padding */, 0 /* right padding */,
    0 /* bottom padding */, 0 /* left padding */,
    1 /* kernel height */, 1 /* kernel width */,
    1 /* subsampling height */, 1 /* subsampling width */,
    1 /* dilation_height */, 1 /* dilation_width */,
    1 /* groups */,
    384 /* input channels per group */,
    384 /* output_channels_per_group */,
    w44, w45,
    0.0f /* output min */, 6.0f /* output max */,
    0 /* flags */,
    &op22);

  if (status != xnn_status_success) {
    std::cerr << "failed to create operation #22" << std::endl;
    return ExecutionPlan();
  }
  operators.emplace_back(op22, xnn_delete_operator);
  status = xnn_setup_convolution2d_nchw_f32(
  op22,
  1,//size_t batch_size,
  14*14*384,//size_t input_batch_stride,
  14*14*384,//size_t output_batch_stride,
  14, //input_height,
  14, //input_width,
  &v24[0],//const float* input,
  &v25[0],//float* output,
  threadpool);
  if (status != xnn_status_success) {
    std::cerr << "failed to setup operation #22" << std::endl;
    return ExecutionPlan();
  }

  xnn_operator_t op23 = nullptr;
  status = xnn_create_convolution2d_nchw_f32(
    0 /* top padding */, 1 /* right padding */,
    1 /* bottom padding */, 0 /* left padding */,
    3 /* kernel height */, 3 /* kernel width */,
    2 /* subsampling height */, 2 /* subsampling width */,
    1 /* dilation_height */, 1 /* dilation_width */,
    384 /* groups */,
    1 /* input channels per group */,
    1 /* output_channels_per_group */,
    w46, w47,
    0.0f /* output min */, 6.0f /* output max */,
    0 /* flags */,
    &op23);

  if (status != xnn_status_success) {
    std::cerr << "failed to create operation #23" << std::endl;
    return ExecutionPlan();
  }
  operators.emplace_back(op23, xnn_delete_operator);
  status = xnn_setup_convolution2d_nchw_f32(
  op23,
  1,//size_t batch_size,
  14*14*384,//size_t input_batch_stride,
  7*7*384,//size_t output_batch_stride,
  14, //input_height,
  14, //input_width,
  &v25[0],//const float* input,
  &v26[0],//float* output,
  threadpool);
  if (status != xnn_status_success) {
    std::cerr << "failed to setup operation #23" << std::endl;
    return ExecutionPlan();
  }

  xnn_operator_t op24 = nullptr;
  status = xnn_create_convolution2d_nchw_f32(
    0 /* top padding */, 0 /* right padding */,
    0 /* bottom padding */, 0 /* left padding */,
    1 /* kernel height */, 1 /* kernel width */,
    1 /* subsampling height */, 1 /* subsampling width */,
    1 /* dilation_height */, 1 /* dilation_width */,
    1 /* groups */,
    384 /* input channels per group */,
    768 /* output_channels_per_group */,
    w48, w49,
    0.0f /* output min */, 6.0f /* output max */,
    0 /* flags */,
    &op24);

  if (status != xnn_status_success) {
    std::cerr << "failed to create operation #24" << std::endl;
    return ExecutionPlan();
  }
  operators.emplace_back(op24, xnn_delete_operator);
  status = xnn_setup_convolution2d_nchw_f32(
  op24,
  1,//size_t batch_size,
  7*7*384,//size_t input_batch_stride,
  7*7*768,//size_t output_batch_stride,
  7, //input_height,
  7, //input_width,
  &v26[0],//const float* input,
  &v27[0],//float* output,
  threadpool);
  if (status != xnn_status_success) {
    std::cerr << "failed to setup operation #24" << std::endl;
    return ExecutionPlan();
  }

  xnn_operator_t op25 = nullptr;
  status = xnn_create_convolution2d_nchw_f32(
    1 /* top padding */, 1 /* right padding */,
    1 /* bottom padding */, 1 /* left padding */,
    3 /* kernel height */, 3 /* kernel width */,
    1 /* subsampling height */, 1 /* subsampling width */,
    1 /* dilation_height */, 1 /* dilation_width */,
    768 /* groups */,
    1 /* input channels per group */,
    1 /* output_channels_per_group */,
    w50, w51,
    0.0f /* output min */, 6.0f /* output max */,
    0 /* flags */,
    &op25);

  if (status != xnn_status_success) {
    std::cerr << "failed to create operation #25" << std::endl;
    return ExecutionPlan();
  }
  operators.emplace_back(op25, xnn_delete_operator);
  status = xnn_setup_convolution2d_nchw_f32(
  op25,
  1,//size_t batch_size,
  7*7*768,//size_t input_batch_stride,
  7*7*768,//size_t output_batch_stride,
  7, //input_height,
  7, //input_width,
  &v27[0],//const float* input,
  &v28[0],//float* output,
  threadpool);
  if (status != xnn_status_success) {
    std::cerr << "failed to setup operation #25" << std::endl;
    return ExecutionPlan();
  }

  xnn_operator_t op26 = nullptr;
  status = xnn_create_convolution2d_nchw_f32(
    0 /* top padding */, 0 /* right padding */,
    0 /* bottom padding */, 0 /* left padding */,
    1 /* kernel height */, 1 /* kernel width */,
    1 /* subsampling height */, 1 /* subsampling width */,
    1 /* dilation_height */, 1 /* dilation_width */,
    1 /* groups */,
    768 /* input channels per group */,
    768 /* output_channels_per_group */,
    w52, w53,
    0.0f /* output min */, 6.0f /* output max */,
    0 /* flags */,
    &op26);

  if (status != xnn_status_success) {
    std::cerr << "failed to create operation #26" << std::endl;
    return ExecutionPlan();
  }
  operators.emplace_back(op26, xnn_delete_operator);
  status = xnn_setup_convolution2d_nchw_f32(
  op26,
  1,//size_t batch_size,
  7*7*768,//size_t input_batch_stride,
  49*49*768,//size_t output_batch_stride,
  7, //input_height,
  7, //input_width,
  &v28[0],//const float* input,
  &v29[0],//float* output,
  threadpool);
  if (status != xnn_status_success) {
    std::cerr << "failed to setup operation #26" << std::endl;
    return ExecutionPlan();
  }

  xnn_operator_t op27 = nullptr;
  status = xnn_create_global_average_pooling_ncw_f32(
    768 /* channels */,
    -std::numeric_limits<float>::infinity(), std::numeric_limits<float>::infinity(),
    0 /* flags */,
    &op27);
  if (status != xnn_status_success) {
    std::cerr << "failed to create operation #27" << std::endl;
    return ExecutionPlan();
  }
  operators.emplace_back(op27, xnn_delete_operator);
  status = xnn_setup_global_average_pooling_ncw_f32(
    op27,
    1 /* batch size */, 49 /* width */,
    &v29[0] /* input */, &v30[0] /* output */,
    threadpool /* threadpool */);
  if (status != xnn_status_success) {
    std::cerr << "failed to setup operation #27" << std::endl;
    return ExecutionPlan();
  }

  xnn_operator_t op28 = nullptr;
  status = xnn_create_fully_connected_nc_f32(
  768,//size_t input_channels,
  1000,//size_t output_channels,
  768,//size_t input_stride,
  1000,//size_t output_stride,
  w54,//const float* kernel,
  w55,//const float* bias,
  -std::numeric_limits<float>::infinity(), std::numeric_limits<float>::infinity(),
  0,//uint32_t flags,
  &op28);

  if (status != xnn_status_success) {
    std::cerr << "failed to create operation #28" << std::endl;
    return ExecutionPlan();
  }
  operators.emplace_back(op28, xnn_delete_operator);
  status = xnn_setup_fully_connected_nc_f32(
  op28,
  1,//size_t batch_size,
  &v30[0],//const float* input,
  &v31[0],//float* output,
  threadpool);
  if (status != xnn_status_success) {
    std::cerr << "failed to setup operation #28" << std::endl;
    return ExecutionPlan();
  }
  
  #pragma clang diagnostic push
  #pragma clang diagnostic ignored "-Wpessimizing-move"
  return operators;
  #pragma clang diagnostic pop
}

}  // namespace models
