from django.shortcuts import render, redirect, get_object_or_404
from django.contrib.auth.decorators import login_required
from django.contrib.auth import logout
from django.contrib.auth.forms import UserCreationForm
from django.contrib import messages
from .forms import UniversityForm

@login_required
def home(request):
    return render(request, 'profiles/home.html')  # Adjust path as necessary

def about(request):
    return render(request, 'profiles/about.html')  # Adjust path as necessary

def custom_logout(request):
    logout(request)
    return redirect('login')  # Redirect to login page after logout

def register(request):
    if request.method == "POST":
        form = UserCreationForm(request.POST)
        if form.is_valid():
            form.save()
            username = form.cleaned_data.get('username')
            messages.success(request, f"Account created for {username}!")
            return redirect('login')  # Redirect to the login page after successful registration
    else:
        form = UserCreationForm()
    return render(request, 'registration/register.html', {'form': form})

def university_list(request):
    universities = University.objects.all()  # Fetch all university data
    return render(request, 'university/university_list.html', {'universities': universities})

def add_university(request):
    if request.method == 'POST':
        form = UniversityForm(request.POST)
        if form.is_valid():
            form.save()
            return redirect('university_list')  # Redirect back to the list page
    else:
        form = UniversityForm()
    return render(request, 'add_university.html', {'form': form})

def edit_university(request, pk):
    university = get_object_or_404(University, pk=pk)
    if request.method == 'POST':
        form = UniversityForm(request.POST, instance=university)
        if form.is_valid():
            form.save()
            return redirect('university_list')
    else:
        form = UniversityForm(instance=university)
    return render(request, 'add_university.html', {'form': form})

def delete_university(request, pk):
    university = get_object_or_404(University, pk=pk)
    if request.method == 'POST':
        university.delete()
        return redirect('university_list')
    return render(request, 'confirm_delete.html', {'university': university})