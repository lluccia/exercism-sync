class SpaceAge:

    EARTH_YEARS = {
        "mercury": 0.2408467,
        "venus":   0.61519726,
        "earth":   1.0,
        "mars":    1.8808158,
        "jupiter": 11.862615,
        "saturn":  29.447498,
        "uranus":  84.016846,
        "neptune": 164.79132,
    }

    def __init__(self, seconds):
        self.seconds = seconds

    def _on_reference(self):
        return self.seconds / 31557600

    def on(self, planet):
        return round(self._on_reference() / SpaceAge.EARTH_YEARS[planet], 2)

    def on_earth(self):
        return self.on("earth")

    def on_mercury(self):
        return self.on("mercury")

    def on_venus(self):
        return self.on("venus")

    def on_mars(self):
        return self.on("mars")

    def on_jupiter(self):
        return self.on("jupiter")

    def on_saturn(self):
        return self.on("saturn")

    def on_uranus(self):
        return self.on("uranus")

    def on_neptune(self):
        return self.on("neptune")

