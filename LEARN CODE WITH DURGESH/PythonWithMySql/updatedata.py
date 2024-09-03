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

    def delete(self, user_id):
        if self.mycur:
            try:
                # SQL query to delete a record based on userId
                query = 'DELETE FROM users WHERE userId = %s;'
                self.mycur.execute(query, (user_id,))
                self.con.commit()  # Commit the transaction
                print(f"User with userId {user_id} deleted successfully")
            except Error as e:
                print(f"Error deleting data: {e}")

    def update(self, user_id, username=None, phone=None):
        if self.mycur:
            try:
                # Base SQL query
                query = 'UPDATE users SET '
                params = []
                
                # Add fields to update
                if username is not None:
                    query += 'username = %s, '
                    params.append(username)
                if phone is not None:
                    query += 'phone = %s, '
                    params.append(phone)
                
                # Remove trailing comma and space
                query = query.rstrip(', ')
                query += ' WHERE userId = %s;'
                params.append(user_id)
                
                # Execute the query
                self.mycur.execute(query, tuple(params))
                self.con.commit()  # Commit the transaction
                print(f"User with userId {user_id} updated successfully")
            except Error as e:
                print(f"Error updating data: {e}")

    def close(self):
        if self.mycur and self.con:
            self.mycur.close()
            self.con.close()

# Example of creating an instance of DBHelper and updating a user
db_helper = DBHelper()
db_helper.update(user_id=1001, username='newname', phone='1234567890')  # Update user with userId 1001
db_helper.fetch_all()  # Optionally, fetch all users to verify the update
db_helper.close()