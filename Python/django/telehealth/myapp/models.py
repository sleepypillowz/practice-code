from django.db import models

# Create your models here.
GENDER_CHOICES = [
    ('M', 'Male'),
    ('F', 'Female')
]
class Patient(models.Model):
	last_name = models.CharField(max_length=64)
	first_name = models.CharField(max_length=64)
	age = models.IntegerField()
	gender = models.CharField(max_length=16, choices=GENDER_CHOICES)
	mobile_number = models.CharField(max_length=15)
	birthday = models.DateField()

	# This is a string representation of the patients
	def __str__(self):
		return (f"ID:{self.id}: Name: {self.first_name} {self.last_name} Age: {self.age} Gender: {self.gender} Mobile Number: {self.mobile_number} Birthday: {self.birthday}")