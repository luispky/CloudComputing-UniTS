import random
from locust import HttpUser, TaskSet, task, between
from requests.auth import HTTPBasicAuth
import os

class UserBehavior(TaskSet):

    # Define the weight of the upload_data_size task
    # The weight is used to control the frequency of the task
    # The higher the weight, the more frequent the task
    # For sizes of 1Kb and 1Mb, the weight is okay to set to 10\
    # For 1Gb, the weight should be set to 1 because it takes a long time to upload
    upload_data_task_weight = 10
    size = "MB"

    def on_start(self):
        max_users = 30 
        # Define user credentials
        self.user_name = f"user{random.randint(1, max_users)}"  
        self.password = "Abcd1234abcd\!"  
        self.auth = HTTPBasicAuth(self.user_name, self.password)

    @task(10)
    def propfind(self):
        self.client.request("PROPFIND", "/remote.php/webdav", auth=self.auth)

    @task(10)
    def login(self):
        self.client.get("/login", auth=self.auth)

    @task(5)
    def read_file(self):
        self.client.get(f"/remote.php/dav/files/{self.user_name}/Documents/Example.md", auth=self.auth)
        # obtain the file path using the following command
        # docker exec nextcloud ls -la data/userxyz/files/Documents/

    @task(upload_data_task_weight)
    def upload_data_size(self):
        # Simulate uploading data
        file_name = f"1{self.size}_random_{random.randint(1, 10)}"
        with open(f"/data/1{self.size}_random_data.bin", "rb") as file:
            file_content = file.read()
        self.client.put(f"/remote.php/dav/files/{self.user_name}/{file_name}", 
                        data=file_content, 
                        auth=self.auth)

class WebsiteUser(HttpUser):
    tasks = [UserBehavior]
    wait_time = between(5, 15) 

