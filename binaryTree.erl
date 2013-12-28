-module(binaryTree).
-record(node, {data, key, left, right}).

% Some simple methods:
% -export([new/0]).
-export([addNode/3]).

-export([test/0]).

% Here we let the tree generate uniq ids for entries so that we
% can better keep track of nodes

%addNodeAfter(left, Tree, TargetNode, NewNode) when Tree = #node{} ->
%    RandomNumber = random:uniform();

% Let's say we find the targe
% addNodeAfter(left, Tree, TargetNode, NewNode)  -> 
addNode(Tree, Key, Data) when Tree == #node{}->
    io:fwrite(" #node{} \n"),
    #node{key=Key, data=Data};

% Override Key with new data
addNode(Tree, Key, Data) when Tree#node.key == key ->
    io:fwrite(" key == key \n"),
    #node{key=Key, data=Data
        , left = Tree#node.left
        , right = Tree#node.right 
    };

addNode(Tree, Key, Data) when Tree#node.left == undefined ->
    io:fwrite("left undefined\n"),
    #node{data=Tree#node.data, key = Tree#node.key
        , left= #node{key=Key, data = Data} }; 

addNode(Tree, Key, Data) when Tree#node.right== undefined ->
    io:fwrite("right undefined\n"),
    #node{data=Tree#node.data, key =Tree#node.key
        , right= #node{key=Key, data = Data} }; 

addNode(Tree, Key, Data)  ->
    RandomNumber = random:uniform(),
    io:format("Random Number: ~p\n", [RandomNumber]),
    case RandomNumber > 0.5 of 
        true  ->
            io:fwrite("left\n"),
            #node{data = Tree#node.data, key=Tree#node.data
                , left= Tree#node.left
                , right= addNode(Tree#node.right, Key, Data)
            };
        false->
            io:fwrite("right\n"),
            #node{data = Tree#node.data, key=Tree#node.data
                , right= Tree#node.right
                , left= addNode(Tree#node.left, Key, Data)
            }
    end.

% Testing basics of the binary tree implementation:
test() ->
    io:fwrite("---------\n\n\n"),
    Tree = #node{},
    io:format("Tree ~p \n", [Tree]),
    Tree1 = addNode(Tree, "one", "Coolio1"),
    io:format("Tree1 ~p \n", [Tree1]),
    io:fwrite("---------\n\n\n"),
    Tree2 = addNode(Tree1, "two", "Coolio2"),
    io:format("Tree2 ~p \n", [Tree2]),
    io:fwrite("---------\n\n\n"),
    Tree3 = addNode(Tree2, "three", "Coolio3"),
    io:format("Tree3 ~p \n", [Tree3]),
    io:fwrite("---------\n\n\n"),
    Tree4 = addNode(Tree3, "four", "Coolio4"),
    io:format("Tree4 ~p \n", [Tree4]),
    true.
% TODO: 
% [ ] binary SEARCH tree --> real search tree
% [ ] make a list based binary search tree =-)
% [ ] use real erlang trees, built ins
% [ ] Build a fake circular list (double linked list)
