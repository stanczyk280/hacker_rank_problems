-module(compare_the_triplets).
-export([main/2]).


main(A,B) ->
    compare(A,B).

compare(A,B)->
    [ScoreA, ScoreB] = compare_helper(A,B,0,0),
    [ScoreA,ScoreB].

compare_helper([],[],ScoreA,ScoreB)->
    [ScoreA,ScoreB];
compare_helper([AHead | ATail], [BHead | BTail], ScoreA, ScoreB) ->
    {NewScoreA, NewScoreB} = case AHead of 
                                 BHead -> {ScoreA,ScoreB};
                                 _ -> 
                                    case AHead > BHead of
                                        true -> {ScoreA+1,ScoreB};
                                        false -> {ScoreA,ScoreB+1}
                                    end
                            end,
compare_helper(ATail,BTail,NewScoreA,NewScoreB).