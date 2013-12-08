% hello world program
-module(helloWorld).
-export([start/0]).

-export([testing/0]).
-export([isEven/1]).



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




isEven(CurrentValue) ->
    Is_even = (CurrentValue  rem 2) =:= 0,
    case  Is_even  of 
        true ->
            io:fwrite("even\n"),
            true;
        false ->
            io:fwrite("odd\n"),
            false
    end.



start() ->
    % io:fwrite("wassa\n"),
    % testing("one two"),
    % testing("Coolio"),
    WasEven = isEven(6),


    testing(WasEven),
    testing().


%%%%%%%%%%%%%%%%%%%%%
% Questions 
% [ ]  Why can functions be lowecase but variables not? atoms?
% [ ] Why  do we have  "; "  vs ", " and  "." ???? 

