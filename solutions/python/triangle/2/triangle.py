def valid_triangle(f):
    def inner(sides):
        return 2*max(sides) < sum(sides) and f(sides)
    return inner

@valid_triangle
def equilateral(sides):
    return len(set(sides)) == 1 

@valid_triangle
def isosceles(sides):
    return len(set(sides)) in [1, 2]

@valid_triangle
def scalene(sides):
    return len(set(sides)) == 3
