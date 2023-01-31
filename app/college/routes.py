from flask import render_template, redirect, request, jsonify, url_for, flash
from . import college_bp
from app.college.models import College
from app.college.forms import CollegeForm
from app import mysql, IntegrityError


@college_bp.route('/College')
def college():
    coll = College.all()
    return render_template('college/college.html', coll = coll)

@college_bp.route("/add_college", methods=['POST', 'GET'])
def add_college():
    form = CollegeForm()
    if request.method == 'POST':
        if form.validate_on_submit():
            college = College(ID = form.COLLEGE.data, Name = form.NAME.data,)
            try:
                college.add_college()
                flash('College added successfully', 'success')
                return redirect(url_for('.add_college'))
            except IntegrityError as e:
                if "UNIQUE constraint failed" in str(e.args):
                    flash('Error: College with this ID already exists.', 'danger')
                else:
                    flash('Error: Failed to add college.', 'danger')
        else:
            flash('Error: All fields are required.', 'danger')
            print(form.errors)
    return render_template('college/add_college.html', form=form)

@college_bp.route("/edit_college/<id>", methods = ['POST','GET'])
def edit_college(id):
    college = College.get_college(id)
    if college:
        college = college[0]
        college_data = {
            'COLLEGE': college[0],
            'NAME': college[1],
        }
        form = CollegeForm()
        
        form.COLLEGE.data = college_data['COLLEGE']
        form.NAME.data = college_data['NAME']
        
        return render_template('college/edit_college.html', form=form, college=college_data)
    else:
        flash('college not found', 'danger')
        return redirect(url_for('.add_college'))


@college_bp.route("/update_college/<id>", methods = ['POST'])
def update_college(id):
    college = College.get_college(id)
    if college:
        college = college[0]
        form = CollegeForm()
        if form.validate_on_submit():
            conn = mysql.connection
            curs = conn.cursor()
            sql = "UPDATE college SET name = %s WHERE id = %s"
            curs.execute(sql, (form.NAME.data, id))
            conn.commit()
            curs.close()
            flash('college updated successfully', 'success')
            return redirect(url_for('.college'))
        return render_template('colleges/edit_college.html', form=form, college=college)
    else:
        flash('college not found', 'danger')
        return redirect(url_for('.add_college'))

@college_bp.route('/delete_college/<id>', methods = ['POST', 'GET'])
def delete_college(id):
    college = College.get_college(id)
    if college:
        if request.method == 'GET':
            if College.delete_college(id):
                return redirect(url_for('.college'))
            else:
                return "Error Occured. Try Again!"
    else:
        return "No college found with the given ID."