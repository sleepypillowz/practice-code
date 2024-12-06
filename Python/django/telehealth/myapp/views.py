from django.shortcuts import render
from .models import Patient

# Create your views here.
def index(request):
	patients = Patient.objects.all()
	context = {'patients':patients}
	return render(request, 'patients/index.html', context)