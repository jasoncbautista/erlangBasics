% https://sites.google.com/site/gettingalongwitherlang/home/misc/gb_trees
-module(gb_tree).
-export([main/0]).
-export([showValues/1]).


main() ->
        T = gb_trees:empty(),

        T1 = gb_trees:enter(japan, "日本", T),
        io:format("~p~n", [T1]),

        T2 = gb_trees:enter(america, "米国", T1),
        io:format("~p~n", [T2]),

        T3 = gb_trees:enter(china, "中国", T2),
        io:format("~p~n", [T3]),

        J = gb_trees:get(japan, T3),
        io:format("~ts~n", [J]),

        T4 = gb_trees:enter(england, "英国", T3),
        io:format("~p~n", [T4]),

        KeyList = gb_trees:keys(T4),
        io:format("~p~n", [KeyList]),

        Values = gb_trees:values(T4),
        showValues( Values ),

        T5 = gb_trees:delete(england, T4),
        KeyList2 = gb_trees:keys(T5),
        io:format("~p~n", [KeyList2]),

        ok.

showValues( Values ) ->
        lists:foreach(
                fun(I)-> io:format("~ts\n", [I]) end,
                Values
        ).
