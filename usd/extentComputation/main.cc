// See LICENSE for info on usage.
// Copyright superfunc (c) 2018
#include <benchmark/benchmark.h>

#include <cstdio>

#include <pxr/base/gf/vec3f.h>
#include <pxr/base/vt/array.h>
#include <pxr/pxr.h>
#include <pxr/usd/usdGeom/pointBased.h>

using namespace PXR_NS;

void
escape(void* p)
{
  asm volatile("" : : "g"(p) : "memory");
}

#define MK_BENCH(k, n)                                                         \
  static void BM_ComputeExtent_PT_##k##_GS_##n(benchmark::State& state)        \
  {                                                                            \
    VtVec3fArray points, extent;                                               \
                                                                               \
    for (auto i = 0; i < k; ++i) {                                             \
      points.push_back({ float(i), float(i), float(i) });                      \
    }                                                                          \
                                                                               \
    for (auto _ : state) {                                                     \
      UsdGeomPointBased::Test__ComputeExtent(points, &extent, n);              \
      escape(&extent);                                                         \
      escape(&points);                                                         \
    }                                                                          \
  }                                                                            \
  BENCHMARK(BM_ComputeExtent_PT_##k##_GS_##n);

#define MK_BENCHES(k)                                                          \
  MK_BENCH(k, 1);                                                              \
  MK_BENCH(k, 10);                                                             \
  MK_BENCH(k, 100);                                                            \
  MK_BENCH(k, 1000);                                                           \
  MK_BENCH(k, 10000);                                                          \
  MK_BENCH(k, 100000);

MK_BENCHES(1);
MK_BENCHES(10);
MK_BENCHES(100);
MK_BENCHES(1000);
MK_BENCHES(10000);
MK_BENCHES(100000);

BENCHMARK_MAIN();
