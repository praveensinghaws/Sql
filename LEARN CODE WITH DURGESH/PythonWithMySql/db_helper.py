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
        
    def insert_users(self, userId, username, phone):
        query = "INSERT INTO users (userId, username, phone) VALUES (%s, %s, %s)"
        values = (userId, username, phone)
        self.mycur.execute(query, values)
        self.con.commit()  # Commit the transaction
        print("User Data Inserted")
        
    def fetch_all(self):
        query = 'SELECT * FROM users;'
        self.mycur.execute(query)
        
        # Fetch and print all rows
        for row in self.mycur.fetchall():
            print("UserID : ", row[0])
            print("UserName : ", row[1])
            print("Mobile : ", row[2])
            print()
    
    def delete(self, userId):
        query = 'DELETE FROM users WHERE userId = %s'
        self.mycur.execute(query, (userId,))
        self.con.commit()  # Commit the transaction
        print("User Deleted")
        
    def update(self, userId, username=None, phone=None):
        if username:
            query = 'UPDATE users SET username = %s WHERE userId = %s'
            self.mycur.execute(query, (username, userId))
        if phone:
            query = 'UPDATE users SET phone = %s WHERE userId = %s'
            self.mycur.execute(query, (phone, userId))
        self.con.commit()  # Commit the transaction
        print("User Updated")
        
    def close(self):
        # Close the cursor and connection
        self.mycur.close()
        self.con.close()