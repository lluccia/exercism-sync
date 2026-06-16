def color_code(color):
    return ([ 'black', 'brown', 'red', 'orange', 'yellow', 'green', 'blue', 'violet', 'grey', 'white' ]
            .index(color))

def value(colors):
    return int("%s%s" % (color_code(colors[0]), color_code(colors[1])))
