-module(con).
-compile(export_all).


dolphin1() ->
    receive
        do_a_flip ->
            io:format("No.. ~n");
        fish ->
            io:format(" fish fish~n");
        _->
            io:format("nothing.~n")
    end.


