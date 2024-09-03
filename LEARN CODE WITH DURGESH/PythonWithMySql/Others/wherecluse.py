import mysql.connector
from mysql.connector import Error

class DBHelper:
    def __init__(self):
        try:
            # Establish the connection
            self.con = mysql.connector.connect(
                host='localhost',
                port=3306,
                user='root',
                password='Admin260',
                database='pythontest'
            )
            self.mycur = self.con.cursor()
        except Error as e:
            print(f"Error connecting to MySQL: {e}")
            self.con = None
            self.mycur = None

    def fetch_all(self, user_id=None):
        if self.mycur:
            try:
                # SQL query with optional WHERE clause
                if user_id is not None:
                    query = 'SELECT * FROM users WHERE userId = %s;'
                    self.mycur.execute(query, (user_id,))
                else:
                    query = 'SELECT * FROM users;'
                    self.mycur.execute(query)
                
                # Fetch and print all rows
                for row in self.mycur.fetchall():
                    print("UserID : ", row[0])
                    print("UserName : ", row[1])
                    print("Mobile : ", row[2])
            except Error as e:
                print(f"Error fetching data: {e}")

    def close(self):
        if self.mycur and self.con:
            self.mycur.close()
            self.con.close()

# Example of creating an instance of DBHelper and fetching users with a specific userId
db_helper = DBHelper()
db_helper.fetch_all(user_id=1001)  # Fetch users with userId 1001
db_helper.close()