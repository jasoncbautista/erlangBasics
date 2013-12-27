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
    #node{key=Key, data=Data};


% Override Key with new data
addNode(Tree, Key, Data) when Tree#node.key == key ->
    #node{key=Key, data=Data
        , left = Tree#node.left
        , right = Tree#node.right 
    };

addNode(Tree, Key, Data) when Tree#node.left == undefined ->
    #node{data=Tree#node.data, key = Tree#node.key
        , left= #node{key=Key, data = Data} }; 

addNode(Tree, Key, Data) when Tree#node.right== undefined ->
    #node{data=Tree#node.data, key =Tree#node.key
        , right= #node{key=Key, data = Data} }; 


addNode(Tree, Key, Data)  ->
    RandomNumber = random:uniform(),
    case RandomNumber > 0.5 of 
        true  ->
            #node{data = Tree#node.data, key=Tree#node.data
                , left= Tree#node.left
                , right= addNode(Tree#node.right, Key, Data)
            };
        false->
            #node{data = Tree#node.data, key=Tree#node.data
                , right= Tree#node.right
                , left= addNode(Tree#node.left, Key, Data)
            }
    end.


test() ->
    Tree = #node{},
    Tree1 = addNode(Tree, "one", "Coolio1"),
    Tree2 = addNode(Tree1, "two", "Coolio2"),
    Tree3 = addNode(Tree2, "three", "Coolio3"),
    
    io:format("Tree ~p \n", [Tree]),
    io:format("Tree3 ~p \n", [Tree3]),

    true.
% TODO: 
% [ ] binary SEARCH tree --> real search tree
% [ ] make a list based binary search tree =-)
% [ ] use real erlang trees, built ins
% [ ] Build a fake circular list (double linked list)


