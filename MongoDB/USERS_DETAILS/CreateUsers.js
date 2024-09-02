// mongo_commands.js

// Switch to the 'admin' database
db = db.getSiblingDB('admin');

// Create a new user in the 'admin' database
db.createUser({
    user: "praveen",
    pwd: "Admin260",
    roles: ["readWrite", "dbAdmin"]
});

// Show collections in the current database
printjson(db.getCollectionNames()); 

