-module(linkedList).
-export([new/0]).
-export([append/2]).


-export([test/0]).
-record(node, {data, next}).


% Create a new list:
new() ->
    #node{}.

%% Appends a new node to the list. %%

% Catches the case when we have the tail of our list.
% Essentially implemententing a base case.
append(CurrentNode, Data) when  CurrentNode#node.next == undefined ->
    NewNode = #node{data=Data},
    #node{data=CurrentNode#node.data, next=NewNode};

% When we have a next node defined, we just keep iterating.
% Essentially we are recreating the old list.
append(CurrentNode, Data) ->
    #node{data=CurrentNode#node.data, next=append(CurrentNode#node.next, Data)} .
test() ->
    % simple printing of a list
    1.


