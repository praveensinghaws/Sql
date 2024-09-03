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
        self.mycur = self.con.cursor()

    def insert_users(self, users):
        # Insert data into the table
        for userId, username, phone in users:
            query = "INSERT INTO users (userId, username, phone) VALUES (%s, %s, %s)"
            values = (userId, username, phone)
            self.mycur.execute(query, values)
        self.con.commit()  # Commit the transaction
        print("Users Data Inserted")

    def close(self):
        # Close the cursor and connection
        self.mycur.close()
        self.con.close()

# Example of creating an instance of DBHelper
db_helper = DBHelper()

# Data to insert
users = [
    (1001, 'praveen', '9876543210'),
    (1002, 'amit', '9876543211'),
    (1003, 'rajiv', '9876543212'),
    (1004, 'lata', '9876543213'),
    (1005, 'priya', '9876543214')
]

# Insert users and close the connection
db_helper.insert_users(users)
db_helper.close()