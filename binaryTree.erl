-module(binaryTree).
-record(node, {data, _id, left, right}).

% Some simple methods:
-export([new/0]).



% Here we let the tree generate uniq ids for entries so that we
% can better keep track of nodes

addNode(left, Tree, TargetNode, NewNode) 



