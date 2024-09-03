import mysql.connector

class DBHelper:
    def __init__(self):
        # Establish the connection
        self.con = mysql.connector.connect(
            host='localhost',
            port=3306,
            user='root',
            password='Admin260',
            database='pythontest'
        )
        
        # Create a cursor object
        mycur = self.con.cursor()
        
        # SQL query to create the table
        query = 'CREATE TABLE IF NOT EXISTS users (userId INT PRIMARY KEY, username VARCHAR(200), phone VARCHAR(12))'
        
        # Execute the query
        mycur.execute(query)
        print("Users Table Created")

        # Close the cursor and connection
        mycur.close()
        self.con.close()

# Example of creating an instance of DBHelper
db_helper = DBHelper()