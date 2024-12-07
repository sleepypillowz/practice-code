from django.urls import path
from . import views

urlpatterns = [
  path('', views.home_view, name='home'),
	path('user/register/', views.register_view, name='register'),
	path('user/login/', views.login_view, name='login'),
	path('user/logout/', views.logout_view, name='logout'),
	path('user/protected/', views.ProtectedView.as_view(), name='protected'),
]