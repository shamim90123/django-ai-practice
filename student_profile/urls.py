"""
URL configuration for student_profile project.

The `urlpatterns` list routes URLs to views. For more information please see:
    https://docs.djangoproject.com/en/5.1/topics/http/urls/
Examples:
Function views
    1. Add an import:  from my_app import views
    2. Add a URL to urlpatterns:  path('', views.home, name='home')
Class-based views
    1. Add an import:  from other_app.views import Home
    2. Add a URL to urlpatterns:  path('', Home.as_view(), name='home')
Including another URLconf
    1. Import the include() function: from django.urls import include, path
    2. Add a URL to urlpatterns:  path('blog/', include('blog.urls'))
"""
from django.contrib import admin
from django.urls import path, include

from django.contrib.auth import views as auth_views
from profiles import views  # Assuming the home page is in the profiles app

# from .views import sentiment_view

# urlpatterns = [
#     path('admin/', admin.site.urls),
#       path('', include('profiles.urls')),  # Include the 'profiles' app's URLs
# ]

from django.conf import settings
from django.conf.urls.static import static


# Add this at the end of the URL patterns to serve media files

urlpatterns = [
    path('', auth_views.LoginView.as_view(), name='login'),  # Login page
    path('logout/', views.custom_logout, name='logout'),  # Logout page
    path('home/', views.home, name='home'),  # Home page
    path('about/', views.about, name='about'),  # About page (if you have one)
    path('admin/', admin.site.urls),  # Admin page
    path('register/', views.register, name='register'),
    path('university/', views.university_list, name='university_list'),  # List all universities
    path('university/create/', views.university_create, name='university_create'),  # Create a university
    path('university/<int:id>/update/', views.university_update, name='university_update'),  # Update a university
    path('university/<int:id>/delete/', views.university_delete, name='university_delete'),  # Delete a university
    path('sentiment/', views.sentiment_view, name='sentiment'),
    path('recognize-face/', views.recognize_face, name='recognize_face'),
    path('recognize-age-gender/', views.recognize_age_gender, name='recognize_age_gender'),
]

if settings.DEBUG:
    urlpatterns += static(settings.MEDIA_URL, document_root=settings.MEDIA_ROOT)