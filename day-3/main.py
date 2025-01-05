from fncs import func

from teacher import Teacher 
# module import 





#executioi will start from here 
if __name__ == "__main__":
    print(func())

    class Student: 
        def __init__(self, name, age):
            self.name = name
            self.age = age

        def display_info(self):
            print(f"Name: {self.name}, Age: {self.age}")

    class Intern(Student,Teacher):
          def __init__(self, name, age, role):
            super.__init__(name,age)
            self.role = role
        
          def display_info(self):
            print(f"Name: {self.name}, Age: {self.age}, Role: {self.role}")  