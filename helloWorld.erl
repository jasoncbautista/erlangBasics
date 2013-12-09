% hello world program
-module(helloWorld).
-export([start/0]).
-export([testing/0]).
-export([isEven/1]).
-export([printEvenNumbers/2]).

% [x] Calling other methods
% [x]Mess with switch statements
% [x] Print even numbers
% higher ord fxns
% annonymous fxn 
% [ ] Return even numbers
% [ ] Extract even numbers
% [ ] arrays
% [ ] lists
% [ ] tuples
% [ ] binary tree
% [ ] trie? 


testing() ->
    io:fwrite("Done...\n").


testing(RandomVariable) ->
    io:format("~p \n", [RandomVariable]).

isEven(CurrentValue) ->
    Is_even = (CurrentValue  rem 2) =:= 0,
    case  Is_even  of 
        true ->
            true;
        false ->
            false
    end.

printEvenNumbers(Min, Max) ->
    case Min > Max of
        true -> 
            true;
        false ->
            case isEven(Min) of
                true ->
                    testing(Min),
                    printEvenNumbers(Min+1, Max);
                false ->
                    printEvenNumbers(Min+1, Max)
            end
    end.


start() ->
    % io:fwrite("wassa\n"),
    % testing("one two"),
    % testing("Coolio"),
    % [ X || X <- lists:seq(1, 100), X > 20, X rem 2 =:= 0].

    printEvenNumbers(-2, 5100),

    testing().


%%%%%%%%%%%%%%%%%%%%%
% Questions 
% [ ]  Why can functions be lowecase but variables not? atoms?
% [ ] Why  do we have  "; "  vs ", " and  "." ???? 
% [ ] how to use fxns instead of case?
% [ ] compile and run? 
%%%%%%%%%%%%%%%%%%%%%


