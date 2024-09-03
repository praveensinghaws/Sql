from db_helper import DBHelper

# Create an instance of DBHelper
db_helper = DBHelper()

# Fetch all records
db_helper.fetch_all()

# Update a user
db_helper.update(user_id=1001, username='newname', phone='1234567890')

# Delete a user
db_helper.delete(user_id=1005)

# Fetch all records again to verify changes
db_helper.fetch_all()

# Close the connection
db_helper.close()