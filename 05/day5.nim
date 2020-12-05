import parseutils, strutils

var
  row, column : int
  ids : seq[int]

for line in "input.txt".lines:
  discard line[0..6].replace('F', '0').replace('B', '1').parseBin(row)
  discard line[7..9].replace('R', '1').replace('L', '0').parseBin(column)
  ids.add(8 * row + column)
echo "Part one: ", ids.max

for seat in ids:
  if (seat in ids) and (seat+2 in ids) and (seat+1 notin ids):
    echo "Part two: ", seat+1