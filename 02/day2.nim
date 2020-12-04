import strutils, re

const input = block:
  var result : seq[string]
  for line in staticRead("input.txt").splitLines:
    if line != "":
       result.add line
  result

let regex = re"(\d+)-(\d+) (\w): (\w+)" 

var
  range_start, range_end, first, second : int
  character : char
  password : string
  valid_counter1 = 0
  valid_counter2 = 0

for line in input:
  if line =~ regex:
    range_start = matches[0].parseInt
    range_end = matches[1].parseInt
    
    first = range_start - 1
    second = range_end - 1

    character = matches[2][0]
    password = matches[3]
  
  if password.count(character) in range_start..range_end:
    inc valid_counter1
  
  if password[first] == character and password[second] != character:
    inc valid_counter2
  elif password[second] == character and password[first] != character:
    inc valid_counter2

echo "Part one:"
echo valid_counter1
echo "\nPart two:"
echo valid_counter2
