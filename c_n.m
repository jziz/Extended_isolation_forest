function c_n=c_n(n)
  %Average path length of a binary search for external node termination tree given n points 
  if n>2
  c_n =  2.0*(log(n-1)+0.5772156649) - (2.0*(n-1.)/(n*1.0)); % n length of Z or sample_size?
  end
if n==2
  c_n=1;
end 

if n<2
  c_n=0;
 end
 
  
end
