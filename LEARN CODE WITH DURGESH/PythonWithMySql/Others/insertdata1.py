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
        
        # SQL query to insert data into the table
        query = """
        INSERT INTO users (userId, username, phone) VALUES
        (1001, 'praveen', '9876543210'),
        (1002, 'amit', '9876543211'),
        (1003, 'rajiv', '9876543212'),
        (1004, 'lata', '9876543213'),
        (1005, 'priya', '9876543214');
        """
        
        # Execute the query
        mycur.execute(query)
        self.con.commit()  # Commit the transaction
        print("Users Data Inserted")

        # Close the cursor and connection
        mycur.close()
        self.con.close()

# Example of creating an instance of DBHelper
db_helper = DBHelper()