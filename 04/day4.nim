import strutils, sequtils, re

const input_dirty : seq[string] = slurp("input.txt").split("\n\n")
let input = block:
  var result: seq[string]
  for l in input_dirty:
    result.add(l.split().foldl(a&" "&b))
  result

# Part one
var
  count = 0
  r1 = (re".*(ecl:).*", re".*(ecl:(amb|blu|brn|gry|grn|hzl|oth))(\s|\n|$).*")
  r2 = (re".*(pid:).*", re".*(pid:[0-9]{9})(\s|\n|$).*")
  r3 = (re".*(eyr:).*", re".*(eyr:(202[0-9]|2030))(\s|\n|$).*")
  r4 = (re".*(hcl:).*", re".*(hcl:#[a-f0-9]{6})(\s|\n|$).*")
  r5 = (re".*(byr:).*", re".*(byr:(19[2-9][0-9]|200[0-2]))(\s|\n|$).*")
  r6 = (re".*(iyr:).*", re".*(iyr:(201[0-9]|2020))(\s|\n|$).*")
  r7 = (re".*(hgt:).*", re".*(hgt:((1[5-8][0-9]|19[0-3])cm|(59|6[0-9]|7[0-6])in))(\s|\n|$).*")

for line in input:
  if line =~ r1[0] and line =~ r2[0] and line =~ r3[0] and line =~ r4[0] and line =~ r5[0] and line =~ r6[0] and line =~ r7[0]:
    inc count
echo "Part one: ", count

# Part two
count = 0
for line in input:
  if line =~ r1[1] and line =~ r2[1] and line =~ r3[1] and line =~ r4[1] and line =~ r5[1] and line =~ r6[1] and line =~ r7[1]:
    inc count
echo "Part two: ", count
