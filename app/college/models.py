from app import mysql

class College(object):
    def __init__(self, ID =None, Name=None):
        self.ID = ID
        self.Name = Name

    @classmethod
    def all(cls):
        conn = mysql.connection
        curs = conn.cursor()
        sql = "SELECT * FROM college"
        curs.execute(sql)
        result = curs.fetchall()
        conn.commit()
        curs.close()
        return result

    def add_college(self):
        conn = mysql.connection
        curs = conn.cursor()
        sql = f"INSERT INTO college (id, name) \
            VALUES ('{self.ID}', '{self.Name}')"
        print(sql)
        curs.execute(sql)
        conn.commit()

    @classmethod
    def get_college(cls, id):
        conn =mysql.connection
        curs = conn.cursor()
        sql = "SELECT * FROM  college WHERE id = %s"  
        curs.execute(sql, (id, ))
        result = curs.fetchall()
        conn.commit()
        curs.close()
        return result

    @classmethod
    def delete_college(cls, id):
        try:
            conn = mysql.connection
            curs = conn.cursor()

            sql = f"DELETE from college WHERE id = %s"
            curs.execute(sql, (id,))
            mysql.connection.commit()
            return True
        except:
            return False
