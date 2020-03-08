function [Node n p exnodes] = make_tree(X,e,l,n,p,dim,exnodes,exlevel)
  
  if (e>=l) || (length(X)<=1) %depth limit or isolated point
    left=[];
    right=[];
    exnodes=exnodes+1;
    Node=createNode(X,n,p,e,left,right,'external'); %rimettere end agli if in matlab
  else
   mins=min(X); %minimum row wise (1x2)
   maxs=max(X);
   idxs=randsample([1:1:dim], dim-exlevel-1); %implement no replacement | indices for random vector
   n=normrnd(0,1,[1 dim]); %random vector picked from uniform n-sphere ([1 dim] is equal np.random.normal(0,1,dim))
   n(idxs)=0;
   p=(maxs-mins)*rand(1,1)'+mins; %random intercept point (rand(1,1), 2 different values)
   w=(X-p)*n'<0; %data point goes on left or right (<0) [logic array]
   left=make_tree(X(w),e+1,l,n,p,dim,exnodes,exlevel);
   right=make_tree(X(~w),e+1,l,n,p,dim,exnodes,exlevel);
   Node=createNode(X,n,p,e,left,right,"internal");
end
end
