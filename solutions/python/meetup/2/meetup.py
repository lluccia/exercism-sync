from datetime import date
import calendar

class MeetupDayException(ValueError):
    """Exception raised when the Meetup weekday and count do not result in a valid date.

    message: explanation of the error.

    """


__weekdays = ["Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday", "Sunday"]


def __last_day_of_month(year, month):
    return calendar.monthrange(year, month)[1]


def __is_weekday(date_to_check, day_of_week):
    weekday = date_to_check.weekday()
    return day_of_week == __weekdays[weekday]


def __teenth(year, month, day_of_week):
    for day in range(13, 20):
        date_to_check = date(year, month, day)
        if __is_weekday(date_to_check, day_of_week):
            return date_to_check


def __dow_occurrence(year, month, day_of_week, occurrence):
    dow_occurrence = 0
    for day in range(1, __last_day_of_month(year, month)+1):
        date_to_check = date(year, month, day)
        if __is_weekday(date_to_check, day_of_week):
            dow_occurrence += 1
            if dow_occurrence == occurrence:
                return date_to_check

    raise MeetupDayException("That day does not exist.")


def __last(year, month, day_of_week):
    for day in reversed(range(1, __last_day_of_month(year, month)+1)):
        date_to_check = date(year, month, day)
        if __is_weekday(date_to_check, day_of_week):
            return date_to_check


def meetup(year, month, week, day_of_week):
    if week == "teenth":
        return __teenth(year, month, day_of_week)
    if week == "first":
        return __dow_occurrence(year, month, day_of_week, 1)
    if week == "second":
        return __dow_occurrence(year, month, day_of_week, 2)
    if week == "third":
        return __dow_occurrence(year, month, day_of_week, 3)
    if week == "fourth":
        return __dow_occurrence(year, month, day_of_week, 4)
    if week == "fifth":
        return __dow_occurrence(year, month, day_of_week, 5)
    if week == "last":
        return __last(year, month, day_of_week)

    raise MeetupDayException("That day does not exist.")
