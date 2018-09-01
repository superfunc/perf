#### Results from a typical VFX workstation

- TBB Version 4.4
- Run on (24 X 3500 MHz CPU s)
- CPU Caches:
  - L1 Data 32K (x24)a
  - L1 Instruction 32K (x24)
  - L2 Unified 256K (x24)
  - L3 Unified 30720K (x2)
  
#### Benchmark Results

|Name                                                    | Time          |  CPU          |Iterations| 
|:-------------------------------------------------------|:--------------|:--------------|:---------|
| ComputeExtent_NumPoints_1_GrainSize_1                  |         80 ns |        80 ns  |  8764752 | 
| ComputeExtent_NumPoints_1_GrainSize_10                 |         80 ns |        80 ns  |  8760656 |
| ComputeExtent_NumPoints_1_GrainSize_100                |         80 ns |        80 ns  |  8756962 |
| ComputeExtent_NumPoints_1_GrainSize_250                |         80 ns |        80 ns  |  8764762 |
| ComputeExtent_NumPoints_1_GrainSize_500                |         80 ns |        80 ns  |  8753590 |
| ComputeExtent_NumPoints_1_GrainSize_1000               |         80 ns |        80 ns  |  8758650 |
| ComputeExtent_NumPoints_1_GrainSize_10000              |         80 ns |        80 ns  |  8765203 |
| ComputeExtent_NumPoints_1_GrainSize_100000             |         80 ns |        80 ns  |  8784401 |
| ComputeExtent_NumPoints_1_GrainSize_1000000            |         80 ns |        80 ns  |  8760694 |
| ComputeExtent_NumPoints_10_GrainSize_1                 |       5088 ns |      5032 ns  |   122484 |
| ComputeExtent_NumPoints_10_GrainSize_10                |        103 ns |       103 ns  |  6801247 |
| ComputeExtent_NumPoints_10_GrainSize_100               |        100 ns |       100 ns  |  7031018 |
| ComputeExtent_NumPoints_10_GrainSize_250               |        100 ns |       100 ns  |  7032420 |
| ComputeExtent_NumPoints_10_GrainSize_500               |        102 ns |       102 ns  |  6892273 |
| ComputeExtent_NumPoints_10_GrainSize_1000              |        100 ns |       100 ns  |  7027707 |
| ComputeExtent_NumPoints_10_GrainSize_10000             |        100 ns |       100 ns  |  7030685 |
| ComputeExtent_NumPoints_10_GrainSize_100000            |        100 ns |       100 ns  |  7020041 |
| ComputeExtent_NumPoints_10_GrainSize_1000000           |        100 ns |       100 ns  |  7018273 |
| ComputeExtent_NumPoints_100_GrainSize_1                |      11502 ns |     11502 ns  |    60986 |
| ComputeExtent_NumPoints_100_GrainSize_10               |       6486 ns |      6409 ns  |   103172 |
| ComputeExtent_NumPoints_100_GrainSize_100              |        306 ns |       306 ns  |  2289605 |
| ComputeExtent_NumPoints_100_GrainSize_250              |        306 ns |       306 ns  |  2289042 |
| ComputeExtent_NumPoints_100_GrainSize_500              |        306 ns |       306 ns  |  2290280 |
| ComputeExtent_NumPoints_100_GrainSize_1000             |        306 ns |       306 ns  |  2289629 |
| ComputeExtent_NumPoints_100_GrainSize_10000            |        306 ns |       306 ns  |  2290367 |
| ComputeExtent_NumPoints_100_GrainSize_100000           |        306 ns |       306 ns  |  2289607 |
| ComputeExtent_NumPoints_100_GrainSize_1000000          |        306 ns |       306 ns  |  2290943 |
| ComputeExtent_NumPoints_1000_GrainSize_1               |      16546 ns |     16544 ns  |    42111 |
| ComputeExtent_NumPoints_1000_GrainSize_10              |      11834 ns |     11834 ns  |    59195 |
| ComputeExtent_NumPoints_1000_GrainSize_100             |       7698 ns |      7386 ns  |    92586 |
| ComputeExtent_NumPoints_1000_GrainSize_250             |       4937 ns |      4866 ns  |   144609 |
| ComputeExtent_NumPoints_1000_GrainSize_500             |       4020 ns |      3917 ns  |   177912 |
| ComputeExtent_NumPoints_1000_GrainSize_1000            |       2290 ns |      2290 ns  |   305696 |
| ComputeExtent_NumPoints_1000_GrainSize_10000           |       2288 ns |      2288 ns  |   305824 |
| ComputeExtent_NumPoints_1000_GrainSize_100000          |       2290 ns |      2290 ns  |   305712 |
| ComputeExtent_NumPoints_1000_GrainSize_1000000         |       2289 ns |      2289 ns  |   305814 |
| ComputeExtent_NumPoints_10000_GrainSize_1              |      19357 ns |     19345 ns  |    35394 |
| ComputeExtent_NumPoints_10000_GrainSize_10             |      18335 ns |     18334 ns  |    38207 |
| ComputeExtent_NumPoints_10000_GrainSize_100            |      13715 ns |     13710 ns  |    51206 |
| ComputeExtent_NumPoints_10000_GrainSize_250            |      12275 ns |     12274 ns  |    57291 |
| ComputeExtent_NumPoints_10000_GrainSize_500            |      10713 ns |     10711 ns  |    65082 |
| ComputeExtent_NumPoints_10000_GrainSize_1000           |       9944 ns |      9845 ns  |    70229 |
| ComputeExtent_NumPoints_10000_GrainSize_10000          |      22169 ns |     22169 ns  |    31546 |
| ComputeExtent_NumPoints_10000_GrainSize_100000         |      22159 ns |     22158 ns  |    31601 |
| ComputeExtent_NumPoints_10000_GrainSize_1000000        |      22159 ns |     22159 ns  |    31600 |
| ComputeExtent_NumPoints_100000_GrainSize_1             |      34336 ns |     34332 ns  |    20562 |
| ComputeExtent_NumPoints_100000_GrainSize_10            |      33637 ns |     33631 ns  |    20647 |
| ComputeExtent_NumPoints_100000_GrainSize_100           |      30090 ns |     30090 ns  |    23343 |
| ComputeExtent_NumPoints_100000_GrainSize_250           |      28899 ns |     28899 ns  |    25140 |
| ComputeExtent_NumPoints_100000_GrainSize_500           |      26191 ns |     26187 ns  |    26602 |
| ComputeExtent_NumPoints_100000_GrainSize_1000          |      24279 ns |     24275 ns  |    28965 |
| ComputeExtent_NumPoints_100000_GrainSize_10000         |      30821 ns |     28308 ns  |    24684 |
| ComputeExtent_NumPoints_100000_GrainSize_100000        |     220761 ns |    220732 ns  |     3172 |
| ComputeExtent_NumPoints_100000_GrainSize_1000000       |     220720 ns |    220699 ns  |     3172 |
| ComputeExtent_NumPoints_1000000_GrainSize_1            |     129672 ns |    129614 ns  |     5400 |
| ComputeExtent_NumPoints_1000000_GrainSize_10           |     130993 ns |    130993 ns  |     5290 |
| ComputeExtent_NumPoints_1000000_GrainSize_100          |     130382 ns |    130334 ns  |     5066 |
| ComputeExtent_NumPoints_1000000_GrainSize_250          |     123795 ns |    123789 ns  |     5570 |
| ComputeExtent_NumPoints_1000000_GrainSize_500          |     123235 ns |    123206 ns  |     5610 |
| ComputeExtent_NumPoints_1000000_GrainSize_1000         |     119484 ns |    119442 ns  |     5948 |
| ComputeExtent_NumPoints_1000000_GrainSize_10000        |     124777 ns |    124726 ns  |     5689 |
| ComputeExtent_NumPoints_1000000_GrainSize_100000       |     176206 ns |    176042 ns  |     3952 |
| ComputeExtent_NumPoints_1000000_GrainSize_1000000      |    2210875 ns |   2210852 ns  |      316 |
