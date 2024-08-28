# variable
msg = "Hello World"
print(msg)

# if, else if else
a = 33
b = 200
if b > a:
  print("b is greater than a")
elif a == b:
  print("a and b are equal")
else:
  print("a is greater than b")

# shorthand if
if a > b: print("a is greater than b")

# shorthand if else (ternary)
print("A") if a > b else print("B")

# while loop
i = 1
while i < 6:
  print(i)
  if i == 3:
    break
  i+= 1

# for loop
fruits = ["apple", "banana", "cherry"]
for x in fruits:
  print(x)

# loop string
for x in "banana":
  print(x)

# functions
def my_function():
  print("Hello from a function")

# arguments
def my_function(fname):
  print(fname + " Refsnes")

my_function("Emil")
my_function("Tobias")
my_function("Linus")