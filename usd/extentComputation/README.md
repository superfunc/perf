> Note: this post is a WIP

This came up in some [code](https://github.com/PixarAnimationStudios/USD/pull/588/files#diff-ae871481ac1da2d3081de73c7245d8dd) 
I found as a hotspot in a profile. The code was used for computing extents, which are in turn used for bounding box calculations
by USD's rendering system, Hydra. The original code looked like this:

```c++
 bool
 UsdGeomPointBased::ComputeExtent(const VtVec3fArray& points,
     VtVec3fArray* extent)
 {
    ...
    GfRange3d bbox;
    for(const auto& point : points) {
        bbox.UnionWith(point);
    }
    ...
 }
```

Once I saw this code, it seemed obviously parallelizable via a [reduction](https://en.wikipedia.org/wiki/Fold_(higher-order_function)).
Luckily, a co-worker of mine had [just added](https://github.com/PixarAnimationStudios/USD/blob/master/pxr/base/lib/work/reduce.h) a parallel function for reducing into USD's threading abstraction library. This code was a small wrapper around a function 
called `parallel_reduce` from Intel's [TBB(Threading Building Blocks) library](https://software.intel.com/en-us/tbb-user-guide).
So I go along, and rewrite this code to use the newly available `WorkParallelReduceN`:
```c++
 bool
 UsdGeomPointBased::ComputeExtent(const VtVec3fArray& points,
     VtVec3fArray* extent)
 {
    ...
    GfRange3d bbox = WorkParallelReduceN(
        GfRange3d(),
        points.size(),
        [&points](size_t b, size_t e, GfRange3d init){
            for (auto i = b; i != e; ++i) {
                init.UnionWith(points[i]);
            }
             return init;
        },
        [&points](GfRange3d lhs, GfRange3d rhs){
            return GfRange3d::GetUnion(lhs, rhs);
        }
    );
    ...
}
```

So I sit down, back with the code I was originally profiling and.... it got slower. _Way slower_. So I scratch my
head and go back to my co-worker that added the reduce function to ask what was wrong. "Did you set a grain size?"
he asked. 

> Grain size is TBB's terminology for _units of loop iterations per chunk_, and Chunk is TBB's terminology for _units of work to be done by a thread_.

"No", I sheepishly replied to his question. He says, "Try setting it to something like 10,000 and see what happens". I did, and sure
as can be, the code got much faster than the original code. Busy with other tasks, I was content to leave this at 10,000, submit
the PR and move on with life. A developer on the other side of the PR responded with two thoughts. First was surprise that the
auto partitioner and TBB that controls chunking wasn't doing a great job. The second thought was that 10,000 might be too high.
At this point, we agreed that we needed more data to make an informed decision (this whole incident was a good reminder to myself
to always be data driven). 

I go off and collect this data on both my 2015 MBP, and my 24-core Xeon workstation. In short, the numbers pointed to a grain size of 
1 being awful, implying that the overhead of chunking was far greater than the work being done, and 10,000 being too high, implying that too much work was being done per chunk. Something in the range of 500-1k seemed like a good default, so thats where we left it
for now.

#### Results
- [Macbook Pro](./charts_mac.pdf)
- [Xeon Workstation](./results_workstation.md)

#### Further Reading
- [TBB Parallel Reduce](https://software.intel.com/en-us/node/506063)
- [TBB Controlled Chunking](https://software.intel.com/en-us/node/506060)
