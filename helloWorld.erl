% hello world program
-module(helloWorld).
-export([start/0]).

-export([testing/0]).



% [ ]Mess with switch statements
% [ ] Calling other methods

% [ ] Print even numbers
% [ ] arrays
% [ ] lists
% [ ] tuples



% [ ] binary tree
%
% [ ] trie? 



testing() ->
    io:fwrite("testing...\n").



testing(RandomVariable) ->
    io:format("The value is: ~p \n", [RandomVariable]).




start() ->
    io:fwrite("wassa\n"),
    testing("one two"),
    testing("Coolio"),
    testing().





