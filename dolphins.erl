-module(dolphins).
-compile(export_all).




dolphin1() ->
    receive
        do_a_flip ->
            io:format("No thanks ~n");
        fish ->
            io:format("Taking fish.~n");
        _ ->
            io:format("All catch ~n.")
    end.


dolphin2() ->
    receive
        {From , do_a_flip} ->
            From ! "No thanks ~n";
        {From, fish} ->
            From ! "all fish.~n";
        _ ->
            io:format("All catch....~n")
    end.
            



