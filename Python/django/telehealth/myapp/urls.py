from django.urls import path
from . import views

urlpatterns = [
	path('', views.home, name='home'),
	path('register/', views.register, name='register'),
	path('sucess/', views.sucess, name='sucess'),
	path('patients/', views.patients, name='patients'),
]