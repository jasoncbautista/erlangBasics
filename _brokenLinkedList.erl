-module(linkedlist).
-export([new/0,
     head/1,
     tail/1,
     append/2,
     nth/2,
     last/1,
     length/1,
     is_empty/1,
     main/0
    ]).

-record(list, {head, length=0}).
-record(item, {data, next}).

-record(node, {data, next}).

new() ->
    #list{}.

new_item(Data) ->
    #item{data=Data}.

head(List) ->

    List#list.head.

tail(List) when List == #list{} ->
    undefined;
tail(List) ->
    Length = linkedlist:length(List) - 1,
    #list{head=next(head(List)), length=Length}.

append(Data, List) when List == #list{} ->
    List#list{head=new_item(Data), length=1};
append(Data, List) ->
    Item = append_item(Data, head(List)),
    NewLength = linkedlist:length(List) + 1,
    List#list{head=Item, length=NewLength}.

append_item(Data, Item) when Item#item.next == undefined ->
    Item#item{next=new_item(Data)};
append_item(Data, Item) ->

    Item#item{next=append_item(Data, next(Item))}.

next(Item) ->
    Item#item.next.

% Get the Nth item from List
% N: Index of item to get
% List: List to get from
nth(N, List) when N < 1 ->
    undefined;
nth(N, List) ->
    nth(N, 1, head(List)).

% N: Index of item to get
% I: Current index
% Item: #item in List corresponding to index I
nth(N, I, Item) when I == N ->
    Item;
nth(N, I, Item) ->

    nth(N, I + 1, next(Item)).

last(List) ->
    nth(linkedlist:length(List), List).

length(List) ->
    List#list.length.

is_empty(List) ->
    List == new().

p() ->
    io:format("\n").
p(Object) ->
    erlang:display(Object).

main() ->

    L = new(),
    test_list(L, "New list"),
    L1 = append(data1, L),
    test_list(L1, "List with one item"),
    L2 = append(data2, L1),
    test_list(L2, "List with two items"),
    L3 = append(data3, L2),
    test_list(L3, "List with three items"),
    ok.

test_list(List, Description) ->
    io:format("~s~n", [Description]),
    Length = linkedlist:length(List),
    p({'list', List}),
    p({'head', head(List)}),
    p({'tail', tail(List)}),
    p({'first', nth(1, List)}),
    p({'nth', nth(Length, List)}),
    p({'last', last(List)}),
    p({'length', Length}),
    p({'is_empty', is_empty(List)}),
    p(),
    ok.
