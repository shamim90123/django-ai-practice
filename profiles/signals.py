# myapp/signals.py
from django.contrib.auth.models import User
from django.db.models.signals import post_save
from django.dispatch import receiver
from django.core.mail import send_mail

@receiver(post_save, sender=User)
def send_welcome_email(sender, instance, created, **kwargs):
    if created:  # Only send email for new user registrations
        subject = "Welcome to Our Platform"
        message = f"Hello {instance.username},\n\nThank you for registering on our platform. We're excited to have you!"
        from_email = "your-email@gmail.com"
        recipient_list = [instance.email]

        send_mail(subject, message, from_email, recipient_list)
