from flask import render_template, redirect, request, jsonify, url_for, flash
from . import course_bp
from app.course.models import Course
from app.course.forms import CourseForm
from app import mysql, IntegrityError

@course_bp.route('/Course')
def course():
    cour = Course.all()
    return render_template('courses/course.html', cour = cour)

@course_bp.route("/add_courses", methods=['POST', 'GET'])
def add_courses():
    form = CourseForm()
    if request.method == 'POST':
        if form.validate_on_submit():
            course = Course(ID = form.COURSE.data, Name = form.CNAME.data, college_id = form.COLLEGEID.data )
            try:
                course.add_course()
                flash('course added successfully', 'success')
                return redirect(url_for('.add_courses'))
            except IntegrityError as e:
                if "UNIQUE constraint failed" in str(e.args):
                    flash('Error: course with this ID already exists.', 'danger')
                else:
                    flash('Error: Failed to add course.', 'danger')
        else:
            flash('Error: All fields are required.', 'danger')
            print(form.errors)
    return render_template('courses/add_courses.html', form=form)

@course_bp.route("/edit_course/<id>", methods = ['POST','GET'])
def edit_course(id):
    course = Course.get_courses(id)
    if course:
        course = course[0]
        course_data = {
            'COURSE': course[0],
            'NAME': course[1],
            'COLLEGE': course[2]
        }
        form = CourseForm()
        
        form.COURSE.data = course_data['COURSE']
        form.CNAME.data = course_data['NAME']
        form.COLLEGEID.data= course_data['COLLEGE']
        
        return render_template('courses/edit_courses.html', form=form, course=course_data)
    else:
        flash('course not found', 'danger')
        return redirect(url_for('.add_course'))


@course_bp.route("/update_course/<id>", methods = ['POST'])
def update_course(id):
    course = Course.get_courses(id)
    if course:
        course = course[0]
        form = CourseForm()
        if form.validate_on_submit():
            conn = mysql.connection
            curs = conn.cursor()
            sql = "UPDATE courses SET name = %s, college_id = %s WHERE id = %s"
            curs.execute(sql, (form.CNAME.data,form.COLLEGEID.data, id))
            conn.commit()
            curs.close()
            flash('course updated successfully', 'success')
            return redirect(url_for('.course'))
        return render_template('courses/edit_courses.html', form=form, course=course)
    else:
        flash('course not found', 'danger')
        return redirect(url_for('.add_course'))

@course_bp.route('/delete_course/<id>', methods = ['POST', 'GET'])
def delete_course(id):
    course = Course.get_courses(id)
    if course:
        if request.method == 'GET':
            if Course.delete_courses(id):
                return redirect(url_for('.course'))
            else:
                return "Error Occured. Try Again!"
    else:
        return "No course found with the given ID."