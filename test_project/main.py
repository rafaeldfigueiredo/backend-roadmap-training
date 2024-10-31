class User:
    def __init__(self, name, age):
        self.name = name
        self.age = age
    def get_user(self):
        print(f"{self.name} is {self.age}")

class Admin_User(User):
    def __init__(self, name, age):
        super().__init__(name,age)
    def get_user(self):
        print(f"{self.name} is an Admin")

user_name = input("Name:\nR: ")
user_age = input("\nAge:\nR: ")

Admin_User(user_name,user_age).get_user()