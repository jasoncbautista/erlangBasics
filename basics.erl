-module(basics).


-export([simpleCases/1]).
-export([simpleIfs/1]).

-export([simpleBinaries/1]).
-export([anonymousFunctions/0]).
-export([spawningTest/1]).

%-import(lists.seq).
%-import(mochijson).


-export([jsonExampleMochi/0]).
-export([stringToBinary/0]).

% Exceptions

simpleCases(Number) ->
    case  Number of
        Number when 0 == Number  ->
            zero;
        Number when 1  == Number ->
            one;
        _ ->
            Number
    end.
        

jsonExampleMochi() ->
    JsonDecoded = mochijson:decode("{\"Name\":\"Tom\",\"Age\":10}"),
    io:format("~p~n", [JsonDecoded]),


    L2 = {struct, [{"one", "two"}]},
    LDecoded  = mochijson:encode(L2),
    io:format("~p~n", [LDecoded]),


    JsonString = mochijson:encode(JsonDecoded),
    io:format("~p~n", [JsonString]),

    % {struct,[{"Name","Tom"},{"Age",10}]}.
    true.

simpleIfs(Number) ->
    if Number == 0 ->
            zero;
        Number == 1->
            one;
        true ->
            Number
    end.

simpleBinaries(Number) when Number == 0 ->
    <<"zeor">>;


simpleBinaries(Number) when Number == 1 ->
    <<"one">>;

simpleBinaries(Number) ->
    Number.
    

anonymousFunctions() ->
    A = fun() -> 
            io:format("Simple fxn~n", [])
    end,

    A(),

    true.

spawningTest(Count) ->
    F = fun(X) ->
            timer:sleep(10),
            io:format("~p~n", [X])
    end,
    
    [spawn(fun()->F(X)end) || X  <- lists:seq(0, Count)].

stringToBinary() ->
    R =io_lib:format("~p", [<<"one two">>]),
    io:format("~p~n", [R]),
    S =lists:flatten(R),
    io:format("~p~n", [S]),
    B = list_to_binary("one"),
    io:format("~p~n", [B]),
    L = erlang:binary_to_list(<<"one">>),
    true.

