from django.core.management.base import BaseCommand
from profiles.models import StudentProfile
import face_recognition
import numpy as np
from PIL import Image

class Command(BaseCommand):
    help = "Populate face encodings for existing student profiles"

    def handle(self, *args, **kwargs):
        students = StudentProfile.objects.all()
        self.stdout.write(self.style.NOTICE(f"Found {students.count()} student records"))
        
        for student in students:
            self.stdout.write(self.style.NOTICE(f"Processing student: {student.name}"))
            if student.image and not student.face_encoding:
                try:
                    # Open the image
                    image = Image.open(student.image.path)
                    image_np = np.array(image)

                    # Detect face and generate encoding
                    face_locations = face_recognition.face_locations(image_np)
                    if face_locations:
                        encoding = face_recognition.face_encodings(image_np, face_locations)[0]
                        student.face_encoding = encoding.tobytes()
                        student.save()
                        self.stdout.write(
                            self.style.SUCCESS(f"Face encoding saved for: {student.name}")
                        )
                    else:
                        self.stdout.write(
                            self.style.WARNING(f"No face detected for: {student.name}")
                        )
                except Exception as e:
                    self.stdout.write(
                        self.style.ERROR(f"Error processing {student.name}: {e}")
                    )
            else:
                self.stdout.write(
                    self.style.NOTICE(f"Skipping {student.name}, face encoding already exists.")
                )
