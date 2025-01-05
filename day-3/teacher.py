


class Teacher : 
    def __init__(self,name ,age , subject):
        self.name = name
        self.age = age
        self.subject = subject
    def display_info(self):
        print(f"Name: {self.name}, Age: {self.age}, Subject: {self.subject}")