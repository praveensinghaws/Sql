import mysql.connector

# Establish the connection
con = mysql.connector.connect(
    host='localhost',
    port=3306,
    user='root',
    password='Admin260',
    database='pythontest'
)

# Check if the connection was successful
if con.is_connected():
    print("Successfully connected to the database")

# Close the connection
con.close()