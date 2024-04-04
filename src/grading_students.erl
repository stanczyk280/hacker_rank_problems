-module(grading_students).

-export([main/1]).

%problem description: https://www.hackerrank.com/challenges/grading/problem

main(Grades) ->
    RoundedGrades = calculate_rounded_grades(Grades),
    io:format("~w~n", [RoundedGrades]).

calculate_rounded_grades(Grades) ->
    calculate_rounded_grades(Grades, []).

calculate_rounded_grades([], NewGrades) -> lists:reverse(NewGrades);
calculate_rounded_grades([Grade|Rest], NewGrades) ->
    RoundedGrade = calculate_rounded_grade(Grade),
    calculate_rounded_grades(Rest, [RoundedGrade|NewGrades]).

calculate_rounded_grade(Grade) ->
    case Grade < 38 of
        true -> Grade;
        false -> 
            case Grade rem 5 of
                3 -> Grade + 2;
                4 -> Grade + 1;
                _ -> Grade
            end
    end.

