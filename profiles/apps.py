# myapp/apps.py
from django.apps import AppConfig

class MyAppConfig(AppConfig):
    default_auto_field = 'django.db.models.BigAutoField'
    name = 'profiles'  # Replace with your actual app name

    def ready(self):
        import profiles.signals  # Ensure signals are loaded
