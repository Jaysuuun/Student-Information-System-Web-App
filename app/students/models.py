from app import mysql

class Students(object):
    def __init__(self, IDN=None, Fname=None, Mname=None,Lname=None,Gender=None, College=None,Course=None,YearLevel = None, img_url = None):
        self.IDN = IDN
        self.Fname = Fname
        self.Mname = Mname
        self.Lname = Lname
        self.Gender = Gender
        self.College = College
        self.Course = Course
        self.YearLevel = YearLevel
        self.img_url = img_url

    @classmethod
    def all(cls):
        conn = mysql.connection
        curs = conn.cursor()
        sql = "SELECT students.ID, students.firstname, students.middlename, students.lastname, students.gender, students.college_id, courses.name, students.yearlevel, students.img_url FROM students LEFT JOIN courses ON students.course_id = courses.id ORDER BY students.ID"
        curs.execute(sql)
        result = curs.fetchall()
        conn.commit()
        curs.close()
        return result

   
    def add_student(self):
        conn = mysql.connection
        curs = conn.cursor()
        sql = f"INSERT INTO students (ID, firstname, middlename, lastname, gender, college_id, course_id, yearlevel, img_url) \
            VALUES ('{self.IDN}', '{self.Fname}','{self.Mname}','{self.Lname}','{self.Gender}','{self.College}','{self.Course}','{self.YearLevel}','{self.img_url}')"
        print(sql)
        curs.execute(sql)

        conn.commit()
        
    @classmethod
    def get_student(cls, id):
        conn =mysql.connection
        curs = conn.cursor()
        sql = "SELECT * FROM  students WHERE id = %s"  
        curs.execute(sql, (id, ))
        result = curs.fetchall()
        conn.commit()
        curs.close()
        return result

  

    @classmethod
    def delete(cls, id):
        try:
            conn = mysql.connection
            curs = conn.cursor()

            sql = f"DELETE from students WHERE ID = %s"
            curs.execute(sql, (id,))
            mysql.connection.commit()
            return True
        except:
            return False
