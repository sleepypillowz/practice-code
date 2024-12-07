from django import forms

class RegistrationForm(forms.Form):
	last_name = forms.CharField(max_length=64)
	first_name = forms.CharField(max_length=64)
	age = forms.IntegerField()
	gender = forms.CharField(max_length=16)
	mobile_number = forms.CharField(max_length=15)
	birthday = forms.DateField()