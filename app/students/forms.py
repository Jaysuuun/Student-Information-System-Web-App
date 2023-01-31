from flask_wtf import FlaskForm
from wtforms import StringField, validators, SubmitField, SelectField, FileField
from wtforms.validators import Optional, DataRequired
from flask_wtf.file import FileAllowed
from app import mysql


year_level = (' ' ,'1st Year','2nd Year','3rd Year','4th Year')

gen = (' ', 'Male', 'Female', 'Other')
'''
class NonValidatingSelectMultiplefield(SelectField):
    def pre_validate(self, form):
        pass
'''
class StudentForm(FlaskForm):
    image = FileField('Choose an Image', validators=[FileAllowed(['jpg', 'jpeg', 'png'], 'Images only!'),])
    IDN = StringField('ID',[validators.DataRequired(), validators.Length(min=9, max=9)])
    Fname = StringField('First Name', [validators.DataRequired()])
    Mname = StringField('Middle Name', [validators.DataRequired()])
    Lname = StringField('Last Name', [validators.DataRequired()])
    Gender = SelectField('Gender', choices=gen, validators=[Optional()])
    Year_Level = SelectField('Year Level', choices=year_level, validators=[DataRequired()])
    College = SelectField('College',choices =[], validate_choice=False)
    Courses = SelectField('Courses',choices =[], validate_choice=False)
    Submit = SubmitField('ADD')
    
    '''
    def __init__(self):
        super(StudentForm, self).__init__()
        self.College.choices = self.get_colleges()
        self.Courses.choices = self.get_courses()

    def get_colleges(self):
        conn = mysql.connection
        curs = conn.cursor()

        sql = "SELECT id FROM college"
        curs.execute(sql)
        result = curs.fetchall()
        conn.commit()
        curs.close()
        colleges = [("", "")] + [(str(r[0]), r[0]) for r in result]
        print(colleges)
        return colleges

    def get_courses(self):
       
        conn = mysql.connection
        curs = conn.cursor()
        sql = "SELECT id from courses"
        curs.execute(sql)
        result = curs.fetchall()
        conn.commit()
        curs.close()
        courses = [(str(r[0]), r[0]) for r in result]
        return courses
    '''