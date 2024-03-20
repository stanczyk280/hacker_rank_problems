-module(diagonal_difference).
-export([main/1]).

%problem description: https://www.hackerrank.com/challenges/diagonal-difference

main(Matrix)->
    calculate(Matrix).

calculate(Matrix)->
    Diagonal=calculate_diagonal(Matrix),
    Opposing_diagonal=calculate_opposing_diagonal(Matrix),
    abs(Diagonal-Opposing_diagonal).

calculate_diagonal(Matrix)->
    calculate_diagonal(Matrix, 0, 1).

calculate_diagonal([], Sum, _)->
    Sum;
calculate_diagonal([Row|Rest], Sum, Index)->
    NewSum = Sum + lists:nth(Index,Row),
    calculate_diagonal(Rest,NewSum,Index+1).


calculate_opposing_diagonal(Matrix)->
    calculate_opposing_diagonal(Matrix, 0, length(Matrix)).
calculate_opposing_diagonal([],Sum,_)->
    Sum;
calculate_opposing_diagonal([Row|Rest],Sum,Index)->
    NewSum = Sum + lists:nth(Index,Row),
    calculate_opposing_diagonal(Rest, NewSum, Index-1).