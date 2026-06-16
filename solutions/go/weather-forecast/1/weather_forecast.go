// Package weather contains weather related functions.
package weather

// CurrentCondition is the weather condition at the last forecasted city.
var CurrentCondition string

// CurrentLocation is the last forecasted city.
var CurrentLocation string

// Forecast shows the current condition at the specified city.
func Forecast(city, condition string) string {
	CurrentLocation, CurrentCondition = city, condition
	return CurrentLocation + " - current weather condition: " + CurrentCondition
}
