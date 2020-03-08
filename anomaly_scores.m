function Scores = anomaly_scores(X,ntrees,forest,sample_size)
  %compute anomaly scores for all data points in X
  c=c_n(sample_size);
  Scores = zeros(1,length(X));
  for i=1:length(X)
    h_temp=0;
    for j=1:ntrees
      path = PathFactor(X(i,:),forest(j))*1.0; %single point includes both columns, check indexing for forest (should be a cell array)
      h_temp=h_temp+path;
    end
    Eh=h_temp/ntrees; %average path length over all trees
    Scores(1,i)=2.0^(-Eh/c);
  end
  
end
