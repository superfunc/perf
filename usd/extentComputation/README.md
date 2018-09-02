This came up in some [code](https://github.com/PixarAnimationStudios/USD/pull/588/files#diff-ae871481ac1da2d3081de73c7245d8dd) 
I found as a hotspot in a profile. This gets into a pretty specific issue around Intel's TBB(Threading Building Blocks) library
related to a feature called _grain size_. The default grain size used by the work library in [usd](github.com/pixaranimationstudios/usd)
was set to **1**. After talking with a friend at work, I became suspicious of this number. Instead of relying on intuition,
I profiled it! What is enclosed in this directory is the result of that profiling. I ran it on my workstation, a big 24 core Xeon box, and
on my personal laptop, a 2015 MBP. 

#### Results
- [Macbook Pro](./charts_mac.pdf)
- [Xeon Workstation](./results_workstation.md)

#### Further Reading
- [TBB Parallel Reduce](https://software.intel.com/en-us/node/506063)
- [TBB Controlled Chunking](https://software.intel.com/en-us/node/506060)
