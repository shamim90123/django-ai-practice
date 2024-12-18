import face_recognition
import numpy as np
from .models import StudentProfile
import cv2
from bs4 import BeautifulSoup
import os
from django.conf import settings  # Import Django settings


# age gender prediction start here
# Age and Gender Labels
AGE_RANGES = ['(0-2)', '(4-6)', '(8-12)', '(15-20)', '(25-32)', '(38-43)', '(48-53)', '(60-100)']
GENDER_LIST = ['Male', 'Female']

# Load pre-trained models from models folder
AGE_MODEL = "./ai_models/age_net.caffemodel"
AGE_PROTO = "./ai_models/age_deploy.prototxt"
GENDER_MODEL = "./ai_models/gender_net.caffemodel"
GENDER_PROTO = "./ai_models/gender_deploy.prototxt"

# Load networks
age_net = cv2.dnn.readNetFromCaffe(AGE_PROTO, AGE_MODEL)
gender_net = cv2.dnn.readNetFromCaffe(GENDER_PROTO, GENDER_MODEL)
# age gender prediction end here


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


class AgeGenderPredictionService:
    @staticmethod
    def predict_age_gender(image_path):
        """
        Predict age and gender from the given image.

        Args:
            image_path (str): Path to the image file.

        Returns:
            dict: Predicted age range and gender.
        """
        # Load image
        image = cv2.imread(image_path)

        if image is None:
            raise ValueError("Invalid image file or path.")

        # Preprocess image
        face_blob = cv2.dnn.blobFromImage(
            image, 1.0, (227, 227),
            (78.4263377603, 87.7689143744, 114.895847746),
            swapRB=False
        )

        # Gender Prediction
        gender_net.setInput(face_blob)
        gender_preds = gender_net.forward()
        gender = GENDER_LIST[gender_preds[0].argmax()]

        # Age Prediction
        age_net.setInput(face_blob)
        age_preds = age_net.forward()
        age = AGE_RANGES[age_preds[0].argmax()]

        return {"age": age, "gender": gender}
    
class WebScrapingService:
    @staticmethod
    def web_scrap(file_name):
        """
        Get the title of a web page.

        Args:
            url (str): URL of the web page.

        Returns:
            str: Title of the web page.
        """
     
        # with open('web_scraping_page.html') as html_file:
        #     content = html_file.read()
        #     print(content)
        # Get the file's absolute path
        #file_path = os.path.join(os.path.dirname(__file__), "../templates", file_name)
        file_path = os.path.join(settings.BASE_DIR, "profiles/templates", file_name)

        try:
            # Open and read the file
            with open(file_path, 'r', encoding='utf-8') as html_file:
                content = html_file.read()

            # Use BeautifulSoup to parse the HTML
            soup = BeautifulSoup(content, 'html.parser')

            # Example: Extract all <h1> tags
            h1_tags = [tag.text for tag in soup.find_all('h1')]

            return {
                "status": "success",
                "h1_tags": h1_tags,
            }

        except FileNotFoundError:
            return {
                "status": "error",
                "message": f"File {file_path} not found.",
            }