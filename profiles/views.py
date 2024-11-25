from django.shortcuts import render, redirect
from django.contrib.auth.decorators import login_required
from django.contrib.auth import logout



@login_required
def home(request):
    return render(request, 'profiles/home.html')  # Adjust path as necessary

def about(request):
    return render(request, 'profiles/about.html')  # Adjust path as necessary

def custom_logout(request):
    logout(request)
    return redirect('login')  # Redirect to login page after logout