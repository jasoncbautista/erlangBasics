-module(linkedList).
-export([new/0]).
-export([append/2]).
-export([valueExists/2]).
-export([insertAfter/4]).
-export([insertAfter/5]).

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
% data

insertAfter(data, List, TargetData, Data) when List#node.data == TargetData ->
    NewNode = #node{data=Data, next=List#node.next},
    #node{data=List#node.data, next=NewNode};

insertAfter(data, List, TargetData, Data) ->
    #node{data=List#node.data, next=insertAfter(data, List#node.next, TargetData, Data)}.

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% index

% Our wrapper function which will just call our recursive counterpart:
insertAfter(index, List, Index, Data) ->
    insertAfter(index, List, Index, Data, 0).

insertAfter(index, List, Index, Data, CurrentIndex) ->
    io:format("CurrentIndex: ~p \n", [CurrentIndex]);


insertAfter(index, List, Index, Data, CurrentIndex) when CurrentIndex == Index ->
    io:format("CurrentIndex: ~p \n", [CurrentIndex]);

insertAfter(index, List, Index, Data, CurrentIndex) when List#node.next == undefined->
    io:format("ERROR, exeeded list size!: ~p \n", [CurrentIndex]);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


valueExists(List, Value) when List#node.data == Value ->
    true;

valueExists(List, _) when List#node.next == undefined ->
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

    SplicedList = insertAfter(data, SampleList5, "Two", "Two and a half"), 
    io:fwrite("SplicedList: \n"),
    io:format("~p \n", [SplicedList]),

    linkedList:valueExists(SampleList3, "Two").




% TODO:
%  [ ] How to avoid having to redefine SampleList over and over again?
%   -- callbacks?
