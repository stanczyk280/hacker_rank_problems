-module(min_max_sum).

-export([main/1]).

%https://www.hackerrank.com/challenges/mini-max-sum/problem
main(Arr) ->
    calculate_min_max_sum(Arr).


calculate_min_max_sum(Arr) ->
    SortedArr = lists:sort(Arr),
    [_Head|MaxArr] = SortedArr,
    MinArr = lists:droplast(SortedArr),
    Max = lists:sum(MaxArr),
    Min = lists:sum(MinArr),
    io:format("~p ~p~n",[Min,Max]).