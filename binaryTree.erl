-module(binaryTree).
-record(node, {data, _id, left, right}).

% Some simple methods:
-export([new/0]).



% Here we let the tree generate uniq ids for entries so that we
% can better keep track of nodes

addNodeAfter(left, Tree, TargetNode, NewNode) when Tree = #node{} ->
    RandomNumber = random:uniform().




% TODO: make a list based binary search tree =-)




