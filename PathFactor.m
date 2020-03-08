function path = PathFactor(x,tree)
  e=0;
  %node=tree.root;
%  while 1                             %do while loop, execute find<-path at least once for root node, then abort if node is external (lef=[], right=[])
%  [path e]=find_path(tree,node,e,x);
%  if node.right==[]
%    node=node.left;
%    end
%  if node.left==[]
%    node=node.right;   %search right node if left is null....
%  end
%  if (node.right==[]) &&(node.left==[])
%    break
%  end
%end
[path,e]=find_path(tree,e,x);
%while (not(isempty(node.right))) &&(not(isempty(node.left)))
%   if isempty(node.left)
%   node=node.right
%   [path e]=find_path(tree,node,e,x);
% end
%    if isempty(node.right) %!= not supported for structs
%   node=node.left
%   [path e]=find_path(tree,node,e,x);
% end
% 
%end

 end
