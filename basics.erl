-module(basics).


-export([simpleCases/1]).
-export([simpleIfs/1]).


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





