from db_helper import DBHelper

def main():
    db_helper = DBHelper()
    
    while True:
        print("************* Welcome **********")
        print()
        print("Press 1 to insert new user")
        print("Press 2 to display all users")
        print("Press 3 to delete user")
        print("Press 4 to update user")
        print("Press 5 to exit program")
        
        try:
            choice = int(input("Enter your choice: "))
            
            if choice == 1:
                # Insert new user
                user_id = int(input("Enter user ID: "))
                username = input("Enter username: ")
                phone = input("Enter phone number: ")
                db_helper.insert_users(user_id, username, phone)
            
            elif choice == 2:
                # Display all users
                db_helper.fetch_all()
                
            elif choice == 3:
                # Delete user
                user_id = int(input("Enter user ID to delete: "))
                db_helper.delete(user_id)
                
            elif choice == 4:
                # Update user
                user_id = int(input("Enter user ID to update: "))
                username = input("Enter new username (leave blank if no change): ")
                phone = input("Enter new phone number (leave blank if no change): ")
                db_helper.update(user_id, username if username else None, phone if phone else None)
                
            elif choice == 5:
                db_helper.close()
                break
                
            else:
                print("Invalid input! Try again.")
                
        except Exception as e:
            print(e)
            print("Invalid details! Try again.")

if __name__ == "__main__":
    main()