# Student Information System Web Application

This project was a requirement for my Application Development class back in 2022. The app was built using Python Flask framework, HTML, CSS, and JavaScript with MySQL as the database.

## Features
- Simple CRUD (Create, Read, Update, Delete) operations
- Manage colleges, college courses, and student records
- Associate students with their respective colleges and courses
- Cloudinary API integration for student picture storage

## Technologies Used
- Python Flask (backend)
- HTML, CSS, JavaScript (frontend)
- MySQL (database)
- Cloudinary API (image storage)

## Prerequisites
- Python 3.x
- MySQL server
- Cloudinary account (for image storage)

## 📦 How to Run

## 1. Clone the repository:
   ```bash
   git clone https://github.com/Jaysuuun/Student-Information-System-Web-App.git
   ```

## 2. Create a .env file:
    Create a .env file in the root directory with the following format:
   ```bash
   DB_USERNAME=
    DB_PASSWORD=
    DB_NAME=
    DB_HOST=
    SECRET_KEY=
    CLOUDINARY_CLOUD_NAME=
    CLOUDINARY_API_KEY=
    CLOUDINARY_API_SECRET=

   ```

## 3. Set up a virtual environment:
   ## Windows:
   ```shell
    py -3 -m venv .venv
    .venv\Scripts\activate

   ```
   ## Linux: 
   ```bash
    python3 -m venv .venv
    source .venv/bin/activate
   ```

## 4. Install dependencies
   ```shell
    pip install -r requirements.txt
   ```

## 5. Set up the database
   Create a MySQL database with your preferred name (e.g. siswebapp). Then run the SQL file provided in the project, or copy its contents and execute them manually.

## 6. Run the application:
   ```shell
   python run.py
   ```

## NOTES
   - Feel free to modify or upgrade your own version of this web application.
   - Please note that some dependencies may be outdated. It is recommended to upgrade them for better security and compatibility.

