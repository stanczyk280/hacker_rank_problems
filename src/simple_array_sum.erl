-module(simple_array_sum).
-export([arr_sum/1]).

%problem description: https://www.hackerrank.com/challenges/simple-array-sum/problem

arr_sum([])->0;
arr_sum([Head|Tail])->
    Head+arr_sum(Tail).


