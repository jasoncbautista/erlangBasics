-module(linkedList).
-export([new/0]).
-export([append/2]).
-export([valueExists/2]).

-export([test/0]).

% Records
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
valueExists(List, Value) when List#node.data == Value ->
    true;

valueExists(List, Value) when List#node.next == undefined ->
    false;

valueExists(List, Value) ->
    valueExists(List#node.next, Value).
    

% Basic test of linked list.
test() ->
    % simple printing of a list
    SampleList = linkedList:new(),
    SampleList2 = linkedList:append(SampleList, "Cool"),
    SampleList3 = linkedList:append(SampleList2, "Next"),
    linkedList:valueExists(SampleList3, "Next").
