package techpalace

import "strings"

func WelcomeMessage(customer string) string {
    return "Welcome to the Tech Palace, " + strings.ToUpper(customer)
}

func AddBorder(welcomeMsg string, numStarsPerLine int) string {
    var border string = strings.Repeat("*", numStarsPerLine)
    return border + "\n" + welcomeMsg + "\n" + border
}

func CleanupMessage(oldMsg string) string {
    return strings.TrimSpace(strings.ReplaceAll(oldMsg, "*",  ""))
}
