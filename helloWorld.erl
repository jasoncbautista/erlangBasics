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

-export([findMax/1]).
-export([findMax/2]).
-export([addToEndOfList/2]).

% Binary Tree stuff
% -export([addToTreeRight/2]).

-export([higherOrderExample/2]).

% Linked list
-export([newList/0]).
-export([addNode/2]).


-record(node , {data, next}).

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

% addToTreeRight (Tree, NewValue) ->
%     {node, Left, Right} = Tree,
%     CurentValue  =  NewValue,
%     Tree.

% THIS WORKS!!!

% TODO: add empty list catch:


% [ ] find function
% [ ] print function
% [ ] is in list function 
% [ ] binary tre with double linked list

% [ ] double linked list with  reference array?


% Create a new list:
newList() ->
    #node{}.

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% When we have an empty list:
addNode(Node, Data) when Node == #node{} ->
    #node{data=Data};

% This is the case when our last node was null, so we are
% at the end of the list:
addNode(Node, Data) when Node#node.next == undefined ->
    NewNode = #node{data=Data}, 
    #node{next=NewNode, data=Node#node.data};


% If the node we are looking at does not have an undefined
% value we can just keep recreating the list recursively:
addNode(Node, Data) ->
    #node{data=Node#node.data, next=addNode(Node#node.next, Data)}.


% insertAfter(index, List, TargetIndex, Data) ->

% This will involve moving "pointers" around.
% addNodeAfter(data, List, Node, Index) ->

% This will involve adding  after a certain data match
% addDataAfter(data, List, NewData, MatchData) ->


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

findMax( Array_ ) ->
    [CurrentMax| Tail] = Array_,
    findMax(Tail, CurrentMax).

findMax([], CurrentMax) ->
    CurrentMax;

findMax(Array_, CurrentMax) ->
    [CurrentNumber | Tail] = Array_,
    case CurrentMax > CurrentNumber of
        true ->
            findMax(Tail, CurrentMax);
        false ->
            findMax(Tail, CurrentNumber)
    end.

% getEnd(Array) ->

addToEndOfList([H|Tail1], Tail2) ->

    testing("Head:"), 
    testing(H), 

    testing("Tail1:"), 
    printList(Tail1),

    testing("Tail2:"), 
    printList(Tail2),

    [H|addToEndOfList(Tail1, Tail2)];

addToEndOfList([], Tail) -> Tail.

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

    Tuple = {"One", 2, {"inner", "tupple"}},
    {O, T, I} = Tuple,
    io:format(" Tuple: ~p \n Tuple Inner Part: ~p \n\n", [Tuple, i]),

    NewList = addToEndOfList([1,2,3], [4,5,6]),
    testing("NewList:"),
    printList(NewList),
    testing(":: NewList:"),
    basicPrint("Native append to list"), ComboLists = [100, 200] ++ [300, 400],
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
%

%%%%%%%%%%%%%%%%%%%%%

% RUNNING ERLANG:
% erlc helloWorld.erl && erl -noshell -s helloWorld start -s init stop
%
%
%[ ] tuples
%[x] records
%[ ] pointers
%[x] linked list
%[ ] Removing from linked list / tree / array
%[ ] Binary tree
%[x] max / min 
%
