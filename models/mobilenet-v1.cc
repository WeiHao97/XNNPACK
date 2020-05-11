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
  alignas(16) static float v3[306432];
  alignas(16) static float v4[306432];

  alignas(16) static float w0[648];
  alignas(16) static float w1[24];
  alignas(16) static float w2[216];
  alignas(16) static float w3[24];


  std::random_device random_device;
  auto rng = std::mt19937(random_device());
  std::bernoulli_distribution random_bool_generator(0.1);//Probability of 1's
  auto f32rng = std::bind(random_bool_generator, rng);
  std::generate(v2, v2 + 150528, std::ref(f32rng));
  std::generate(v3+301056, v3 + 306432, std::ref(f32rng));
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

  #pragma clang diagnostic push
  #pragma clang diagnostic ignored "-Wpessimizing-move"
  return operators;
  #pragma clang diagnostic pop
}

}  // namespace models
