import random


class Robot:

    def __random_letter():
        return chr(random.randint(ord('A'), ord('Z')))

    def __random_digit():
        return str(random.randint(0, 9))

    def __create_name():
        random.seed()
        name = [ Robot.__random_letter(), Robot.__random_letter(),
                 Robot.__random_digit(), Robot.__random_digit(), Robot.__random_digit() ]
        return "".join(name) 
    
    def __init__(self):
        self.name = Robot.__create_name()

    def reset(self):
        self.name = Robot.__create_name()
