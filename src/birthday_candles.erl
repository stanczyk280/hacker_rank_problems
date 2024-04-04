-module(birthday_candles).

-export([main/1]).

%problem description: https://www.hackerrank.com/challenges/birthday-cake-candles/problem

main(Candles)->
    calculate_highest_candle_amount(Candles).

calculate_highest_candle_amount(Candles)->
    HighestCandle = lists:max(Candles),
    Count = length(lists:filter(fun(X) -> X == HighestCandle end, Candles)),
    Count.
