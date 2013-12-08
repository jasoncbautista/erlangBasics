% hello world program
-module(helloWorld).
-export([start/0]).

-export([testing/0]).
-export([isEven/2]).



% [x] Calling other methods
% [ ]Mess with switch statements

% [ ] Print even numbers
% [ ] arrays
% [ ] lists
% [ ] tuples



% [ ] binary tree
%
% [ ] trie? 



testing() ->
    io:fwrite("testing...\n").



testing(RandomVariable) ->
    io:format("The value is: ~p \n", [RandomVariable]).




isEven(CurrentValue, Ii) ->
    Is_even = (CurrentValue  rem 2) =:= 0,
    case  Is_even  of 
        true ->
            io:fwrite("even\n");
        false ->
            io:fwrite("odd\n")
    end.



start() ->
    io:fwrite("wassa\n"),
    testing("one two"),
    testing("Coolio"),
    isEven(5, 0),
    testing().





