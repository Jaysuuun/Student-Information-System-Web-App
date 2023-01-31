from app import mysql

class Course(object):
    def __init__(self, ID =None, Name=None, college_id =None):
        self.ID = ID
        self.Name = Name
        self.college_id = college_id

    @classmethod
    def all(cls):
        conn = mysql.connection
        curs = conn.cursor()
        sql = "SELECT id, name FROM courses"
        curs.execute(sql)
        result = curs.fetchall()
        conn.commit()
        curs.close()
        return result
    
    def add_course(self):
        conn = mysql.connection
        curs = conn.cursor()
        sql = f"INSERT INTO courses (id, name, college_id) \
            VALUES ('{self.ID}', '{self.Name}', '{self.college_id}')"
        print(sql)
        curs.execute(sql)
        conn.commit()

    @classmethod
    def get_courses(cls, id):
        conn =mysql.connection
        curs = conn.cursor()
        sql = "SELECT * FROM  courses WHERE id = %s"  
        curs.execute(sql, (id, ))
        result = curs.fetchall()
        conn.commit()
        curs.close()
        return result

    @classmethod
    def delete_courses(cls, id):
        try:
            conn = mysql.connection
            curs = conn.cursor()

            sql = f"DELETE from courses WHERE id = %s"
            curs.execute(sql, (id,))
            mysql.connection.commit()
            return True
        except:
            return False