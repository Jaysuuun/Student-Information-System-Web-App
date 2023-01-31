from flask_wtf import FlaskForm
from wtforms import StringField, validators, SubmitField, SelectField
from app import mysql

class CourseForm(FlaskForm):
    COURSE = StringField('COURSE',[validators.DataRequired()])
    CNAME = StringField('NAME',[validators.DataRequired()])
    COLLEGEID = SelectField('COLLEGE', [validators.DataRequired()])
    Submit = SubmitField('ADD')

    def __init__(self):
        super(CourseForm, self).__init__()
        self.COLLEGEID.choices = self.get_colleges()

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