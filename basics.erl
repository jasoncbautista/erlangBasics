-module(basics).


-export([simpleCases/1]).


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
        







