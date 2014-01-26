-module(kitchen).
-compile(export_all).

fridge1() ->
    receive
        {From, {store, Food}} ->
            From ! {self(), ok},
            fridge1();

        terminate ->
            ok
end.
