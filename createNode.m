function Node = createNode(X,n,p,e,left,right,node_type)
  %create structure instead of object, still support point addressing
  %Node is a basic sructure
  Node.e=e;
  Node.size=length(X);
  Node.n=n; %normal vector to hyperplane used for splitting data (for extensionlevel>1 it will be multiplied by a slope coefficient)
  Node.p=p; %intercept
  Node.left = left; %left node (other structure)
  Node.right = right;%right node (other structure)
  Node.ntype = node_type; %string: internal or external
  
end
