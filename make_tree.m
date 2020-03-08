function [Tree,e] = make_tree(X,l,Tree,exlevel,e)
  %if (Tree.e>=l) || (length(X)<=1
  if (e>=l) || (length(X)<=1) %depth limit or isolated point
    Tree.left=[];
    Tree.right=[];
    Tree.p=[0 0];
    Tree.n=[0 0];
    Tree.exnodes=Tree.exnodes+1;
    Tree.ntype='external';
    %Node=createNode(X,n,p,e,left,right,'external'); %rimettere end agli if in matlab
  else
   e=e+1;
   mins=min(X); %minimum row wise (1x2)
   maxs=max(X);
   idxs=datasample([1:1:Tree.dim], Tree.dim-exlevel-1,'Replace',false); %implement no replacement | indices for random vector (if extlevel=1, vector orthogonal ot x (xcomponent=0))
   Tree.n=normrnd(0,1,[1 Tree.dim]); %random vector picked from uniform n-sphere ([1 dim] is equal np.random.normal(0,1,dim))
   Tree.n(idxs)=0;
   Tree.p=(maxs-mins)*rand(1,1)+mins; %random intercept point (rand(1,1), 2 different values)
   w=(X-Tree.p)*(Tree.n)'<0; %data point goes on left or right (<0) [logic array]
   Tree.ntype='internal';
   [Tree.left e]=make_tree(X(w,:),l,Tree,exlevel,e);
   [Tree.right e]=make_tree(X(~w,:),l,Tree,exlevel,e);
   %Node=createNode(X,n,p,e,left,right,"internal");
end
end
