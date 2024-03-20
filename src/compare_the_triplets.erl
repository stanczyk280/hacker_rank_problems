-module(compare_the_triplets).
-export([main/2]).

%problem description: https://www.hackerrank.com/challenges/compare-the-triplets

main(A,B) ->
    compare(A,B).

compare(A,B)->
    [ScoreA, ScoreB] = compare(A,B,0,0),
    [ScoreA,ScoreB].

compare([],[],ScoreA,ScoreB)->
    [ScoreA,ScoreB];
compare([AHead | ATail], [BHead | BTail], ScoreA, ScoreB) ->
    {NewScoreA, NewScoreB} = case AHead of 
                                 BHead -> {ScoreA,ScoreB};
                                 _ -> 
                                    case AHead > BHead of
                                        true -> {ScoreA+1,ScoreB};
                                        false -> {ScoreA,ScoreB+1}
                                    end
                                end,
compare(ATail,BTail,NewScoreA,NewScoreB).
