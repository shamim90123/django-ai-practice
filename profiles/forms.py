from django import forms
from .models import University
from .models import AgeGender

class UniversityForm(forms.ModelForm):
    class Meta:
        model = University
        fields = ['name', 'location', 'established_year', 'website']

class AgeGenderPrediction(forms.ModelForm):
    class Meta:
        model = AgeGender
        fields = ['image']