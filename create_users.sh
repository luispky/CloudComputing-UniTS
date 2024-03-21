#!/bin/bash

number_of_users=30

echo "Creating $number_of_users users..."
for id in $(seq 1 $number_of_users); do
  curl -X POST -u admin:password -H "OCS-APIRequest: true" \
    http://localhost:8080/ocs/v1.php/cloud/users \
    -d "userid=user$id" -d "password=Abcd1234abcd\!"
done 
echo "Users created successfully"


echo "Creating testing data..."
# Place a txt file in the directory of each user in order to have a test function
for id in $(seq 1 $number_of_users); do
  command="echo \"Hello World!!! Host machine greets user${id}.\" >> data/user${id}/hello_world.txt"
  docker exec nextcloud bash -c $command
  echo "Data for user${id} created"
done
