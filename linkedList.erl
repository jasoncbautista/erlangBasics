-module(linkedList).
-export([new/0]).
-export([append/2]).
-export([valueExists/2]).
-export([insertAfter/4]).

-export([test/0]).

% Records
-record(node, {data, next}).


% Create a new list:
new() ->
    #node{}.

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%% Appends a new node to the list. %%
%%

% Catches the case when our list is empty:
append(CurrentNode, Data) when  CurrentNode == #node{}->
    #node{data=Data};

% Catches the case when we have the tail of our list.
% Essentially implemententing a base case.
append(CurrentNode, Data) when  CurrentNode#node.next == undefined ->
    NewNode = #node{data=Data},
    #node{data=CurrentNode#node.data, next=NewNode};

% When we have a next node defined, we just keep iterating.
% Essentially we are recreating the old list.
append(CurrentNode, Data) ->
    #node{data=CurrentNode#node.data, next=append(CurrentNode#node.next, Data)} .

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

insertAfter(data, List, TargetData, Data) when List#node.data == TargetData ->
    NewNode = #node{data=Data, next=List#node.next},
    #node{data=List#node.data, next=NewNode};

insertAfter(data, List, TargetData, Data) ->
    #node{data=List#node.data, next=insertAfter(data, List#node.next, TargetData, Data)}.

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


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
    SampleList2 = linkedList:append(SampleList, "One"),
    SampleList3 = linkedList:append(SampleList2, "Two"),
    SampleList4 = linkedList:append(SampleList3, "Three"),
    SampleList5 = linkedList:append(SampleList4, "Four"),

    io:format("~p \n", ["Sample List3:"]),
    io:format("~p \n", [SampleList3]),

    io:format("~p \n", ["Sample List5:"]),
    io:format("~p \n", [SampleList5]),



    linkedList:valueExists(SampleList3, "Two").




