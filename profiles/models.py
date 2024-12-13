from django.db import models
import face_recognition
import numpy as np

class Student(models.Model):
    first_name = models.CharField(max_length=50)
    last_name = models.CharField(max_length=50)
    email = models.EmailField(unique=True)
    date_of_birth = models.DateField()
    enrollment_date = models.DateField()

    def __str__(self):
        return f"{self.first_name} {self.last_name}"

class University(models.Model):
    name = models.CharField(max_length=255)
    location = models.CharField(max_length=255)
    established_year = models.IntegerField()
    website = models.URLField(blank=True, null=True)

    def __str__(self):
        return self.name
    
class StudentProfile(models.Model):
    name = models.CharField(max_length=100)
    image = models.ImageField(upload_to='student_images/')
    face_encoding = models.BinaryField(null=True, blank=True)

    def save(self, *args, **kwargs):
        if self.image:
            # Generate face encoding when saving a new image
            from PIL import Image
            image = Image.open(self.image)
            image_np = np.array(image)

            face_locations = face_recognition.face_locations(image_np)
            if face_locations:
                encoding = face_recognition.face_encodings(image_np, face_locations)[0]
                self.face_encoding = encoding.tobytes()

        super().save(*args, **kwargs)

class AgeGender(models.Model):
    image = models.ImageField(upload_to='age_gender_prediction/')
    uploaded_at = models.DateTimeField(auto_now_add=True)

    def __str__(self):
        return f"Image {self.id} - {self.image.name}"