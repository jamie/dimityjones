input = STDIN.read

left = 0
right = input.size - 1

while left < right
  print input[left]
  print input[right]
  left += 1
  right -= 1
end
if left == right
  print input[left]
end
