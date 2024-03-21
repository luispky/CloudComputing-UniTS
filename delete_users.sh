#!/bin/bash

# Function to delete a user
delete_user() {
    local user_id=$1
    local admin_username=$2
    local admin_password=$3

    curl -X DELETE -u "$admin_username:$admin_password" -H "OCS-APIRequest: true" \
        "http://localhost:8080/ocs/v1.php/cloud/users/$user_id"
}

number_of_users=30
admin_username="admin"
admin_password="password"

# Loop through deleting users
for id in $(seq 1 $number_of_users); do
    user_id="user$id"
    
    # Call the function to delete user
    delete_user $user_id $admin_username $admin_password

    echo "User deleted: $user_id"
done
