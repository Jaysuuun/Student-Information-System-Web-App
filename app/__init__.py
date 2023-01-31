from flask import Flask
from flask_mysql_connector import MySQL
from config import DB_USERNAME, DB_PASSWORD, DB_NAME, DB_HOST, SECRET_KEY, CLOUDINARY_CLOUD_NAME,CLOUDINARY_API_KEY,CLOUDINARY_API_SECRET
from mysql.connector.errors import IntegrityError
from flask_wtf.csrf import CSRFProtect
import cloudinary

mysql = MySQL()


def create_app(test_config=None):
    app = Flask(__name__, instance_relative_config=True)
    app.config.from_mapping(
        SECRET_KEY=SECRET_KEY,
        MYSQL_USER=DB_USERNAME,
        MYSQL_PASSWORD=DB_PASSWORD,
        MYSQL_DATABASE=DB_NAME,
        MYSQL_HOST=DB_HOST,
        
    )

    cloudinary.config(
        cloud_name = CLOUDINARY_CLOUD_NAME,
        cloud_api_key = CLOUDINARY_API_KEY,
        cloud_api_secret = CLOUDINARY_API_SECRET
    )

    mysql.init_app(app)
    CSRFProtect(app)

    from .students import student_bp as student_blueprint
    app.register_blueprint(student_blueprint)

    from .college import college_bp as college_blueprint
    app.register_blueprint(college_blueprint)

    from .course import course_bp as course_blueprint
    app.register_blueprint(course_blueprint)

    return app