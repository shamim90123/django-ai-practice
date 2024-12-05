from django.shortcuts import render, redirect, get_object_or_404
from django.contrib.auth.decorators import login_required
from django.contrib.auth import logout
from django.contrib.auth.forms import UserCreationForm
from django.contrib import messages
from .models import University
from .forms import UniversityForm
from .utils import analyze_sentiment

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
    universities = University.objects.all()
    # return render(request, 'profiles.templates.profiles.university.university_list.html', {'universities': universities})
    return render(request, 'profiles/university/university_list.html', {'universities': universities})

def university_create(request):
    if request.method == 'POST':
        form = UniversityForm(request.POST)
        if form.is_valid():
            form.save()
            return redirect('university_list')
    else:
        form = UniversityForm()
    return render(request, 'profiles/university/university_form.html', {'form': form})

def university_update(request, id):
    university = get_object_or_404(University, id=id)
    if request.method == 'POST':
        form = UniversityForm(request.POST, instance=university)
        if form.is_valid():
            form.save()
            return redirect('university_list')
    else:
        form = UniversityForm(instance=university)
    return render(request, 'profiles/university/university_form.html', {'form': form})

def university_delete(request, id):
    university = get_object_or_404(University, id=id)
    if request.method == 'POST':
        university.delete()
        return redirect('university_list')
    return render(request, 'profiles/university/university_confirm_delete.html', {'university': university})

def sentiment_view(request):
    if request.method == "POST":
        text = request.POST.get("text")
        result = analyze_sentiment(text)  # Get polarity and subjectivity
        return render(request, "sentiment.html", {"text": text, "result": result})
    return render(request, "sentiment.html")