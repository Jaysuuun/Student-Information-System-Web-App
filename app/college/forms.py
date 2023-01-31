from flask_wtf import FlaskForm
from wtforms import StringField, validators, SubmitField


class CollegeForm(FlaskForm):
    COLLEGE = StringField('COLLEGE',[validators.DataRequired()])
    NAME = StringField('NAME',[validators.DataRequired()])
    Submit = SubmitField('ADD')