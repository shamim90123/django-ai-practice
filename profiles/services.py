import face_recognition
import numpy as np
from .models import StudentProfile

class FaceRecognitionService:
    @staticmethod
    def match_face(uploaded_image_path):
        # Load the uploaded image
        uploaded_image = face_recognition.load_image_file(uploaded_image_path)
        uploaded_encodings = face_recognition.face_encodings(uploaded_image)

        if not uploaded_encodings:
            return None, "No face detected in the uploaded image"

        uploaded_encoding = uploaded_encodings[0]

        # Compare against all student profiles
        for student in StudentProfile.objects.all():
            if student.face_encoding:
                saved_encoding = np.frombuffer(student.face_encoding, dtype=np.float64)
                matches = face_recognition.compare_faces([saved_encoding], uploaded_encoding)
                if matches[0]:
                    return student, None

        return None, "No match found"
