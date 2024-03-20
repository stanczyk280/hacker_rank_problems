-module(plus_minus).
-export([main/1]).

%problem description: https://www.hackerrank.com/challenges/plus-minus

main(Arr)->
    Values = calculate_values(Arr),
    Len = length(Arr),
    {PosRatio,NegRatio,EqRatio} = calculate_ratios(Values,Len),
    io:format("~.6f~n", [PosRatio]),
    io:format("~.6f~n", [NegRatio]),
    io:format("~.6f~n", [EqRatio]).



calculate_values(Arr)->
    [Pos,Neg,Eq] = calculate_values(Arr, 0, 0, 0),
    [Pos,Neg,Eq].


calculate_values([],Pos,Neg,Eq)->
    [Pos,Neg,Eq];
calculate_values([Head|Tail],Pos,Neg,Eq)->
    {NewPos, NewNeg, NewEq} = case Head == 0 of
                                    true -> {Pos,Neg,Eq+1};
                                    false -> 
                                        case Head > 0 of
                                            true -> {Pos+1,Neg,Eq};
                                            false -> {Pos,Neg+1,Eq}
                                        end
                                end,
calculate_values(Tail,NewPos,NewNeg,NewEq).

calculate_ratios([Pos,Neg,Eq],Len)->
    {Pos/Len,Neg/Len,Eq/Len}.
    
