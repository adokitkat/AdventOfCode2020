import strutils, sequtils, sets

const input : seq[string] = slurp("input.txt").split("\n\n") # Had to delete the last newline in input file...
var count = 0

for line in input:
  var l = line.split().foldl(a&b)
  var h = toHashSet(l)
  count += h.len
echo "Part one: ", count
count = 0

var hset : HashSet[char]
for entry in input:
  var entry_split = entry.split()
  for i, line in entry_split:
    if i == 0:
      hset = toHashSet(line)
    else:
      hset = intersection(hset, toHashSet(line))
  count += hset.len
echo "Part two: ", count