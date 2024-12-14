from django.contrib import admin
from django.urls import path, include
from django.contrib.auth import views as auth_views
from profiles import views  # Assuming the home page is in the profiles app
from django.conf import settings
from django.conf.urls.static import static
from graphene_django.views import GraphQLView

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
    path("graphql/", GraphQLView.as_view(graphiql=True)),
]

if settings.DEBUG:
    urlpatterns += static(settings.MEDIA_URL, document_root=settings.MEDIA_ROOT)