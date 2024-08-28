# unique, unchangeable, unordered 

numbers = [1, 1, 2, 3, 4]
first = set(numbers)
second = {1, 5}

print(first | second) # {1, 2, 3, 4, 5}
print(first & second) # {1}
print(first - second) # {2, 3, 4}
print(first ^ second) # {2, 3, 4, 5}

if 1 in first:
  print("yes")