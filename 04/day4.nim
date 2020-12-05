import strutils, sequtils, re

const input_dirty : seq[string] = slurp("o.txt").split("\n\n")
let input = block:
  var result: seq[string]
  for l in input_dirty:
    result.add(l.split().foldl(a&" "&b))
  result

# Part one
var
  count = 0
  r1 = re".*(ecl:).*"
  r2 = re".*(pid:).*"
  r3 = re".*(eyr:).*"
  r4 = re".*(hcl:).*"
  r5 = re".*(byr:).*"
  r6 = re".*(iyr:).*"
  r7 = re".*(hgt:).*"

for line in input:
  if line =~ r1 and line =~ r2 and line =~ r3 and line =~ r4 and line =~ r5 and line =~ r6 and line =~ r7:
    inc count
echo count

# Part two
count = 0
r1 = re".*(ecl:(amb|blu|brn|gry|grn|hzl|oth))(\s|\n|$).*"
r2 = re".*(pid:[0-9]{9})(\s|\n|$).*"
r3 = re".*(eyr:(202[0-9]|2030))(\s|\n|$).*"
r4 = re".*(hcl:#[a-f0-9]{6})(\s|\n|$).*"
r5 = re".*(byr:(19[2-9][0-9]|200[0-2]))(\s|\n|$).*"
r6 = re".*(iyr:(201[0-9]|2020))(\s|\n|$).*"
r7 = re".*(hgt:((1[5-8][0-9]|19[0-3])cm|(59|6[0-9]|7[0-6])in))(\s|\n|$).*"

for line in input:
  if line =~ r1 and line =~ r2 and line =~ r3 and line =~ r4 and line =~ r5 and line =~ r6 and line =~ r7:
    inc count
    echo line
echo count