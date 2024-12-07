from django.shortcuts import render, redirect
from django.contrib.auth import authenticate, login, logout
from django.contrib.auth.decorators import login_required
from django.contrib.auth.mixins import LoginRequiredMixin
from django.contrib.auth.models import User
from django.views import View

from .models import Patient
from .form import RegistrationForm

def register_view(request):
	if request.method == "POST":
		form = RegistrationForm(request.POST)
		if form.is_valid():
			username = form.cleaned_data.get("username")
			password = form.cleaned_data.get("password")
			user = User.objects.create_user(username=username, password=password)
			login(request, user)
			return redirect('home')
	else:
		form = RegistrationForm()
	return render(request, 'user/register.html', {'form':form})

def login_view(request):
    error_message = None 
    if request.method == "POST":  
        username = request.POST.get("username")  
        password = request.POST.get("password")  
        user = authenticate(request, username=username, password=password)  
        if user is not None:  
            login(request, user)  
            next_url = request.POST.get('next') or request.GET.get('next') or 'home'  
            return redirect(next_url) 
        else:
            error_message = "Invalid credentials"  
    return render(request, 'user/login.html', {'error': error_message})

@login_required
def home_view(request):
	return render(request, 'home.html')

def patients_view(request):
	patients = Patient.objects.all()
	context = {'patients':patients}
	return render(request, 'patients.html', context)

def logout_view(request):
	if request.method == "POST":
		logout(request)
		return redirect('login')
	else:
		return redirect('home')
	
class ProtectedView(LoginRequiredMixin, View):
	login_url = '/login/'
	redirect_field_name = 'next'

	def get(self, request):
		return render(request, 'protected.html')