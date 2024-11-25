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

# urlpatterns = [
#     path('admin/', admin.site.urls),
#       path('', include('profiles.urls')),  # Include the 'profiles' app's URLs
# ]

urlpatterns = [
    path('', auth_views.LoginView.as_view(), name='login'),  # Login page
    path('logout/', views.custom_logout, name='logout'),  # Logout page
    path('home/', views.home, name='home'),  # Home page
    path('about/', views.about, name='about'),  # About page (if you have one)
    path('admin/', admin.site.urls),  # Admin page
    path('register/', views.register, name='register'),
    path('universities/', views.university_list, name='university_list'),
    path('universities/add/', views.add_university, name='add_university'),
    path('universities/edit/<int:pk>/', views.edit_university, name='edit_university'),
    path('universities/delete/<int:pk>/', views.delete_university, name='delete_university'),
]