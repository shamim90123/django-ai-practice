from django.shortcuts import render, redirect, get_object_or_404
from django.contrib.auth.decorators import login_required
from django.contrib.auth import logout
from django.contrib.auth.forms import UserCreationForm
from django.contrib import messages
import os
from django.http import JsonResponse

from .utils import analyze_sentiment
from .models import University
from .forms import AgeGenderPrediction
from .forms import UniversityForm
from .services import AgeGenderPredictionService
from .services import FaceRecognitionService
from .services import WebScrapingService


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

def recognize_face(request):
    if request.method == 'POST' and request.FILES.get('image'):
        image = request.FILES['image']
        with open('temp_image.jpg', 'wb+') as temp_file:
            for chunk in image.chunks():
                temp_file.write(chunk)

        student, error = FaceRecognitionService.match_face('temp_image.jpg')

        if student:
            return render(request, "face.html", {'status': 'success', 'student': student.name})
        else:
            return render(request, "face.html", {'status': 'error', 'message': error})

    return render(request, 'face.html')

def recognize_age_gender(request):
    if request.method == 'POST':
        form = AgeGenderPrediction(request.POST, request.FILES)
        if form.is_valid():
            uploaded_image = form.save()  # Save the image
            image_path = uploaded_image.image.path

            # Perform age and gender prediction
            try:
                prediction = AgeGenderPredictionService.predict_age_gender(image_path)
                context = {
                    "form": form,
                    "uploaded_image": uploaded_image,
                    "prediction": prediction,
                }
            except ValueError as e:
                context = {"form": form, "error": str(e)}

            return render(request, "age_gender.html", context)

    else:
        form = AgeGenderPrediction()

    return render(request, "age_gender.html", {"form": form})

def web_scraping(request):
     # Call the web scraping service and get the result
    result = WebScrapingService.web_scrap('web_scraping_page.html')

    # Return the result as a JSON response
    return JsonResponse(result)