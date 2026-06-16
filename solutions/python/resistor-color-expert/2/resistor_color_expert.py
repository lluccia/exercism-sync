def color_code(color):
    return str([ 'black', 'brown', 'red', 'orange', 'yellow', 'green', 'blue', 'violet', 'grey', 'white' ]
            .index(color))

PREFIXES = [ "", "kilo", "mega", "giga" ]
TOLERANCES = {
        "grey":   "±0.05%",
        "violet": "±0.1%",
        "blue":   "±0.25%",
        "green":  "±0.5%",
        "brown":  "±1%",
        "red":    "±2%",
        "gold":   "±5%",
        "silver": "±10%",
    }

def resistor_label(colors):
    band_count = len(colors)

    value = color_code(colors[0])

    if band_count > 1:
        value += color_code(colors[1])

        if band_count == 5:
            value += color_code(colors[2])

        value += int(color_code(colors[-2])) * "0"

    magnitude = 0

    value = int(value)
    while value >= 1000 and magnitude < len(PREFIXES) - 1:
        print(value)
        magnitude += 1
        value = value / 1000

    if str(value).endswith(".0"):
        value = str(int(value))

    label = str(value) + " " + PREFIXES[magnitude] + "ohms" 

    if band_count > 1:
        label += " " + TOLERANCES[colors[-1]]

    return label
