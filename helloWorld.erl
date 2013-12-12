% hello world program
-module(helloWorld).

-import(lists, [map/2]).

-export([start/0]).
-export([testing/0]).
-export([isEven/1]).
-export([printEvenNumbers/2]).


-export([printList/1]).

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


% [ ] map function
% [ ] filter function
% [ ] lambda function

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


printList([H|T]) ->
    testing(H),
    printList(T);
printList([]) ->
    true.



start() ->
    % io:fwrite("wassa\n"),
    % testing("one two"),
    % testing("Coolio"),
    % [ X || X <- lists:seq(1, 100), X > 20, X rem 2 =:= 0].

    % printEvenNumbers(-2, 5100),
    % printList(lists.seq(1, 10)),

    printList([1, 2, 3]),

    cool=2+1,

    map(fun(X) -> 
                % r =  2 * X, 
                testing(X),
                testing(X),
                2 * X 
        end, [1,2,3,4,5]),

    testing().


%%%%%%%%%%%%%%%%%%%%%
% Questions 
% [ ]  Why can functions be lowecase but variables not? atoms?
% [ ] Why  do we have  "; "  vs ", " and  "." ???? 
% [ ] how to use fxns instead of case?
% [ ] compile and run? 
% [ ] *** how to import lists.seq ??? how to know how to import?
% [ ] *** how to import in erl repl? 

%%%%%%%%%%%%%%%%%%%%%



% RUNNING ERLANG:
% erlc helloWorld.erl && erl -noshell -s helloWorld start -s init stop
%
%
