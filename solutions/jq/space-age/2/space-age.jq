def two_decimal: ((. * 100) | round) / 100;

def ratio(planet):
    {
        "Mercury": 0.2408467,
        "Venus": 0.61519726,
        "Earth": 1.0,
        "Mars": 1.8808158,
        "Jupiter": 11.862615,
        "Saturn": 29.447498,
        "Uranus": 84.016846,
        "Neptune": 164.79132,
    } as $ratios |
    $ratios[planet] // ( "not a planet" | halt_error)
;

def seconds_in_earth_year: 31557600;

.seconds / seconds_in_earth_year / ratio(.planet) | two_decimal
