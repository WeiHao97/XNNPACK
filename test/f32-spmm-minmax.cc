/ Copyright 2019 Google LLC
//
// This source code is licensed under the BSD-style license found in the
// LICENSE file in the root directory of this source tree.
//
// Auto-generated file. Do not edit!
//   Specification: test/f32-spmm-minmax.yaml
//   Generator: tools/generate-spmm-test.py


#include <gtest/gtest.h>

#include <xnnpack/common.h>
#include <xnnpack/isa-checks.h>

#include <xnnpack/spmm.h>
#include "spmm-microkernel-tester.h"

#if XNN_ARCH_ARM64
  TEST(F32_SPMM_MINMAX_16X1__NEONFMA_PIPELINED, k_eq_1) {
    TEST_REQUIRES_ARM_NEON_FMA;
    SpMMMicrokernelTester()
      .mr(16)
      .nr(1)
      .m(16)
      .n(1)
      .k(1)
      .sparsity(0.0f)
      .Test(xnn_f32_spmm_minmax_ukernel_16x1__neonfma_pipelined);
  }

  TEST(F32_SPMM_MINMAX_16X1__NEONFMA_PIPELINED, k_gt_1) {
    TEST_REQUIRES_ARM_NEON_FMA;
    for (size_t k = 2; k < 10; k++) {
      SpMMMicrokernelTester()
        .mr(16)
        .nr(1)
        .m(16)
        .n(1)
        .k(k)
        .sparsity(0.0f)
        .Test(xnn_f32_spmm_minmax_ukernel_16x1__neonfma_pipelined);
    }
  }

  TEST(F32_SPMM_MINMAX_16X1__NEONFMA_PIPELINED, n_gt_1) {
    TEST_REQUIRES_ARM_NEON_FMA;
    for (uint32_t n = 2; n < 10; n++) {
      for (size_t k = 1; k <= 5; k += 2) {
        SpMMMicrokernelTester()
          .mr(16)
          .nr(1)
          .m(16)
          .n(n)
          .k(k)
          .sparsity(0.0f)
          .Test(xnn_f32_spmm_minmax_ukernel_16x1__neonfma_pipelined);
      }
    }
  }

  TEST(F32_SPMM_MINMAX_16X1__NEONFMA_PIPELINED, m_lt_16) {
    TEST_REQUIRES_ARM_NEON_FMA;
    for (uint32_t m = 1; m < 16; m++) {
      for (uint32_t n = 1; n < 10; n += 2) {
        for (size_t k = 1; k <= 5; k += 2) {
          SpMMMicrokernelTester()
            .mr(16)
            .nr(1)
            .m(m)
            .n(n)
            .k(k)
            .sparsity(0.0f)
            .Test(xnn_f32_spmm_minmax_ukernel_16x1__neonfma_pipelined);
        }
      }
    }
  }

  TEST(F32_SPMM_MINMAX_16X1__NEONFMA_PIPELINED, m_div_16) {
    TEST_REQUIRES_ARM_NEON_FMA;
    for (uint32_t m = 32; m <= 48; m += 16) {
      for (uint32_t n = 1; n < 10; n += 2) {
        for (size_t k = 1; k <= 5; k += 2) {
          SpMMMicrokernelTester()
            .mr(16)
            .nr(1)
            .m(m)
            .n(n)
            .k(k)
            .sparsity(0.0f)
            .Test(xnn_f32_spmm_minmax_ukernel_16x1__neonfma_pipelined);
        }
      }
    }
  }

  TEST(F32_SPMM_MINMAX_16X1__NEONFMA_PIPELINED, m_gt_16) {
    TEST_REQUIRES_ARM_NEON_FMA;
    for (uint32_t m = 17; m < 32; m++) {
      for (uint32_t n = 1; n < 10; n += 2) {
        for (size_t k = 1; k <= 5; k += 2) {
          SpMMMicrokernelTester()
            .mr(16)
            .nr(1)
            .m(m)
            .n(n)
            .k(k)
            .sparsity(0.0f)
            .Test(xnn_f32_spmm_minmax_ukernel_16x1__neonfma_pipelined);
        }
      }
    }
  }

  TEST(F32_SPMM_MINMAX_16X1__NEONFMA_PIPELINED, qmin) {
    TEST_REQUIRES_ARM_NEON_FMA;
    for (uint32_t n = 1; n < 10; n += 2) {
      for (size_t k = 1; k <= 5; k += 2) {
        SpMMMicrokernelTester()
          .mr(16)
          .nr(1)
          .m(32)
          .n(n)
          .k(k)
          .sparsity(0.0f)
          .qmin(128)
          .Test(xnn_f32_spmm_minmax_ukernel_16x1__neonfma_pipelined);
      }
    }
  }

  TEST(F32_SPMM_MINMAX_16X1__NEONFMA_PIPELINED, qmax) {
    TEST_REQUIRES_ARM_NEON_FMA;
    for (uint32_t n = 1; n < 10; n += 2) {
      for (size_t k = 1; k <= 5; k += 2) {
        SpMMMicrokernelTester()
          .mr(16)
          .nr(1)
          .m(32)
          .n(n)
          .k(k)
          .sparsity(0.0f)
          .qmax(128)
          .Test(xnn_f32_spmm_minmax_ukernel_16x1__neonfma_pipelined);
      }
    }
  }

  TEST(F32_SPMM_MINMAX_16X1__NEONFMA_PIPELINED, half_sparse) {
    TEST_REQUIRES_ARM_NEON_FMA;
    for (uint32_t n = 1; n < 10; n += 2) {
      for (size_t k = 1; k <= 5; k += 2) {
        SpMMMicrokernelTester()
          .mr(16)
          .nr(1)
          .m(32)
          .n(n)
          .k(k)
          .sparsity(0.5f)
          .Test(xnn_f32_spmm_minmax_ukernel_16x1__neonfma_pipelined);
      }
    }
  }

  TEST(F32_SPMM_MINMAX_16X1__NEONFMA_PIPELINED, zero_weights) {
    TEST_REQUIRES_ARM_NEON_FMA;
    for (uint32_t n = 1; n < 10; n += 2) {
      for (size_t k = 1; k <= 5; k += 2) {
        SpMMMicrokernelTester()
          .mr(16)
          .nr(1)
          .m(32)
          .n(n)
          .k(k)
          .sparsity(1.0f)
          .Test(xnn_f32_spmm_minmax_ukernel_16x1__neonfma_pipelined);
      }
    }
  }
#endif  // XNN_ARCH_ARM64