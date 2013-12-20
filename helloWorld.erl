% hello world program
-module(helloWorld).

-import(lists, [map/2]).

-export([start/0]).
-export([testing/0]).
-export([isEven/1]).
-export([printEvenNumbers/2]).

-export([printList/1]).
-export([addToEndOfList/2]).

-export([higherOrderExample/2]).

% [x] Calling other methods
% [x]Mess with switch statements
% [x] Print even numbers
% higher ord fxns
% annonymous fxn 
% [ ] Return even numbers
% [ ] Extract even numbers
% [ ] arrays
% [ ] lists
% [ ] -- append to list
% [ ] tuples
% [ ] binary tree
% [ ] trie? 


% [ ] map function
% [ ] filter function
% [ ] lambda function
% [ ] add elements to array



% [ ] write two programs that talk to each other 
% [ ] monitor with OTP
% [ ] use Dialyzer
%

higherOrderExample(F, X) ->
    F(X).

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


addToEndOfList([H|Tail1], Tail2) ->

    testing("Head:"), 
    testing(H), 

    testing("Tail1:"), 
    printList(Tail1),

    testing("Tail2:"), 
    printList(Tail2),

    [H|addToEndOfList(Tail1, Tail2)];

addToEndOfList([], Tail) ->
    Tail.

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

    NewList = addToEndOfList([1,2,3], [4,5,6]),
    testing("NewList:"),
    printList(NewList),
    testing(":: NewList:"),

    printList([1, 2, 3]),

    Cool=2+1,

    map(fun(X) -> 
                R =  2 * X, 
                testing(R),
                testing(X),
                2 * X 
        end, [1,2,3,4,5]),

    higherOrderExample(fun(X) ->
                testing(X)
        end, [100, 200, 300]),


    M = [1,2,3],
    F = [4| M],
    testing(F),

    L = [F| 5], 

    testing(L),
    testing().




%%%%%%%%%%%%%%%%%%%%%
% Questions 
% [ ] calling my functions from erl 
% [ ]  Why can functions be lowecase but variables not? atoms?
% [ ] Why  do we have  "; "  vs ", " and  "." ???? 
% [ ] how to use fxns instead of case?
% [ ] compile and run? 
% [ ] *** how to import lists.seq ??? how to know how to import?
% [ ] *** how to import in erl repl? 
% [ ] how to deal with lists that can also be strings??

%%%%%%%%%%%%%%%%%%%%%

% RUNNING ERLANG:
% erlc helloWorld.erl && erl -noshell -s helloWorld start -s init stop
%
