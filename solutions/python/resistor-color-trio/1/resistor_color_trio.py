def color_code(color):
    return ([ 'black', 'brown', 'red', 'orange', 'yellow', 'green', 'blue', 'violet', 'grey', 'white' ]
            .index(color))

def label(colors):
    value = "%s%s%s" % (
            color_code(colors[0]),
            color_code(colors[1]),
            color_code(colors[2]) * "0",
        )

    prefixes = [ "", "kilo", "mega", "giga" ]

    magnitude = 0

    while value.endswith("000") and magnitude < len(prefixes) - 1:
        magnitude += 1
        value = value[:-3]

    
    return str(int(value)) + " " + prefixes[magnitude] + "ohms"
