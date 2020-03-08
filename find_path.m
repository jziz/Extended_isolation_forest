function [path,e]= find_path(tree,e,x)
  if strcmp(tree.ntype,"external") %work with nodes instead
   if tree.size<=1
      path=e;
 else 
   e=e+c_n(tree.size); %. indexing not supported by cells
   path=e;
 end
else
  p=tree.p;
  n=tree.n;
  e=e+1;
  
  if (x-p)'*n <0  %double transpose?
    [path,e]=find_path(tree.left,e,x);
  else
    [path,e]=find_path(tree.right,e,x);
  end
  end
end
