-module(time_conversion).

-export([main/1]).

%problem description: https://www.hackerrank.com/challenges/time-conversion

main(Time) ->
    convert_time(Time).

convert_time(Time) ->
    case string:substr(Time, 9, 2) of
        "AM" -> 
            convert_am_time(Time);
        "PM" -> 
            convert_pm_time(Time)
    end.


convert_am_time(Time) ->
    case string:substr(Time, 1, 2) of
        "12" -> io:format("00~s~n", [string:substr(Time, 3, 6)]);
        _ -> io:format("~s~n", [string:substr(Time, 1, 8)])
    end.

convert_pm_time(Time) ->
    case string:substr(Time, 1, 2) of
        "12" -> io:format("12~s~n", [string:substr(Time, 3, 6)]);
        _ -> 
            Hours = list_to_integer(string:substr(Time, 1, 2)),
            NewHours = Hours + 12,
            io:format("~p~s~n", [NewHours, string:substr(Time, 3, 6)])
    end.

