import strutils, sequtils, sets

const input = slurp("input.txt").split("\n\n") # Had to delete the last newline in input file...
var 
  count = 0
  l : string

for entry in input:
  l = entry.split().foldl(a&b)
  count += toHashSet(l).len
echo "Part one: ", count

count = 0
var
  entry_split : seq[string]
  hset : HashSet[char]

for entry in input:
  entry_split = entry.split()
  for i, line in entry_split:
    if i == 0:
      hset = toHashSet(line)
    else:
      hset = intersection(hset, toHashSet(line))
  count += hset.len
echo "Part two: ", count