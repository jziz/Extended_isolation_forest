function [tree] = iTree(exlevel,e,X,l)
  %build single isolation tree
  %% Parameters
  %exlevel --extension level (0,...,dim-1)
  %e-- depth of tree (int)
  %X-- data at the root of this tree
  %size-- size of the dataset
  %dim-- dimension of the dataset
  %Q-- list of ordered integers smaller than dim (dim=number of features)
  %l-- maximum tree depth prior to termination
  %n--normal vector at root of tree (list)
  %p--intercept point at the root of the tree (list)
  %exnodes-- number of external nodes in tree
  %root-- node structure
  %tree.p=[0 0]; %Self
  %tree.n=[0 0];
  tree.exnodes=0;
  tree.size=length(X);
  tree.dim = size(X,2);
  tree.left=[];
  tree.right=[];
  %tree.e=e;
  [tree,e] =make_tree(X,l,tree,exlevel,e); %invoke recursive function to build tree starting from root (returns all self values also include in iTree)
 
  end
