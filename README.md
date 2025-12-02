# Django, AI Practice Project

A web application built with Django for managing student profiles, including login/logout functionality, an admin interface, and a dynamic menu with a fixed sidebar.

## Features

- User Authentication (Login/Logout)
- Admin Panel for managing data
- Sidebar Navigation with fixed header
- Responsive design for all devices
- MySQL database integration
- authorization
- crud
- redesign as large application
- Sentiment Analysis
- Face Recognition
- Age and Gender Prediction
- GraphQL basic implementation 
- django isolated project through venv

---

## Getting Started

### Prerequisites

Ensure you have the following installed:
- Python (>= 3.8)
- MySQL
- pip (Python package manager)
- Virtual environment tool (optional but recommended)

---

### Installation

1. **Clone the repository:**
   ```bash
   git clone https://github.com/yourusername/student-profile.git
   cd student-profile
Set up a virtual environment (optional but recommended):
 

 
### run the requirements
    pip install -r /path/to/requirements.txt
### run the virtual environment
    python -m venv venv
    source venv/bin/activate    # On Linux/Mac
    venv\Scripts\activate       # On Windows

## Install dependencies:
    pip install -r requirements.txt

## Set up the database:
    Create a MySQL database (e.g., student_profile).

### Update the DATABASES section in settings.py:

    DATABASES = {
        'default': {
            'ENGINE': 'django.db.backends.mysql',
            'NAME': 'student_profile',
            'USER': 'root',
            'PASSWORD': 'shamim@901',
            'HOST': '127.0.0.1',
            'PORT': '3306',
        }
    }

### Apply migrations:

## run the code in bash
    python manage.py makemigrations
    python manage.py migrate

## Run the development server:
    python manage.py runserver

## Open the application in your browser:
    Login page: http://127.0.0.1:8000/
    Admin panel: http://127.0.0.1:8000/admin/

## Technologies Used
Backend: Django (Python)
Database: MySQL
Frontend: HTML, CSS (with custom styles)
- **Python**
- **Django**
- **MySQL**
- **Bootstrap 5**
- **Bootstrap icon**

### Contributing
- **Feel free to submit issues, fork the repository, and create pull requests. All contributions are welcome!**

### Author
- **MD Shamim Reza**
- **opt.shamim@gmail.com**

### Screen Shot
<img src="/project_screen_shot.png" width="300" alt="Screenshot">
