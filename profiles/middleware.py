from django.shortcuts import redirect
from django.urls import reverse

class CustomMiddleware:
    def __init__(self, get_response):
        self.get_response = get_response

    def __call__(self, request):
        print(f"Requested: {request.method} {request.path}")
        response = self.get_response(request)
        return response
    
class IPBlockerMiddleware:
    BLOCKED_IPS = ['192.168.1.1', '127.0.0.1']

    def __init__(self, get_response):
        self.get_response = get_response

    def __call__(self, request):

        print(f"REMOTE_ADDR: {request.META.get('REMOTE_ADDR')}")
        print(f"HTTP_X_FORWARDED_FOR: {request.META.get('HTTP_X_FORWARDED_FOR')}")

        print("IPBlockerMiddleware invoked")  # Debug message

        ip = request.META.get('HTTP_X_FORWARDED_FOR') or request.META.get('REMOTE_ADDR')
        print(f"Detected IP: {ip}")

        if ip in self.BLOCKED_IPS:
            from django.http import HttpResponseForbidden
            return HttpResponseForbidden("Access denied")

        return self.get_response(request)
    
class LoginRedirectMiddleware:
    def __init__(self, get_response):
        self.get_response = get_response

    def __call__(self, request):
        # Define allowed pages for non-authenticated users
        allowed_urls = [
            reverse('login'),        # The login page
            reverse('register'),     # The register page
        ]
        
        # If the user is logged in and is on the base URL, redirect to home
        if request.user.is_authenticated and request.path == '/':
            return redirect('home')

        # If the user is not logged in and is on a page that's not allowed, redirect to base URL
        if not request.user.is_authenticated and request.path not in allowed_urls:
            return redirect('/')  # Redirect to the base URL if not logged in and trying to access restricted pages

        # Continue with the normal request-response cycle
        return self.get_response(request)