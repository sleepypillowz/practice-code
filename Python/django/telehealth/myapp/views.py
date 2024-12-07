from django.shortcuts import render, redirect
from .models import Patient
from .form import RegistrationForm

def home(request):
	return render(request, 'home.html')

def register(request):
	if request.method == "POST":
		form = RegistrationForm(request.POST)
		if form.is_valid():
			print("form is valid")
			return redirect('sucess')
	else:
		form = RegistrationForm()
	context = {'form':form}
	return render(request, 'register.html', context)

def sucess(request):
	return render(request, 'sucess.html')

# Patient
def patients(request):
	patients = Patient.objects.all()
	context = {'patients':patients}
	return render(request, 'patients.html', context)