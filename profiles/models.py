from django.db import models

class Student(models.Model):
    first_name = models.CharField(max_length=50)
    last_name = models.CharField(max_length=50)
    email = models.EmailField(unique=True)
    date_of_birth = models.DateField()
    enrollment_date = models.DateField()

    def __str__(self):
        return f"{self.first_name} {self.last_name}"

class University(models.Model):
    name = models.CharField(max_length=255, unique=True)  # University name
    location = models.CharField(max_length=255)  # Location of the university
    established_date = models.DateField()  # Date when the university was established

    def __str__(self):
        return self.name