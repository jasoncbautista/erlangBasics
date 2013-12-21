% hello world program
-module(helloWorld).

-import(lists, [map/2]).

-export([start/0]).
-export([testing/0]).
-export([testing/1]).
-export([isEven/1]).
-export([printEvenNumbers/2]).

-export([basicPrint/1]).
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


basicPrint(RandomVariable) ->
    testing(RandomVariable).

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


findMax(Array_, currentMax) ->
    ,

findMax(Array_, currentMax) ->
    .

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

    basicPrint("Native append to list"),
    ComboLists = [100, 200] ++ [300, 400],
    printList(ComboLists),
    
    printList([1, 2, 3]),

    Cool=2+1,
    basicPrint(Cool),

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

    testing().


%%%%%%%%%%%%%%%%%%%%%
% Questions 
% [x] calling my functions from erl 
% open erl in dir of file:
%   c(helloWorld).
%   helloWorld:basicPrint("testing").
%
% [ ]  Why can functions be lowecase but variables not? atoms?
% [ ] Why  do we have  "; "  vs ", " and  "." ???? 
% [ ] how to use fxns instead of case?
% [ ] compile and run? 
% [ ] *** how to import lists.seq ??? how to know how to import?
% [ ] *** how to import in erl repl? 
% [ ] how to deal with lists that can also be strings??
% [ ]  why did not declaring testing/1  was fine?? because of testing/0?

%%%%%%%%%%%%%%%%%%%%%

% RUNNING ERLANG:
% erlc helloWorld.erl && erl -noshell -s helloWorld start -s init stop
%
%
%
%
%[ ] Binary tree
%[ ] max / min 
%
