EAST = (1,0) 
NORTH = (0,1)
WEST = (-1,0)
SOUTH = (0,-1)

class Robot:
    def __init__(self, direction=NORTH, x_pos=0, y_pos=0):
        self.coordinates = (x_pos, y_pos)
        self.direction = direction

    def do_move(self, movement):
        if movement == "R":
            self.direction = (self.direction[1], -self.direction[0])
        elif movement == "L":
            self.direction = (-self.direction[1], self.direction[0])
        elif movement == "A":
            self.coordinates = (self.coordinates[0] + self.direction[0], self.coordinates[1] + self.direction[1])

    def move(self, movements):
        for movement in movements:
            self.do_move(movement)
