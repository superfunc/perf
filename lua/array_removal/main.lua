-- Copyright 2019 (c) superfunc
-- See LICENSE file for conditions of usage.
--
-- This file provides a simple prune function (with basic perf tests below)
-- for fast removal from an array, when order doesn't matter

-- Since order of elements doesn't matter to us, we can efficiently
-- remove by using heap-style deletion. We swap 'dead' entites with the
-- end element (which is cheap, its just a few numbers), and then trim
-- the end element off with table:remove, avoiding sliding all elements down.

function remove(t, i)
  t[i], t[#t] = t[#t], t[i]
  table.remove(t, #t)
end

function prune(t, shouldPrune)
  local i = 1
  while i <= #t do
    if shouldPrune(t[i]) then
      remove(t, i)
    else
      i = i + 1
    end
  end
end

function traditionalPrune(t, shouldPrune)
  local i = 1
  while i <= #t do
    if shouldPrune(t[i]) then
      table.remove(t, i)
    else
      i = i + 1
    end
  end
end

function pruneFn(n) 
  return n < 5 
end

function printArray(t)
  print("Array of length: " .. #t) 
  local str = ""
  for i=1,#t do
    str = str .. "[" .. t[i] .. "]"
  end
  print(str)
end


function testRemovals(N)
  local ts1 = {}
  local ts2 = {}
  
  --print("Testing for array of size N: " .. N)
  
  -- Fill the arrays with identical data
  for i=1,N do
    k = math.random(10)
    ts1[i] = k
    ts2[i] = k
  end
  
  -- Time traditional pruning
  local t0 = os.clock()
  traditionalPrune(ts1, pruneFn)
  local t1 = os.clock()
  --print("traditional prune removal: ", (t1-t0))
  
  -- Time swapping based pruning
  t2 = os.clock()
  prune(ts2, pruneFn)
  t3 = os.clock()
  --print("swapping prune removal: ", (t3-t2))
  
  
  -- Ensure the overall contents remain the same
  --print("length_1: " .. #ts1)
  --print("length_2: " .. #ts2)
  assert(#ts1==#ts2)
  
  table.sort(ts1)
  table.sort(ts2)
  for i=1,#ts1 do
    assert(ts1[i] == ts2[i])
  end
  --print("contents equal")

  return t3-t2, t1-t0
end

function testAverage(N)
  local sumPrune, sumTraditional = 0, 0
  for _=1,5 do
    p, t = testRemovals(N)
    sumPrune = sumPrune + p
    sumTraditional = sumTraditional + t
  end

  print("[prune] Average time for size " .. N .. ": " .. sumPrune/10.0)
  print("[traditional] Average time for size " .. N .. ": " .. sumTraditional/10.0)
end

print("Testing small sizes")
testAverage(50)
testAverage(100)
testAverage(250)
testAverage(500)
testAverage(1000)

print("Testing moderate sizes")
testAverage(2500)
testAverage(5000)
testAverage(10000)
testAverage(25000)
testAverage(50000)
