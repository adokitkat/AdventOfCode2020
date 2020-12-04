import sequtils, strutils

const
  tree = '#'
  moveRight = [1, 3, 5, 7, 1]
  moveDown = [1, 1, 1, 1, 2]
  input = slurp("input.txt").split() # Load file to seq[string] (actually like 2D array)
var
  rows = input.len-1
  columns = input[0].len

# Decrease to match indexing from 0
dec rows
dec columns

# Calculate the result
var
  i = 0
  trees, x, y : int
  resultList : seq[int] = @[]
  
for right, down in zip(moveRight, moveDown).items:
  trees = 0
  x = 0
  y = 0

  for row in 0..<rows: # ..< => Prevent overflow]]
    x = (row + 1) * down
    y = ((row + 1) * right) mod (columns + 1)
    
    if x > rows: break # Prevent overflow
    
    if input[x][y] == tree: inc trees # Tree found
  
  resultList.add trees
  
  # Print the first result
  if i == 1:
    echo "Part one: ", trees
  
  inc i

# Print the second result
echo "Part two: ", resultList.foldl(a*b)
