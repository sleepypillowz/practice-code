from django import forms
from django.contrib.auth.models import User

class RegistrationForm(forms.ModelForm):
    password = forms.CharField(widget=forms.PasswordInput(attrs={'placeholder': 'Enter a password'}))
    confirm_password = forms.CharField(widget=forms.PasswordInput(attrs={'placeholder': 'Confirm Password'}))
    
    class Meta:
        model = User
        fields = ['username', 'password', 'confirm_password']
    
    def clean(self):
        cleaned_data = super().clean()
        password = cleaned_data.get('password')
        confirm_password = cleaned_data.get('confirm_password')
    
        if password and confirm_password and password != confirm_password:
            raise forms.ValidationError("Passwords do not match!")
        return cleaned_data
          

class SettingsForm(forms.Form):
    first_name = forms.CharField(
        max_length=64,
        widget=forms.TextInput(attrs={'placeholder': 'Enter your first name'})
    )
    last_name = forms.CharField(
        max_length=64,
        widget=forms.TextInput(attrs={'placeholder': 'Enter your last name'})
    )
    birthday = forms.DateField(
        widget=forms.DateInput(attrs={'placeholder': 'Enter your birthday (YYYY-MM-DD)', 'type': 'date'})
    )
