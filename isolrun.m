clear all
close all
%rng(69,'twister')
Y=readmatrix('"ydata".csv');
X=readmatrix('"xdata".csv');
Y_cusc_x=Y(:,1);

Z=[X Y_cusc_x];
%Z=readmatrix('breastw_683.csv');
forest = iForest(Z, 100,  256, 8, 1); %0 non ext, 1 ext (only the "extended" version is working)
Scores = anomaly_scores(Z,100,forest,256);

Scores=rescale(Scores); %rescale between 0 and 1

Z_out=Z(Scores>0.6,:); %Example threshold 0.6
figure
scatter(Z(:,1),Z(:,2));
hold on
scatter(Z_out(:,1),Z_out(:,2));
title('outliers in rosso')

