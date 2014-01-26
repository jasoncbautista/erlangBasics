-module(kitchen).
-compile(export_all).

fridge1() ->
    receive
        {From, {store, Food}} ->

end.
