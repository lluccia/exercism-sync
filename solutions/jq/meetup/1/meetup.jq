def days_of_week: { "Sunday": 0, "Monday": 1, "Tuesday": 2, "Wednesday": 3, "Thursday": 4, "Friday": 5, "Saturday": 6 };

def month_idx: 1;
def weekday_idx: 6;

def filter_month_overflow($month): select(.[month_idx] == $month - 1);
def filter_day_of_week($dayofweek): select(.[weekday_idx] == days_of_week[$dayofweek]);

def find_week($descriptor):
    if   $descriptor == "teenth" then .[] | select(.[2] >= 13 and .[2] <= 19)
    elif $descriptor == "first"  then first
    elif $descriptor == "second" then .[1]
    elif $descriptor == "third"  then .[2]
    elif $descriptor == "fourth" then .[3]
    elif $descriptor == "last"   then last
    else "invalid descriptor '\($descriptor)'" | halt_error
    end
;

def date_only: split("T")[0];

. as $input 
| [ range(1;32) | [ $input.year, $input.month - 1, . , 0, 0, 0, 0, 0]
   | mktime | gmtime 
   | filter_month_overflow($input.month)
   | filter_day_of_week($input.dayofweek)
  ]
| find_week($input.week)
| todate
| date_only
