from textblob import TextBlob
from django.contrib.auth.models import Permission
from django.contrib.contenttypes.models import ContentType
from .models import University

def analyze_sentiment(text):
    blob = TextBlob(text)
    return blob.sentiment  # Returns a Sentiment object (polarity, subjectivity)

def create_custom_permissions():
    # Use an existing model's ContentType (or create a new one)
    content_type = ContentType.objects.get_for_model(University)
    
    # Create a custom permission for viewing universities
    Permission.objects.get_or_create(
        codename='view_university',
        name='Can view university',
        content_type=content_type,
    )