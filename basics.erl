-module(basics).

-export([simpleCases/1]).
-export([simpleIfs/1]).

-export([simpleBinaries/1]).
-export([anonymousFunctions/0]).

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
            timer:sleep(10),
            io:format("Simple fxn~n", [])
    end,

    A(),

    true.


