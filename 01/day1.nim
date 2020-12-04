import strutils
from sequtils import map

const input = block:
  var result : seq[string]
  for line in staticRead("input.txt").splitLines:
    if line != "": result.add line
  result
  
let input_parsed = input.map(parseInt)

echo "Part one: "
for x in input_parsed:
  for y in input_parsed:
    if (x+y) == 2020:
      echo x*y

echo "\nPart two: "
for x in input_parsed:
  for y in input_parsed:
    for z in input_parsed:
      if (x+y+z) == 2020:
        echo x*y*z

