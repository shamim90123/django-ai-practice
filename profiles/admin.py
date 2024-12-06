from django.contrib import admin

# Register your models here.
from .models import Student
from .models import University
from .models import StudentProfile


admin.site.register(Student)
admin.site.register(University)
admin.site.register(StudentProfile)