// Copyright 2019 Google LLC
//
// This source code is licensed under the BSD-style license found in the
// LICENSE file in the root directory of this source tree.

#include <xnnpack.h>

#include <algorithm>
#include <functional>
#include <iostream>
#include <fstream>
#include <limits>
#include <random>
#include <string>
#include <chrono> 
#include "models/models.h"

using namespace std;
using namespace std::chrono; 

int main (int argc, char *argv[]){

    if(argc != 4){
        cout<< "Usage:"<< endl;
        cout<< "Sparsity: 0-100"<< endl;
        cout<< "Bias: on:1, off:0"<< endl;
        cout<< "Mode: spmm:1, gemm:0"<< endl;
        return -1;
    }
  alignas(16) static float v2[150528];
  alignas(16) static float v3[301056];
  alignas(16) static float v4[301056];
  alignas(16) static float v5[602112];
  alignas(16) static float v6[150528];
  alignas(16) static float v7[301056];
  alignas(16) static float v8[301056];
  alignas(16) static float v9[301056];
  alignas(16) static float v10[75264];
  alignas(16) static float v11[150528];
  alignas(16) static float v12[150528];
  alignas(16) static float v13[150528];
  alignas(16) static float v14[37632];
  alignas(16) static float v15[75264];
  alignas(16) static float v16[75264];
  alignas(16) static float v17[75264];
  alignas(16) static float v18[75264];
  alignas(16) static float v19[75264];
  alignas(16) static float v20[75264];
  alignas(16) static float v21[75264];
  alignas(16) static float v22[75264];
  alignas(16) static float v23[75264];
  alignas(16) static float v24[75264];
  alignas(16) static float v25[75264];
  alignas(16) static float v26[18816];
  alignas(16) static float v27[37632];
  alignas(16) static float v28[37632];
  alignas(16) static float v29[37632];
  alignas(16) static float v30[768];
  alignas(16) static float v31[1000];
  alignas(16) static float w0[648];
  alignas(16) static float w1[24];
  alignas(16) static float w2[216];
  alignas(16) static float w3[24];
  alignas(16) static float w4[1152];
  alignas(16) static float w5[48];
  alignas(16) static float w6[432];
  alignas(16) static float w7[48];
  alignas(16) static float w8[4608];
  alignas(16) static float w9[96];
  alignas(16) static float w10[864];
  alignas(16) static float w11[96];
  alignas(16) static float w12[9216];
  alignas(16) static float w13[96];
  alignas(16) static float w14[864];
  alignas(16) static float w15[96];
  alignas(16) static float w16[18432];
  alignas(16) static float w17[192];
  alignas(16) static float w18[1728];
  alignas(16) static float w19[192];
  alignas(16) static float w20[36864];
  alignas(16) static float w21[192];
  alignas(16) static float w22[1728];
  alignas(16) static float w23[192];
  alignas(16) static float w24[147456];
  alignas(16) static float w25[384];
  alignas(16) static float w26[3456];
  alignas(16) static float w27[384];
  alignas(16) static float w28[147456];
  alignas(16) static float w29[384];
  alignas(16) static float w30[3456];
  alignas(16) static float w31[384];
  alignas(16) static float w32[147456];
  alignas(16) static float w33[384];
  alignas(16) static float w34[3456];
  alignas(16) static float w35[384];
  alignas(16) static float w36[147456];
  alignas(16) static float w37[384];
  alignas(16) static float w38[3456];
  alignas(16) static float w39[384];
  alignas(16) static float w40[147456];
  alignas(16) static float w41[384];
  alignas(16) static float w42[3456];
  alignas(16) static float w43[384];
  alignas(16) static float w44[147456];
  alignas(16) static float w45[384];
  alignas(16) static float w46[3456];
  alignas(16) static float w47[384];
  alignas(16) static float w48[294912];
  alignas(16) static float w49[768];
  alignas(16) static float w50[6912];
  alignas(16) static float w51[768];
  alignas(16) static float w52[589824];
  alignas(16) static float w53[768];
  alignas(16) static float w54[768000];
  alignas(16) static float w55[1000];


/*
  std::random_device random_device;
  auto rng = std::mt19937(random_device());
  float Sparsity = 1- std::stof(argv[1])/100;
  std::bernoulli_distribution random_bool_generator(Sparsity);// 0.1 => 90% sparse
  std::bernoulli_distribution random_bool_generator_bias(0.9);
  auto f32rng = std::bind(random_bool_generator, rng);
  auto f32rng_bias = std::bind(random_bool_generator_bias, rng);*/
  float Sparsity = 1- stof(argv[1])/100;
  bernoulli_distribution random_bool_generator(Sparsity);// 0.1 => 90% sparse
  bernoulli_distribution random_bool_generator_bias(0.9);
  default_random_engine generator (1);
  auto f32rng = bind(random_bool_generator, generator );
  auto f32rng_bias = bind(random_bool_generator_bias, generator );
  ifstream inputFile("/users/Wei_Hao/XNNPACK/sparse_224.data");

  // test file open
  int size = 0; 
  //int z_count = 0;
  string s;   
  if (inputFile) {        
    while (getline(inputFile, s))
    {
        v2[size] = stof(s);
        //if(v2[size] == 0) z_count++;
        size++;
    }

  }else{
        cout<< "Can't open file"<< endl;
  }
  inputFile.close();
  //std::cout<< "Size: " << size << " Sparsity: "<< (float)z_count/150528 <<"\n";
  //std::generate(v2, v2 + 150528, std::ref(f32rng));
  generate(w0, w0 + 648, ref(f32rng));
  generate(w2, w2 + 216, ref(f32rng));
  generate(w4, w4 + 1152, ref(f32rng));
  generate(w6, w6 + 432, ref(f32rng));
  generate(w8, w8 + 4608, ref(f32rng));
  generate(w10, w10 + 864, ref(f32rng));
  generate(w12, w12 + 9216, ref(f32rng));
  generate(w14, w14 + 864, ref(f32rng));
  generate(w16, w16 + 18432, ref(f32rng));
  generate(w18, w18 + 1728, ref(f32rng));
  generate(w20, w20 + 36864, ref(f32rng));
  generate(w22, w22 + 1728, ref(f32rng));
  generate(w24, w24 + 147456, ref(f32rng));
  generate(w26, w26 + 3456, ref(f32rng));
  generate(w28, w28 + 147456, ref(f32rng));
  generate(w30, w30 + 3456, ref(f32rng));
  generate(w32, w32 + 147456, ref(f32rng));
  generate(w34, w34 + 3456, ref(f32rng));
  generate(w36, w36 + 147456, ref(f32rng));
  generate(w38, w38 + 3456, ref(f32rng));
  generate(w40, w40 + 147456, ref(f32rng));
  generate(w42, w42 + 3456, ref(f32rng));
  generate(w44, w44 + 147456, ref(f32rng));
  generate(w46, w46 + 3456, ref(f32rng));
  generate(w48, w48 + 29412, ref(f32rng));
  generate(w50, w50 + 6912, ref(f32rng));
  generate(w52, w52 + 589824, ref(f32rng));
  generate(w54, w54 + 768000, ref(f32rng));
  generate(w55, w55 + 1000, ref(f32rng));

  // first channel all ones
  fill(w0, w0 + 27, 1.0f);
  fill(w2, w2 + 216, 1.0f);
  fill(w4, w4 + 24, 1.0f);
  fill(w6, w6 + 432, 1.0f);
  fill(w8, w8 + 48, 1.0f);
  fill(w10, w10 + 864, 1.0f);
  fill(w12, w12 + 96, 1.0f);
  fill(w14, w14 + 864, 1.0f);
  fill(w16, w16 + 96, 1.0f);
  fill(w18, w18 + 1728, 1.0f);
  fill(w20, w20 + 192, 1.0f);
  fill(w22, w22 + 1728, 1.0f);
  fill(w24, w24 + 192, 1.0f);
  fill(w26, w26 + 3456, 1.0f);
  fill(w28, w28 + 384, 1.0f);
  fill(w30, w30 + 3456, 1.0f);
  fill(w32, w32 + 384, 1.0f);
  fill(w34, w34 + 3456, 1.0f);
  fill(w36, w36 + 384, 1.0f);
  fill(w38, w38 + 3456, 1.0f);
  fill(w40, w40 + 384, 1.0f);
  fill(w42, w42 + 3456, 1.0f);
  fill(w44, w44 + 384, 1.0f);
  fill(w46, w46 + 3456, 1.0f);
  fill(w48, w48 + 384, 1.0f);
  fill(w50, w50 + 6912, 1.0f);
  fill(w52, w52 + 768, 1.0f);


if(stoi(argv[2]) == 1){
  cout << "Bias on" << endl;
  generate(w1, w1 + 24, ref(f32rng_bias));
  generate(w3, w3 + 24, ref(f32rng_bias));
  generate(w5, w5 + 48, ref(f32rng_bias));
  generate(w7, w7 + 48, ref(f32rng_bias));
  generate(w9, w9 + 96, ref(f32rng_bias));
  generate(w11, w11 + 96, ref(f32rng_bias));
  generate(w13, w13 + 96, ref(f32rng_bias));
  generate(w15, w15 + 96, ref(f32rng_bias));
  generate(w17, w17 + 192, ref(f32rng_bias));
  generate(w19, w19 + 192, ref(f32rng_bias));
  generate(w21, w21 + 192, ref(f32rng_bias));
  generate(w23, w23 + 192, ref(f32rng_bias));
  generate(w25, w25 + 384, ref(f32rng_bias));
  generate(w27, w27 + 384, ref(f32rng_bias));
  generate(w29, w29 + 384, ref(f32rng_bias));
  generate(w31, w31 + 384, ref(f32rng_bias));
  generate(w33, w33 + 384, ref(f32rng_bias));
  generate(w35, w35 + 384, ref(f32rng_bias));
  generate(w37, w37 + 384, ref(f32rng_bias));
  generate(w39, w39 + 384, ref(f32rng_bias));
  generate(w41, w41 + 384, ref(f32rng_bias));
  generate(w43, w43 + 384, ref(f32rng_bias));
  generate(w45, w45 + 384, ref(f32rng_bias));
  generate(w47, w47 + 384, ref(f32rng_bias));
  generate(w49, w49 + 768, ref(f32rng_bias));
  generate(w51, w51 + 768, ref(f32rng_bias));
  generate(w53, w53 + 768, ref(f32rng_bias));
  }else{
    cout << "Bias off" << endl;
  }

  if (xnn_initialize(nullptr /* allocator */) != xnn_status_success) {
    cerr << "failed to initialize XNNPACK" << endl;
    return -1;
  }
  models::ExecutionPlan operators;
  xnn_status status;
  const size_t num_threads = 1;
  unique_ptr<pthreadpool, decltype(&pthreadpool_destroy)> threadpool(
    pthreadpool_create(num_threads), pthreadpool_destroy);


if(stoi(argv[3]) == 1){

  cout << "Using spmm" << endl;
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
    cerr << "failed to create operation #0" << endl;
    return -1;
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
  threadpool.get());
  if (status != xnn_status_success) {
    cerr << "failed to setup operation #0" << endl;
    return -1;
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
    cerr << "failed to create operation #1" << endl;
    return -1;
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
  threadpool.get());

  if (status != xnn_status_success) {
    cerr << "failed to setup operation #1" << endl;
    return -1;
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
    cerr << "failed to create operation #2" << endl;
    return -1;
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
  threadpool.get());

  if (status != xnn_status_success) {
    cerr << "failed to setup operation #2" << endl;
    return -1;
  }

  xnn_operator_t op3 = nullptr;
  status = xnn_create_convolution2d_nchw_f32(
    0 /* top padding */, 1 /* right padding */,
    1 /* bottom padding */, 1 /* left padding */,
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
    cerr << "failed to create operation #3" << endl;
    return -1;
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
  threadpool.get());
  if (status != xnn_status_success) {
    cerr << "failed to setup operation #3" << endl;
    return -1;
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
    cerr << "failed to create operation #4" << endl;
    return -1;
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
  threadpool.get());
  if (status != xnn_status_success) {
    cerr << "failed to setup operation #4" << endl;
    return -1;
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
    cerr << "failed to create operation #5" << endl;
    return -1;
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
  threadpool.get());
  if (status != xnn_status_success) {
    cerr << "failed to setup operation #5" << endl;
    return -1;
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
    cerr << "failed to create operation #6" << endl;
    return -1;
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
  threadpool.get());
  if (status != xnn_status_success) {
    cerr << "failed to setup operation #6" << endl;
    return -1;
  }

  xnn_operator_t op7 = nullptr;
  status = xnn_create_convolution2d_nchw_f32(
    0 /* top padding */, 1 /* right padding */,
    1 /* bottom padding */, 1 /* left padding */,
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
    cerr << "failed to create operation #7" << endl;
    return -1;
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
  threadpool.get());
  if (status != xnn_status_success) {
    cerr << "failed to setup operation #7" << endl;
    return -1;
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
    cerr << "failed to create operation #8" << endl;
    return -1;
  }
  operators.emplace_back(op8, xnn_delete_operator);

  status = xnn_setup_convolution2d_nchw_f32(
  op8,
  1,//size_t batch_size,
  28*28*96,//size_t input_batch_stride,
  28*28*192,//size_t output_batch_stride,
  28, //input_height,
  28, //input_width,
  &v10[0],//const float* input,
  &v11[0],//float* output,
  threadpool.get());
  if (status != xnn_status_success) {
    cerr << "failed to setup operation #8" << endl;
    return -1;
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
    cerr << "failed to create operation #9" << endl;
    return -1;
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
  threadpool.get());
  if (status != xnn_status_success) {
    cerr << "failed to setup operation #9" << endl;
    return -1;
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
    cerr << "failed to create operation #10" << endl;
    return -1;
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
  threadpool.get());
  if (status != xnn_status_success) {
    cerr << "failed to setup operation #10" << endl;
    return -1;
  }

  xnn_operator_t op11 = nullptr;
  status = xnn_create_convolution2d_nchw_f32(
    0 /* top padding */, 1 /* right padding */,
    1 /* bottom padding */, 1 /* left padding */,
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
    cerr << "failed to create operation #11" << endl;
    return -1;
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
  threadpool.get());
  if (status != xnn_status_success) {
    cerr << "failed to setup operation #11" << endl;
    return -1;
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
    cerr << "failed to create operation #12" << endl;
    return -1;
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
  threadpool.get());
  if (status != xnn_status_success) {
    cerr << "failed to setup operation #12" << endl;
    return -1;
  }

  xnn_operator_t op13 = nullptr;
  status = xnn_create_convolution2d_nchw_f32(
    1 /* top padding */, 1 /* right padding */,
    1 /* bottom padding */, 1 /* left padding */,
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
    cerr << "failed to create operation #13" << endl;
    return -1;
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
  threadpool.get());
  if (status != xnn_status_success) {
    cerr << "failed to setup operation #13" << endl;
    return -1;
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
    cerr << "failed to create operation #14" << endl;
    return -1;
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
  threadpool.get());
  if (status != xnn_status_success) {
    cerr << "failed to setup operation #14" << endl;
    return -1;
  }

  xnn_operator_t op15 = nullptr;
  status = xnn_create_convolution2d_nchw_f32(
    1 /* top padding */, 1 /* right padding */,
    1 /* bottom padding */, 1 /* left padding */,
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
    cerr << "failed to create operation #15" << endl;
    return -1;
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
  threadpool.get());
  if (status != xnn_status_success) {
    cerr << "failed to setup operation #15" << endl;
    return -1;
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
    cerr << "failed to create operation #16" << endl;
    return -1;
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
  threadpool.get());
  if (status != xnn_status_success) {
    cerr << "failed to setup operation #16" << endl;
    return -1;
  }

  xnn_operator_t op17 = nullptr;
  status = xnn_create_convolution2d_nchw_f32(
    1 /* top padding */, 1 /* right padding */,
    1 /* bottom padding */, 1 /* left padding */,
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
    cerr << "failed to create operation #17" << endl;
    return -1;
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
  threadpool.get());
  if (status != xnn_status_success) {
    cerr << "failed to setup operation #17" << endl;
    return -1;
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
    cerr << "failed to create operation #18" << endl;
    return -1;
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
  threadpool.get());
  if (status != xnn_status_success) {
    cerr << "failed to setup operation #18" << endl;
    return -1;
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
    cerr << "failed to create operation #19" << endl;
    return -1;
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
  threadpool.get());
  if (status != xnn_status_success) {
    cerr << "failed to setup operation #19" << endl;
    return -1;
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
    cerr << "failed to create operation #20" << endl;
    return -1;
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
  threadpool.get());
  if (status != xnn_status_success) {
    cerr << "failed to setup operation #20" << endl;
    return -1;
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
    cerr << "failed to create operation #21" << endl;
    return -1;
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
  threadpool.get());
  if (status != xnn_status_success) {
    cerr << "failed to setup operation #21" << endl;
    return -1;
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
    cerr << "failed to create operation #22" << endl;
    return -1;
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
  threadpool.get());
  if (status != xnn_status_success) {
    cerr << "failed to setup operation #22" << endl;
    return -1;
  }

  xnn_operator_t op23 = nullptr;
  status = xnn_create_convolution2d_nchw_f32(
    0 /* top padding */, 1 /* right padding */,
    1 /* bottom padding */, 1 /* left padding */,
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
    cerr << "failed to create operation #23" << endl;
    return -1;
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
  threadpool.get());
  if (status != xnn_status_success) {
    cerr << "failed to setup operation #23" << endl;
    return -1;
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
    cerr << "failed to create operation #24" << endl;
    return -1;
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
  threadpool.get());
  if (status != xnn_status_success) {
    cerr << "failed to setup operation #24" << endl;
    return -1;
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
    cerr << "failed to create operation #25" << endl;
    return -1;
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
  threadpool.get());
  if (status != xnn_status_success) {
    cerr << "failed to setup operation #25" << endl;
    return -1;
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
    cerr << "failed to create operation #26" << endl;
    return -1;
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
  threadpool.get());
  if (status != xnn_status_success) {
    cerr << "failed to setup operation #26" << endl;
    return -1;
  }

  xnn_operator_t op27 = nullptr;
  status = xnn_create_global_average_pooling_ncw_f32(
    768 /* channels */,
    -numeric_limits<float>::infinity(), numeric_limits<float>::infinity(),
    0 /* flags */,
    &op27);
  if (status != xnn_status_success) {
    cerr << "failed to create operation #27" << endl;
    return -1;
  }
  operators.emplace_back(op27, xnn_delete_operator);
  status = xnn_setup_global_average_pooling_ncw_f32(
    op27,
    1 /* batch size */, 49 /* width */,
    &v29[0] /* input */, &v30[0] /* output */,
    threadpool.get() /* threadpool.get() */);
  if (status != xnn_status_success) {
    cerr << "failed to setup operation #27" << endl;
    return -1;
  }

  xnn_operator_t op28 = nullptr;
  status = xnn_create_fully_connected_nc_f32(
  768,//size_t input_channels,
  1000,//size_t output_channels,
  768,//size_t input_stride,
  1000,//size_t output_stride,
  w54,//const float* kernel,
  w55,//const float* bias,
  -numeric_limits<float>::infinity(), numeric_limits<float>::infinity(),
  0,//uint32_t flags,
  &op28);

  if (status != xnn_status_success) {
    cerr << "failed to create operation #28" << endl;
    return -1;
  }
  operators.emplace_back(op28, xnn_delete_operator);
  status = xnn_setup_fully_connected_nc_f32(
  op28,
  1,//size_t batch_size,
  &v30[0],//const float* input,
  &v31[0],//float* output,
  threadpool.get());
  if (status != xnn_status_success) {
    cerr << "failed to setup operation #28" << endl;
    return -1;
  }
}else{

  cout << "Using gemm" << endl;

  xnn_operator_t op0 = nullptr;
  status = xnn_create_convolution2d_nhwc_f32(
    0 /* top padding */, 1 /* right padding */,
    1 /* bottom padding */, 0 /* left padding */,
    3 /* kernel height */, 3 /* kernel width */,
    2 /* subsampling height */, 2 /* subsampling width */,
    1 /* dilation_height */, 1 /* dilation_width */,
    1 /* groups */,
    3 /* input channels per group */,
    24 /* output_channels_per_group */,
    3 /* input pixel stride */,
    24 /* output pixel stride */,
    w0, w1,
    0.0f /* output min */, 6.0f /* output max */,
    0 /* flags */,
    &op0);
  if (status != xnn_status_success) {
    cerr << "failed to create operation #0" << endl;
    return -1;
  }
  operators.emplace_back(op0, xnn_delete_operator);

  status = xnn_setup_convolution2d_nhwc_f32(
    op0,
    1 /* batch size */, 224 /* input height */, 224 /* input width */,
    &v2[0] /* input */, &v3[0] /* output */,
    threadpool.get());
  if (status != xnn_status_success) {
    cerr << "failed to setup operation #0" << endl;
    return -1;
  }

  xnn_operator_t op1 = nullptr;
  status = xnn_create_convolution2d_nhwc_f32(
    1 /* top padding */, 1 /* right padding */,
    1 /* bottom padding */, 1 /* left padding */,
    3 /* kernel height */, 3 /* kernel width */,
    1 /* subsampling height */, 1 /* subsampling width */,
    1 /* dilation_height */, 1 /* dilation_width */,
    24 /* groups */,
    1 /* input channels per group */,
    1 /* output_channels_per_group */,
    24 /* input pixel stride */,
    24 /* output pixel stride */,
    w2, w3,
    0.0f /* output min */, 6.0f /* output max */,
    0 /* flags */,
    &op1);

  if (status != xnn_status_success) {
    cerr << "failed to create operation #1" << endl;
    return -1;
  }
  operators.emplace_back(op1, xnn_delete_operator);
  status = xnn_setup_convolution2d_nhwc_f32(
    op1,
    1 /* batch size */, 112 /* input height */, 112 /* input width */,
    &v3[0] /* input */, &v4[0] /* output */,
    threadpool.get());
  if (status != xnn_status_success) {
    cerr << "failed to setup operation #1" << endl;
    return -1;
  }

  xnn_operator_t op2 = nullptr;
  status = xnn_create_convolution2d_nhwc_f32(
    0 /* top padding */, 0 /* right padding */,
    0 /* bottom padding */, 0 /* left padding */,
    1 /* kernel height */, 1 /* kernel width */,
    1 /* subsampling height */, 1 /* subsampling width */,
    1 /* dilation_height */, 1 /* dilation_width */,
    1 /* groups */,
    24 /* input channels per group */,
    48 /* output_channels_per_group */,
    24 /* input pixel stride */,
    48 /* output pixel stride */,
    w4, w5,
    0.0f /* output min */, 6.0f /* output max */,
    0 /* flags */,
    &op2);
  if (status != xnn_status_success) {
    cerr << "failed to create operation #2" << endl;
    return -1;
  }
  operators.emplace_back(op2, xnn_delete_operator);

  status = xnn_setup_convolution2d_nhwc_f32(
    op2,
    1 /* batch size */, 112 /* input height */, 112 /* input width */,
    &v4[0] /* input */, &v5[0] /* output */,
    threadpool.get());
  if (status != xnn_status_success) {
    cerr << "failed to setup operation #2" << endl;
    return -1;
  }

  xnn_operator_t op3 = nullptr;
  status = xnn_create_convolution2d_nhwc_f32(
    0 /* top padding */, 1 /* right padding */,
    1 /* bottom padding */, 0 /* left padding */,
    3 /* kernel height */, 3 /* kernel width */,
    2 /* subsampling height */, 2 /* subsampling width */,
    1 /* dilation_height */, 1 /* dilation_width */,
    48 /* groups */,
    1 /* input channels per group */,
    1 /* output_channels_per_group */,
    48 /* input pixel stride */,
    48 /* output pixel stride */,
    w6, w7,
    0.0f /* output min */, 6.0f /* output max */,
    0 /* flags */,
    &op3);

  if (status != xnn_status_success) {
    cerr << "failed to create operation #3" << endl;
    return -1;
  }
  operators.emplace_back(op3, xnn_delete_operator);
  status = xnn_setup_convolution2d_nhwc_f32(
    op3,
    1 /* batch size */, 112 /* input height */, 112 /* input width */,
    &v5[0] /* input */, &v6[0] /* output */,
    threadpool.get());
  if (status != xnn_status_success) {
    cerr << "failed to setup operation #3" << endl;
    return -1;
  }

  xnn_operator_t op4 = nullptr;
  status = xnn_create_convolution2d_nhwc_f32(
    0 /* top padding */, 0 /* right padding */,
    0 /* bottom padding */, 0 /* left padding */,
    1 /* kernel height */, 1 /* kernel width */,
    1 /* subsampling height */, 1 /* subsampling width */,
    1 /* dilation_height */, 1 /* dilation_width */,
    1 /* groups */,
    48 /* input channels per group */,
    96 /* output_channels_per_group */,
    48 /* input pixel stride */,
    96 /* output pixel stride */,
    w8, w9,
    0.0f /* output min */, 6.0f /* output max */,
    0 /* flags */,
    &op4);
  if (status != xnn_status_success) {
    cerr << "failed to create operation #4" << endl;
    return -1;
  }
  operators.emplace_back(op4, xnn_delete_operator);

  status = xnn_setup_convolution2d_nhwc_f32(
    op4,
    1 /* batch size */, 56 /* input height */, 56 /* input width */,
    &v6[0] /* input */, &v7[0] /* output */,
    threadpool.get());
  if (status != xnn_status_success) {
    cerr << "failed to setup operation #4" << endl;
    return -1;
  }

  xnn_operator_t op5 = nullptr;
  status = xnn_create_convolution2d_nhwc_f32(
    1 /* top padding */, 1 /* right padding */,
    1 /* bottom padding */, 1 /* left padding */,
    3 /* kernel height */, 3 /* kernel width */,
    1 /* subsampling height */, 1 /* subsampling width */,
    1 /* dilation_height */, 1 /* dilation_width */,
    96 /* groups */,
    1 /* input channels per group */,
    1 /* output_channels_per_group */,
    96 /* input pixel stride */,
    96 /* output pixel stride */,
    w10, w11,
    0.0f /* output min */, 6.0f /* output max */,
    0 /* flags */,
    &op5);

  if (status != xnn_status_success) {
    cerr << "failed to create operation #5" << endl;
    return -1;
  }
  operators.emplace_back(op5, xnn_delete_operator);
  status = xnn_setup_convolution2d_nhwc_f32(
    op5,
    1 /* batch size */, 56 /* input height */, 56 /* input width */,
    &v7[0] /* input */, &v8[0] /* output */,
    threadpool.get());
  if (status != xnn_status_success) {
    cerr << "failed to setup operation #5" << endl;
    return -1;
  }

  xnn_operator_t op6 = nullptr;
  status = xnn_create_convolution2d_nhwc_f32(
    0 /* top padding */,  0/* right padding */,
    0 /* bottom padding */, 0 /* left padding */,
    1 /* kernel height */, 1 /* kernel width */,
    1 /* subsampling height */, 1 /* subsampling width */,
    1 /* dilation_height */, 1 /* dilation_width */,
    1 /* groups */,
    96 /* input channels per group */,
    96 /* output_channels_per_group */,
    96 /* input pixel stride */,
    96 /* output pixel stride */,
    w12, w13,
    0.0f /* output min */, 6.0f /* output max */,
    0 /* flags */,
    &op6);
  if (status != xnn_status_success) {
    cerr << "failed to create operation #6" << endl;
    return -1;
  }
  operators.emplace_back(op6, xnn_delete_operator);

  status = xnn_setup_convolution2d_nhwc_f32(
    op6,
    1 /* batch size */,  56/* input height */,  56/* input width */,
    &v8[0] /* input */, &v9[0] /* output */,
    threadpool.get());
  if (status != xnn_status_success) {
    cerr << "failed to setup operation #6" << endl;
    return -1;
  }

  xnn_operator_t op7 = nullptr;
  status = xnn_create_convolution2d_nhwc_f32(
    0 /* top padding */, 1 /* right padding */,
    1 /* bottom padding */, 0 /* left padding */,
    3 /* kernel height */, 3 /* kernel width */,
    2 /* subsampling height */, 2 /* subsampling width */,
    1 /* dilation_height */, 1 /* dilation_width */,
    96 /* groups */,
    1 /* input channels per group */,
    1 /* output_channels_per_group */,
    96 /* input pixel stride */,
    96 /* output pixel stride */,
    w14, w15,
    0.0f /* output min */, 6.0f /* output max */,
    0 /* flags */,
    &op7);

  if (status != xnn_status_success) {
    cerr << "failed to create operation #7" << endl;
    return -1;
  }
  operators.emplace_back(op7, xnn_delete_operator);
  status = xnn_setup_convolution2d_nhwc_f32(
    op7,
    1 /* batch size */,  56/* input height */,  56/* input width */,
    &v9[0] /* input */, &v10[0] /* output */,
    threadpool.get());
  if (status != xnn_status_success) {
    cerr << "failed to setup operation #7" << endl;
    return -1;
  }

  xnn_operator_t op8 = nullptr;
  status = xnn_create_convolution2d_nhwc_f32(
    0 /* top padding */, 0 /* right padding */,
    0 /* bottom padding */, 0 /* left padding */,
    1 /* kernel height */, 1 /* kernel width */,
    1 /* subsampling height */, 1 /* subsampling width */,
    1 /* dilation_height */, 1 /* dilation_width */,
    1 /* groups */,
    96 /* input channels per group */,
    192 /* output_channels_per_group */,
    96 /* input pixel stride */,
    192 /* output pixel stride */,
    w16, w17,
    0.0f /* output min */, 6.0f /* output max */,
    0 /* flags */,
    &op8);
  if (status != xnn_status_success) {
    cerr << "failed to create operation #8" << endl;
    return -1;
  }
  operators.emplace_back(op8, xnn_delete_operator);

  status = xnn_setup_convolution2d_nhwc_f32(
    op8,
    1 /* batch size */,  28/* input height */,  28/* input width */,
    &v10[0] /* input */, &v11[0] /* output */,
    threadpool.get());
  if (status != xnn_status_success) {
    cerr << "failed to setup operation #8" << endl;
    return -1;
  }

  xnn_operator_t op9 = nullptr;
  status = xnn_create_convolution2d_nhwc_f32(
    1 /* top padding */, 1 /* right padding */,
    1 /* bottom padding */, 1 /* left padding */,
    3 /* kernel height */, 3 /* kernel width */,
    1 /* subsampling height */, 1 /* subsampling width */,
    1 /* dilation_height */, 1 /* dilation_width */,
    192 /* groups */,
    1 /* input channels per group */,
    1 /* output_channels_per_group */,
    192 /* input pixel stride */,
    192 /* output pixel stride */,
    w18, w19,
    0.0f /* output min */, 6.0f /* output max */,
    0 /* flags */,
    &op9);

  if (status != xnn_status_success) {
    cerr << "failed to create operation #9" << endl;
    return -1;
  }
  operators.emplace_back(op9, xnn_delete_operator);
  status = xnn_setup_convolution2d_nhwc_f32(
    op9,
    1 /* batch size */,  28/* input height */,  28/* input width */,
    &v11[0] /* input */, &v12[0] /* output */,
    threadpool.get());
  if (status != xnn_status_success) {
    cerr << "failed to setup operation #9" << endl;
    return -1;
  }

  xnn_operator_t op10 = nullptr;
  status = xnn_create_convolution2d_nhwc_f32(
    0 /* top padding */,  0/* right padding */,
    0 /* bottom padding */, 0 /* left padding */,
    1 /* kernel height */, 1 /* kernel width */,
    1 /* subsampling height */,  1/* subsampling width */,
    1 /* dilation_height */, 1 /* dilation_width */,
    1 /* groups */,
    192 /* input channels per group */,
    192 /* output_channels_per_group */,
    192 /* input pixel stride */,
    192 /* output pixel stride */,
    w20, w21,
    0.0f /* output min */, 6.0f /* output max */,
    0 /* flags */,
    &op10);
  if (status != xnn_status_success) {
    cerr << "failed to create operation #10" << endl;
    return -1;
  }
  operators.emplace_back(op10, xnn_delete_operator);

  status = xnn_setup_convolution2d_nhwc_f32(
    op10,
    1 /* batch size */,  28/* input height */,  28/* input width */,
    &v12[0] /* input */, &v13[0] /* output */,
    threadpool.get());
  if (status != xnn_status_success) {
    cerr << "failed to setup operation #10" << endl;
    return -1;
  }

  xnn_operator_t op11 = nullptr;
  status = xnn_create_convolution2d_nhwc_f32(
    0 /* top padding */, 1 /* right padding */,
    1 /* bottom padding */, 0 /* left padding */,
    3 /* kernel height */, 3 /* kernel width */,
    2 /* subsampling height */, 2 /* subsampling width */,
    1 /* dilation_height */, 1 /* dilation_width */,
    192 /* groups */,
    1 /* input channels per group */,
    1 /* output_channels_per_group */,
    192 /* input pixel stride */,
    192 /* output pixel stride */,
    w22, w23,
    0.0f /* output min */, 6.0f /* output max */,
    0 /* flags */,
    &op11);

  if (status != xnn_status_success) {
    cerr << "failed to create operation #11" << endl;
    return -1;
  }
  operators.emplace_back(op11, xnn_delete_operator);
  status = xnn_setup_convolution2d_nhwc_f32(
    op11,
    1 /* batch size */,  28/* input height */,  28/* input width */,
    &v13[0] /* input */, &v14[0] /* output */,
    threadpool.get());
  if (status != xnn_status_success) {
    cerr << "failed to setup operation #11" << endl;
    return -1;
  }

  xnn_operator_t op12 = nullptr;
  status = xnn_create_convolution2d_nhwc_f32(
    0 /* top padding */,  0/* right padding */,
    0 /* bottom padding */, 0 /* left padding */,
    1 /* kernel height */, 1 /* kernel width */,
    1 /* subsampling height */, 1 /* subsampling width */,
    1 /* dilation_height */, 1 /* dilation_width */,
    1 /* groups */,
    192 /* input channels per group */,
    384 /* output_channels_per_group */,
    192 /* input pixel stride */,
    384 /* output pixel stride */,
    w24, w25,
    0.0f /* output min */, 6.0f /* output max */,
    0 /* flags */,
    &op12);
  if (status != xnn_status_success) {
    cerr << "failed to create operation #12" << endl;
    return -1;
  }
  operators.emplace_back(op12, xnn_delete_operator);

  status = xnn_setup_convolution2d_nhwc_f32(
    op12,
    1 /* batch size */,  14/* input height */,  14/* input width */,
    &v14[0] /* input */, &v15[0] /* output */,
    threadpool.get());
  if (status != xnn_status_success) {
    cerr << "failed to setup operation #12" << endl;
    return -1;
  }

  xnn_operator_t op13 = nullptr;
  status = xnn_create_convolution2d_nhwc_f32(
    0 /* top padding */, 1 /* right padding */,
    1 /* bottom padding */, 0 /* left padding */,
    3 /* kernel height */, 3 /* kernel width */,
    1 /* subsampling height */, 1 /* subsampling width */,
    1 /* dilation_height */, 1 /* dilation_width */,
    384 /* groups */,
    1 /* input channels per group */,
    1 /* output_channels_per_group */,
    384 /* input pixel stride */,
    384 /* output pixel stride */,
    w26, w27,
    0.0f /* output min */, 6.0f /* output max */,
    0 /* flags */,
    &op13);

  if (status != xnn_status_success) {
    cerr << "failed to create operation #13" << endl;
    return -1;
  }
  operators.emplace_back(op13, xnn_delete_operator);
  status = xnn_setup_convolution2d_nhwc_f32(
    op13,
    1 /* batch size */,  14/* input height */,  14/* input width */,
    &v15[0] /* input */, &v16[0] /* output */,
    threadpool.get());
  if (status != xnn_status_success) {
    cerr << "failed to setup operation #13" << endl;
    return -1;
  }

  xnn_operator_t op14 = nullptr;
  status = xnn_create_convolution2d_nhwc_f32(
    0 /* top padding */,  0/* right padding */,
    0 /* bottom padding */, 0 /* left padding */,
    1 /* kernel height */, 1 /* kernel width */,
    1 /* subsampling height */,  1/* subsampling width */,
    1 /* dilation_height */, 1 /* dilation_width */,
    1 /* groups */,
    384 /* input channels per group */,
    384 /* output_channels_per_group */,
    384 /* input pixel stride */,
    384 /* output pixel stride */,
    w28, w29,
    0.0f /* output min */, 6.0f /* output max */,
    0 /* flags */,
    &op14);
  if (status != xnn_status_success) {
    cerr << "failed to create operation #14" << endl;
    return -1;
  }
  operators.emplace_back(op14, xnn_delete_operator);

  status = xnn_setup_convolution2d_nhwc_f32(
    op14,
    1 /* batch size */,  14/* input height */,  14/* input width */,
    &v16[0] /* input */, &v17[0] /* output */,
    threadpool.get());
  if (status != xnn_status_success) {
    cerr << "failed to setup operation #14" << endl;
    return -1;
  }

  xnn_operator_t op15 = nullptr;
  status = xnn_create_convolution2d_nhwc_f32(
    0 /* top padding */, 1 /* right padding */,
    1 /* bottom padding */, 0 /* left padding */,
    3 /* kernel height */, 3 /* kernel width */,
    1 /* subsampling height */, 1 /* subsampling width */,
    1 /* dilation_height */, 1 /* dilation_width */,
    384 /* groups */,
    1 /* input channels per group */,
    1 /* output_channels_per_group */,
    384 /* input pixel stride */,
    384 /* output pixel stride */,
    w30, w31,
    0.0f /* output min */, 6.0f /* output max */,
    0 /* flags */,
    &op15);

  if (status != xnn_status_success) {
    cerr << "failed to create operation #15" << endl;
    return -1;
  }
  operators.emplace_back(op15, xnn_delete_operator);
  status = xnn_setup_convolution2d_nhwc_f32(
    op15,
    1 /* batch size */,  14/* input height */,  14/* input width */,
    &v17[0] /* input */, &v18[0] /* output */,
    threadpool.get());
  if (status != xnn_status_success) {
    cerr << "failed to setup operation #15" << endl;
    return -1;
  }

  xnn_operator_t op16 = nullptr;
  status = xnn_create_convolution2d_nhwc_f32(
    0 /* top padding */,  0/* right padding */,
    0 /* bottom padding */, 0 /* left padding */,
    1 /* kernel height */, 1 /* kernel width */,
    1 /* subsampling height */,  1/* subsampling width */,
    1 /* dilation_height */, 1 /* dilation_width */,
    1 /* groups */,
    384 /* input channels per group */,
    384 /* output_channels_per_group */,
    384 /* input pixel stride */,
    384 /* output pixel stride */,
    w32, w33,
    0.0f /* output min */, 6.0f /* output max */,
    0 /* flags */,
    &op16);
  if (status != xnn_status_success) {
    cerr << "failed to create operation #16" << endl;
    return -1;
  }
  operators.emplace_back(op16, xnn_delete_operator);

  status = xnn_setup_convolution2d_nhwc_f32(
    op16,
    1 /* batch size */,  14/* input height */,  14/* input width */,
    &v18[0] /* input */, &v19[0] /* output */,
    threadpool.get());
  if (status != xnn_status_success) {
    cerr << "failed to setup operation #16" << endl;
    return -1;
  }

  xnn_operator_t op17 = nullptr;
  status = xnn_create_convolution2d_nhwc_f32(
    0 /* top padding */, 1 /* right padding */,
    1 /* bottom padding */, 0 /* left padding */,
    3 /* kernel height */, 3 /* kernel width */,
    1 /* subsampling height */, 1 /* subsampling width */,
    1 /* dilation_height */, 1 /* dilation_width */,
    384 /* groups */,
    1 /* input channels per group */,
    1 /* output_channels_per_group */,
    384 /* input pixel stride */,
    384 /* output pixel stride */,
    w34, w35,
    0.0f /* output min */, 6.0f /* output max */,
    0 /* flags */,
    &op17);

  if (status != xnn_status_success) {
    cerr << "failed to create operation #17" << endl;
    return -1;
  }
  operators.emplace_back(op17, xnn_delete_operator);
  status = xnn_setup_convolution2d_nhwc_f32(
    op17,
    1 /* batch size */,  14/* input height */,  14/* input width */,
    &v19[0] /* input */, &v20[0] /* output */,
    threadpool.get());
  if (status != xnn_status_success) {
    cerr << "failed to setup operation #17" << endl;
    return -1;
  }
    xnn_operator_t op18 = nullptr;
  status = xnn_create_convolution2d_nhwc_f32(
    0 /* top padding */, 0 /* right padding */,
    0 /* bottom padding */, 0 /* left padding */,
    1 /* kernel height */, 1 /* kernel width */,
    1 /* subsampling height */, 1 /* subsampling width */,
    1 /* dilation_height */, 1 /* dilation_width */,
    1 /* groups */,
    384 /* input channels per group */,
    384 /* output_channels_per_group */,
    384 /* input pixel stride */,
    384 /* output pixel stride */,
    w36, w37,
    0.0f /* output min */, 6.0f /* output max */,
    0 /* flags */,
    &op18);

  if (status != xnn_status_success) {
    cerr << "failed to create operation #18" << endl;
    return -1;
  }
  operators.emplace_back(op18, xnn_delete_operator);
  status = xnn_setup_convolution2d_nhwc_f32(
    op18,
    1 /* batch size */,  14/* input height */,  14/* input width */,
    &v20[0] /* input */, &v21[0] /* output */,
    threadpool.get());
  if (status != xnn_status_success) {
    cerr << "failed to setup operation #18" << endl;
    return -1;
  }
    xnn_operator_t op19 = nullptr;
  status = xnn_create_convolution2d_nhwc_f32(
    1 /* top padding */, 1 /* right padding */,
    1 /* bottom padding */, 1 /* left padding */,
    3 /* kernel height */, 3 /* kernel width */,
    1 /* subsampling height */, 1 /* subsampling width */,
    1 /* dilation_height */, 1 /* dilation_width */,
    384 /* groups */,
    1 /* input channels per group */,
    1 /* output_channels_per_group */,
    384 /* input pixel stride */,
    384 /* output pixel stride */,
    w38, w39,
    0.0f /* output min */, 6.0f /* output max */,
    0 /* flags */,
    &op19);

  if (status != xnn_status_success) {
    cerr << "failed to create operation #19" << endl;
    return -1;
  }
  operators.emplace_back(op19, xnn_delete_operator);
  status = xnn_setup_convolution2d_nhwc_f32(
    op19,
    1 /* batch size */,  14/* input height */,  14/* input width */,
    &v21[0] /* input */, &v22[0] /* output */,
    threadpool.get());
  if (status != xnn_status_success) {
    cerr << "failed to setup operation #19" << endl;
    return -1;
  }
    xnn_operator_t op20 = nullptr;
  status = xnn_create_convolution2d_nhwc_f32(
    0 /* top padding */, 0 /* right padding */,
    0 /* bottom padding */, 0 /* left padding */,
    1 /* kernel height */, 1 /* kernel width */,
    1 /* subsampling height */, 1 /* subsampling width */,
    1 /* dilation_height */, 1 /* dilation_width */,
    1 /* groups */,
    384 /* input channels per group */,
    384 /* output_channels_per_group */,
    384 /* input pixel stride */,
    384 /* output pixel stride */,
    w40, w41,
    0.0f /* output min */, 6.0f /* output max */,
    0 /* flags */,
    &op20);

  if (status != xnn_status_success) {
    cerr << "failed to create operation #20" << endl;
    return -1;
  }
  operators.emplace_back(op20, xnn_delete_operator);
  status = xnn_setup_convolution2d_nhwc_f32(
    op20,
    1 /* batch size */,  14/* input height */,  14/* input width */,
    &v22[0] /* input */, &v23[0] /* output */,
    threadpool.get());
  if (status != xnn_status_success) {
    cerr << "failed to setup operation #20" << endl;
    return -1;
  }
  
  xnn_operator_t op21 = nullptr;
  status = xnn_create_convolution2d_nhwc_f32(
    1 /* top padding */, 1 /* right padding */,
    1 /* bottom padding */, 1 /* left padding */,
    3 /* kernel height */, 3 /* kernel width */,
    1 /* subsampling height */, 1 /* subsampling width */,
    1 /* dilation_height */, 1 /* dilation_width */,
    384 /* groups */,
    1 /* input channels per group */,
    1 /* output_channels_per_group */,
    384 /* input pixel stride */,
    384 /* output pixel stride */,
    w42, w43,
    0.0f /* output min */, 6.0f /* output max */,
    0 /* flags */,
    &op21);

  if (status != xnn_status_success) {
    cerr << "failed to create operation #21" << endl;
    return -1;
  }
  operators.emplace_back(op21, xnn_delete_operator);
  status = xnn_setup_convolution2d_nhwc_f32(
    op21,
    1 /* batch size */,  14/* input height */,  14/* input width */,
    &v23[0] /* input */, &v24[0] /* output */,
    threadpool.get());
  if (status != xnn_status_success) {
    cerr << "failed to setup operation #21" << endl;
    return -1;
  }

  xnn_operator_t op22 = nullptr;
  status = xnn_create_convolution2d_nhwc_f32(
    0 /* top padding */, 0 /* right padding */,
    0 /* bottom padding */, 0 /* left padding */,
    1 /* kernel height */, 1 /* kernel width */,
    1 /* subsampling height */, 1 /* subsampling width */,
    1 /* dilation_height */, 1 /* dilation_width */,
    1 /* groups */,
    384 /* input channels per group */,
    384 /* output_channels_per_group */,
    384 /* input pixel stride */,
    384 /* output pixel stride */,
    w44, w45,
    0.0f /* output min */, 6.0f /* output max */,
    0 /* flags */,
    &op22);

  if (status != xnn_status_success) {
    cerr << "failed to create operation #22" << endl;
    return -1;
  }
  operators.emplace_back(op22, xnn_delete_operator);
  status = xnn_setup_convolution2d_nhwc_f32(
    op22,
    1 /* batch size */,  14/* input height */,  14/* input width */,
    &v24[0] /* input */, &v25[0] /* output */,
    threadpool.get());
  if (status != xnn_status_success) {
    cerr << "failed to setup operation #22" << endl;
    return -1;
  }
  
  xnn_operator_t op23 = nullptr;
  status = xnn_create_convolution2d_nhwc_f32(
    0 /* top padding */, 1 /* right padding */,
    1 /* bottom padding */, 0 /* left padding */,
    3 /* kernel height */, 3 /* kernel width */,
    2 /* subsampling height */, 2 /* subsampling width */,
    1 /* dilation_height */, 1 /* dilation_width */,
    384 /* groups */,
    1 /* input channels per group */,
    1 /* output_channels_per_group */,
    384 /* input pixel stride */,
    384 /* output pixel stride */,
    w46, w47,
    0.0f /* output min */, 6.0f /* output max */,
    0 /* flags */,
    &op23);

  if (status != xnn_status_success) {
    cerr << "failed to create operation #23" << endl;
    return -1;
  }
  operators.emplace_back(op23, xnn_delete_operator);
  status = xnn_setup_convolution2d_nhwc_f32(
    op23,
    1 /* batch size */,  14/* input height */,  14/* input width */,
    &v25[0] /* input */, &v26[0] /* output */,
    threadpool.get());
  if (status != xnn_status_success) {
    cerr << "failed to setup operation #23" << endl;
    return -1;
  }

  xnn_operator_t op24 = nullptr;
  status = xnn_create_convolution2d_nhwc_f32(
    0 /* top padding */, 0 /* right padding */,
    0 /* bottom padding */, 0 /* left padding */,
    1 /* kernel height */, 1 /* kernel width */,
    1 /* subsampling height */, 1 /* subsampling width */,
    1 /* dilation_height */, 1 /* dilation_width */,
    1 /* groups */,
    384 /* input channels per group */,
    768 /* output_channels_per_group */,
    384 /* input pixel stride */,
    768 /* output pixel stride */,
    w48, w49,
    0.0f /* output min */, 6.0f /* output max */,
    0 /* flags */,
    &op24);

  if (status != xnn_status_success) {
    cerr << "failed to create operation #24" << endl;
    return -1;
  }
  operators.emplace_back(op24, xnn_delete_operator);
  status = xnn_setup_convolution2d_nhwc_f32(
    op24,
    1 /* batch size */,  7/* input height */,  7/* input width */,
    &v26[0] /* input */, &v27[0] /* output */,
    threadpool.get());
  if (status != xnn_status_success) {
    cerr << "failed to setup operation #24" << endl;
    return -1;
  }
  
  xnn_operator_t op25 = nullptr;
  status = xnn_create_convolution2d_nhwc_f32(
    1 /* top padding */, 1 /* right padding */,
    1 /* bottom padding */, 1 /* left padding */,
    3 /* kernel height */, 3 /* kernel width */,
    1 /* subsampling height */, 1 /* subsampling width */,
    1 /* dilation_height */, 1 /* dilation_width */,
    768 /* groups */,
    1 /* input channels per group */,
    1 /* output_channels_per_group */,
    768 /* input pixel stride */,
    768 /* output pixel stride */,
    w50, w51,
    0.0f /* output min */, 6.0f /* output max */,
    0 /* flags */,
    &op25);

  if (status != xnn_status_success) {
    cerr << "failed to create operation #25" << endl;
    return -1;
  }
  operators.emplace_back(op25, xnn_delete_operator);
  status = xnn_setup_convolution2d_nhwc_f32(
    op25,
    1 /* batch size */,  7/* input height */,  7/* input width */,
    &v27[0] /* input */, &v28[0] /* output */,
    threadpool.get());
  if (status != xnn_status_success) {
    cerr << "failed to setup operation #25" << endl;
    return -1;
  }

  xnn_operator_t op26 = nullptr;
  status = xnn_create_convolution2d_nhwc_f32(
    0 /* top padding */, 0 /* right padding */,
    0 /* bottom padding */, 0 /* left padding */,
    1 /* kernel height */, 1 /* kernel width */,
    1 /* subsampling height */, 1 /* subsampling width */,
    1 /* dilation_height */, 1 /* dilation_width */,
    1 /* groups */,
    768 /* input channels per group */,
    768 /* output_channels_per_group */,
    768 /* input pixel stride */,
    768 /* output pixel stride */,
    w52, w53,
    0.0f /* output min */, 6.0f /* output max */,
    0 /* flags */,
    &op26);

  if (status != xnn_status_success) {
    cerr << "failed to create operation #26" << endl;
    return -1;
  }
  operators.emplace_back(op26, xnn_delete_operator);
  status = xnn_setup_convolution2d_nhwc_f32(
    op26,
    1 /* batch size */,  7/* input height */,  7/* input width */,
    &v28[0] /* input */, &v29[0] /* output */,
    threadpool.get());
  if (status != xnn_status_success) {
    cerr << "failed to setup operation #26" << endl;
    return -1;
  }

  xnn_operator_t op27 = nullptr;
  status = xnn_create_global_average_pooling_nwc_f32(
    768 /* channels */, 768 /* input stride */, 768 /* output stride */,
    -numeric_limits<float>::infinity(), numeric_limits<float>::infinity(),
    0 /* flags */,
    &op27);
  if (status != xnn_status_success) {
    cerr << "failed to create operation #27" << endl;
    return -1;
  }
  operators.emplace_back(op27, xnn_delete_operator);
  status = xnn_setup_global_average_pooling_nwc_f32(
    op27,
    1 /* batch size */, 49 /* width */,
    &v29[0] /* input */, &v30[0] /* output */,
    threadpool.get());
  if (status != xnn_status_success) {
    cerr << "failed to setup operation #27" << endl;
    return -1;
  }

  xnn_operator_t op28 = nullptr;
  status = xnn_create_fully_connected_nc_f32(
  768,//size_t input_channels,
  1000,//size_t output_channels,
  768,//size_t input_stride,
  1000,//size_t output_stride,
  w54,//const float* kernel,
  w55,//const float* bias,
  -numeric_limits<float>::infinity(), numeric_limits<float>::infinity(),
  0,//uint32_t flags,
  &op28);

  if (status != xnn_status_success) {
    cerr << "failed to create operation #28" << endl;
    return -1;
  }
  operators.emplace_back(op28, xnn_delete_operator);
  status = xnn_setup_fully_connected_nc_f32(
  op28,
  1,//size_t batch_size,
  &v30[0],//const float* input,
  &v31[0],//float* output,
  threadpool.get());
  if (status != xnn_status_success) {
    cerr << "failed to setup operation #28" << endl;
    return -1;
  }

}


    for (const unique_ptr<xnn_operator, decltype(&xnn_delete_operator)>& op : operators) {
      xnn_status status = xnn_run_operator(op.get(), threadpool.get());
      if (status != xnn_status_success) {
        cerr << "failed to run a model" << endl;
        return -1;
      }
    }

    ofstream f;
    f.open("./v2.data");
    size_t n_zeros = 0;
    for(size_t l=0 ; l<150528; l++ ){
        f << v2[l] << endl;
        if(v2[l] == 0) n_zeros++;
    }
    f.close();
    cout << "v2 Sparsity: "<< (float)n_zeros/150528 << "   n_zeros: "<< n_zeros << endl;

    n_zeros = 0;
    f.open("./v3.data");
    for(size_t l=0 ; l<301056; l++ ){
        f << v3[l] << endl;
        if(v3[l] == 0) n_zeros++;
    }
    f.close();
    cout << "v3 Sparsity: "<< (float)n_zeros/301056 << "   n_zeros: "<< n_zeros << endl;

    n_zeros = 0;
    f.open("./v4.data");
    for(size_t l=0 ; l<301056; l++ ){
        f << v4[l] << endl;
        if(v4[l] == 0) n_zeros++;
    }
    f.close();
    cout << "v4 Sparsity: "<< (float)n_zeros/301056 << "   n_zeros: "<< n_zeros << endl; 

    n_zeros = 0;
    f.open("./v5.data");
    for(size_t l=0 ; l<602112; l++ ){
        f << v5[l] << endl;
        if(v5[l] == 0) n_zeros++;
    }
    f.close();
    cout << "v5 Sparsity: "<< (float)n_zeros/602112 << "   n_zeros: "<< n_zeros << endl;

    n_zeros = 0;
    f.open("./v6.data");
    for(size_t l=0 ; l<150528; l++ ){
        f << v6[l] << endl;
        if(v6[l] == 0) n_zeros++;
    }
    f.close();
    cout << "v6 Sparsity: "<< (float)n_zeros/150528 << "   n_zeros: "<< n_zeros << endl; 

    n_zeros = 0;
    f.open("./v7.data");
    for(size_t l=0 ; l<301056; l++ ){
        f << v7[l] << endl;
        if(v7[l] == 0) n_zeros++;
    }
    f.close();
    cout << "v7 Sparsity: "<< (float)n_zeros/301056 << "   n_zeros: "<< n_zeros << endl;

    n_zeros = 0;
    f.open("./v8.data");
    for(size_t l=0 ; l<301056; l++ ){
        f << v8[l] << endl;
        if(v8[l] == 0) n_zeros++;
    }
    f.close();
    cout << "v8 Sparsity: "<< (float)n_zeros/301056 << "   n_zeros: "<< n_zeros << endl;

    n_zeros = 0;
    f.open("./v9.data");
    for(size_t l=0 ; l<301056; l++ ){
        f << v9[l] << endl;
        if(v9[l] == 0) n_zeros++;
    }
    f.close();
    cout << "v9 Sparsity: "<< (float)n_zeros/301056 << "   n_zeros: "<< n_zeros << endl;

    n_zeros = 0;
    f.open("./v10.data");
    for(size_t l=0 ; l<75264; l++ ){
        f << v10[l] << endl;
        if(v10[l] == 0) n_zeros++;
    }
    f.close();
    cout << "v10 Sparsity: "<< (float)n_zeros/75264 << "   n_zeros: "<< n_zeros << endl;

    n_zeros = 0;
    f.open("./v11.data");
    for(size_t l=0 ; l<150528; l++ ){
        f << v11[l] << endl;
        if(v11[l] == 0) n_zeros++;
    }
    f.close();
    cout << "v11 Sparsity: "<< (float)n_zeros/150528 << "   n_zeros: "<< n_zeros << endl;

    n_zeros = 0;
    f.open("./v12.data");
    for(size_t l=0 ; l<150528; l++ ){
        f << v12[l] << endl;
        if(v12[l] == 0) n_zeros++;
    }
    f.close();
    cout << "v12 Sparsity: "<< (float)n_zeros/150528 << "   n_zeros: "<< n_zeros << endl; 

    n_zeros = 0;
    f.open("./v13.data");
    for(size_t l=0 ; l<150528; l++ ){
        f << v13[l] << endl;
        if(v13[l] == 0) n_zeros++;
    }
    f.close();
    cout << "v13 Sparsity: "<< (float)n_zeros/150528 << "   n_zeros: "<< n_zeros << endl;

    n_zeros = 0;
    f.open("./v14.data");
    for(size_t l=0 ; l<37632; l++ ){
        f << v14[l] << endl;
        if(v14[l] == 0) n_zeros++;
    }
    f.close();
    cout << "v14 Sparsity: "<< (float)n_zeros/37632 << "   n_zeros: "<< n_zeros << endl;

    n_zeros = 0;
    f.open("./v15.data");
    for(size_t l=0 ; l<75264; l++ ){
        f << v15[l] << endl;
        if(v15[l] == 0) n_zeros++;
    }
    f.close();
    cout << "v15 Sparsity: "<< (float)n_zeros/75264 << "   n_zeros: "<< n_zeros << endl;

    n_zeros = 0;
    f.open("./v16.data");
    for(size_t l=0 ; l<75264; l++ ){
        f << v16[l] << endl;
        if(v16[l] == 0) n_zeros++;
    }
    f.close();
    cout << "v16 Sparsity: "<< (float)n_zeros/75264 << "   n_zeros: "<< n_zeros << endl; 

    n_zeros = 0;
    f.open("./v17.data");
    for(size_t l=0 ; l<75264; l++ ){
        f << v17[l] << endl;
        if(v17[l] == 0) n_zeros++;
    }
    f.close();
    cout << "v17 Sparsity: "<< (float)n_zeros/75264 << "   n_zeros: "<< n_zeros << endl;

    n_zeros = 0;
    f.open("./v18.data");
    for(size_t l=0 ; l<75264; l++ ){
        f << v18[l] << endl;
        if(v18[l] == 0) n_zeros++;
    }
    f.close();
    cout << "v18 Sparsity: "<< (float)n_zeros/75264 << "   n_zeros: "<< n_zeros << endl;

    n_zeros = 0;
    f.open("./v19.data");
    for(size_t l=0 ; l<75264; l++ ){
        f << v19[l] << endl;
        if(v19[l] == 0) n_zeros++;
    }
    f.close();
    cout << "v19 Sparsity: "<< (float)n_zeros/75264 << "   n_zeros: "<< n_zeros << endl; 

    n_zeros = 0;
    f.open("./v20.data");
    for(size_t l=0 ; l<75264; l++ ){
        f << v20[l] << endl;
        if(v20[l] == 0) n_zeros++;
    }
    f.close();
    cout << "v20 Sparsity: "<< (float)n_zeros/75264 << "   n_zeros: "<< n_zeros << endl;

    n_zeros = 0;
    f.open("./v21.data");
    for(size_t l=0 ; l<75264; l++ ){
        f << v21[l] << endl;
        if(v21[l] == 0) n_zeros++;
    }
    f.close();
    cout << "v21 Sparsity: "<< (float)n_zeros/75264 << "   n_zeros: "<< n_zeros << endl;

    n_zeros = 0;
    f.open("./v22.data");
    for(size_t l=0 ; l<75264; l++ ){
        f << v22[l] << endl;
        if(v22[l] == 0) n_zeros++;
    }
    f.close();
    cout << "v22 Sparsity: "<< (float)n_zeros/75264 << "   n_zeros: "<< n_zeros << endl;

    n_zeros = 0;
    f.open("./v23.data");
    for(size_t l=0 ; l<75264; l++ ){
        f << v23[l] << endl;
        if(v23[l] == 0) n_zeros++;
    }
    f.close();
    cout << "v23 Sparsity: "<< (float)n_zeros/75264 << "   n_zeros: "<< n_zeros << endl;

    n_zeros = 0;
    f.open("./v24.data");
    for(size_t l=0 ; l<75264; l++ ){
        f << v24[l] << endl;
        if(v24[l] == 0) n_zeros++;
    }
    f.close();
    cout << "v24 Sparsity: "<< (float)n_zeros/75264 << "   n_zeros: "<< n_zeros << endl;

    n_zeros = 0;
    f.open("./v25.data");
    for(size_t l=0 ; l<75264; l++ ){
        f << v25[l] << endl;
        if(v25[l] == 0) n_zeros++;
    }
    f.close();
    cout << "v25 Sparsity: "<< (float)n_zeros/75264 << "   n_zeros: "<< n_zeros << endl;

    n_zeros = 0;
    f.open("./v26.data");
    for(size_t l=0 ; l<18816; l++ ){
        f << v26[l] << endl;
        if(v26[l] == 0) n_zeros++;
    }
    f.close();
    cout << "v26 Sparsity: "<< (float)n_zeros/18816 << "   n_zeros: "<< n_zeros << endl;

    n_zeros = 0;
    f.open("./v27.data");
    for(size_t l=0 ; l<37632; l++ ){
        f << v27[l] << endl;
        if(v27[l] == 0) n_zeros++;
    }
    f.close();
    cout << "v27 Sparsity: "<< (float)n_zeros/37632 << "   n_zeros: "<< n_zeros << endl;

    n_zeros = 0;
    f.open("./v28.data");
    for(size_t l=0 ; l<37632; l++ ){
        f << v28[l] << endl;
        if(v28[l] == 0) n_zeros++;
    }
    f.close();
    cout << "v28 Sparsity: "<< (float)n_zeros/37632 << "   n_zeros: "<< n_zeros << endl;

    n_zeros = 0;
    f.open("./v29.data");
    for(size_t l=0 ; l<37632; l++ ){
        f << v29[l] << endl;
        if(v29[l] == 0) n_zeros++;
    }
    f.close();
    cout << "v29 Sparsity: "<< (float)n_zeros/37632 << "   n_zeros: "<< n_zeros << endl;

  return 0;

}