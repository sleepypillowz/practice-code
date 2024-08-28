# ordered, unchangeable, not unique
# used to group related data
student = ("Bro", 21, "male")

print(student.count("Bro")) # 1
print(student.index("male")) # 2

for x in student: # Bro 21 male
  print(x)

if "Bro" in student:
  print("Bro is here!")