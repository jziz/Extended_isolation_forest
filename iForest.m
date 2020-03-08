function forest = iForest(X, ntrees,  sample_size, limit, ExtensionLevel)
  
  %% Description
  % X -- training data
  % ntrees--  number of trees (default=100)
  %sample_size-- size of subsample (default=256)
  %limit -- maximumm tree depth (default=c_n (average length of unsuccesful search))
  % ExtensionLevel (0 default, up to dimensions-1)
  
  %check if return is appropriate  

  dim = size(X,2); %how many dimensions?
  if ExtensionLevel < 0
  disp(strcat("ExtensionLevel has to be an int between 0 and ",num2str(dim-1)));
  return
end
 if ExtensionLevel > dim-1
   disp(strcat("ExtensionLevel has to be an int between 0 and ",num2str(dim-1)));
   return
  end
  
  nobjs=length(X);
  %Trees=[];
  Trees = repmat(struct('p',[0 0],'n',[0 0],'exnodes',0,'size',0,'dim',0,'left',[],'right',[],'ntype',[]),1,ntrees); %array of structs
  if limit ==0
     limit = round(ceil(log2(sample_size))); %if no limit specified, set to deafult average length 
  end
  c = c_n(sample_size);
  
  for i=1:ntrees
    ix = randsample([1:1:nobjs],sample_size); %remember to pkg load statistics
    X_p=X(ix,:); %both columns x and y are sampled now
    %Trees= {Trees; iTree(ExtensionLevel,0,X_p,limit)}; %create list of trees calling iTree.m
    Trees(1,i)=iTree(ExtensionLevel,0,X_p,limit);
  end
  
  forest=Trees;
  
end
