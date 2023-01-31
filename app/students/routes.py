from flask import render_template, redirect, request, jsonify, url_for, flash
from . import student_bp
from app.students.models import Students
from app.students.forms import StudentForm
from app import mysql, IntegrityError
from cloudinary.uploader import upload


@student_bp.route('/')
def index():
    student = Students.all()
    return render_template('index.html', student = student)

@student_bp.route("/add_student", methods=['POST', 'GET'])
def add_student():
    form = StudentForm()
    if request.method == 'POST':
        if form.validate_on_submit():
            img_url = None
            if form.image.data:
                f = request.files[form.image.name].read()
                response = upload(f, folder="Students")
                img_url = response['url']
            else:
                img_url = "https://placehold.jp/300x300.png" 

            student = Students(IDN = form.IDN.data, Fname = form.Fname.data,
                               Mname = form.Mname.data ,Lname = form.Lname.data ,
                               Gender= form.Gender.data ,College= form.College.data,
                               Course= form.Courses.data, YearLevel= form.Year_Level.data,
                               img_url= img_url)
            try:
                student.add_student()
                flash('Student added successfully', 'success')
                return redirect(url_for('.index'))
            except IntegrityError as e:
                if "UNIQUE constraint failed" in str(e.args):
                    flash('Error: Student with this IDN already exists.', 'danger')
                else:
                    flash('Error: Failed to add student.', 'danger')
        else:
            flash('Error: All fields are required.', 'danger')
            print(form.errors)
    return render_template('students/add_student.html', form=form)






@student_bp.route("/edit_student/<id>", methods = ['POST','GET'])
def edit_student(id):
    student = Students.get_student(id)
    if student:
        student = student[0]
        student_data = {
            'IDN': student[0],
            'Fname': student[1],
            'Mname': student[2],
            'Lname': student[3],
            'Gender': student[4],
            'College': student[5],
            'Courses': student[6],
            'Year_Level': student[7],
            'image': student[8]
        }
        form = StudentForm()
        
        form.image.data = student_data['image']
        form.IDN.data = student_data['IDN']
        form.Fname.data = student_data['Fname']
        form.Mname.data = student_data['Mname']
        form.Lname.data = student_data['Lname']
        form.Gender.data = student_data['Gender']
        form.College.data = student_data['College']
        form.Courses.data = student_data['Courses']
        form.Year_Level.data = student_data['Year_Level']
        print(student_data)
        print(student_data['image'])
        print(student)
        return render_template('students/edit_student.html', form=form, student=student_data)
    else:
        flash('Student not found', 'danger')
        return redirect(url_for('.add_student'))
        
@student_bp.route("/update/<id>", methods = ['POST'])
def update_student(id):
    student = Students.get_student(id)
    if student:
        student = student[0]
        form = StudentForm()
        if form.validate_on_submit():
            if form.image.data:
                f = request.files[form.image.name].read()
                response = upload(f, folder="Students")
                img_url = response['url']
            else:
                img_url = student[8]

            conn = mysql.connection
            curs = conn.cursor()
            sql = "UPDATE students SET firstname = %s, middlename = %s, lastname = %s, gender = %s, college_id = %s, course_id = %s, yearlevel = %s, img_url = %s WHERE id = %s"
            curs.execute(sql, (form.Fname.data, form.Mname.data, form.Lname.data, form.Gender.data, form.College.data, form.Courses.data, form.Year_Level.data, img_url, id))
            conn.commit()
            curs.close()
            flash('Student updated successfully', 'success')
            return redirect(url_for('.index'))
        return render_template('students/edit_student.html', form=form, student=student)
    else:
        flash('Student not found', 'danger')
        return redirect(url_for('.add_student'))





@student_bp.route('/get-courses', methods=['GET'])
def get_courses():
    college = request.args.get('college')
    conn = mysql.connection
    curs = conn.cursor()
    sql = "SELECT courses.id FROM courses JOIN college ON courses.college_id = college.id WHERE college.id = %s"
    curs.execute(sql, (college, ))
    result = curs.fetchall()
    conn.commit()
    curs.close()
    courses = [("","")] +  [(str(r[0]), r[0]) for r in result]
    return jsonify({'courses': courses})




@student_bp.route('/get-colleges', methods=['GET'])
def get_colleges():
    conn = mysql.connection
    curs = conn.cursor()
    sql = "SELECT id FROM college"
    curs.execute(sql)
    result = curs.fetchall()
    conn.commit()
    curs.close()
    colleges = [("","")] +  [(str(r[0]), r[0]) for r in result]
    return jsonify({'colleges': colleges})

@student_bp.route('/delete/<id>', methods = ['POST', 'GET'])
def delete(id):
    student = Students.get_student(id)
    if student:
        if request.method == 'GET':
            if Students.delete(id):
                return redirect(url_for('.index'))
            else:
                return "Error Occured. Try Again!"
    else:
        return "No student found with the given ID."

