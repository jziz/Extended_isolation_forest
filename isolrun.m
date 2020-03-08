clear all
close all
%rng(69,'twister')
Y=readmatrix('DG2-Martinengo-Maggio-1m-tagliato.csv');
X=readmatrix('Potenza_DG2_Martinengo_1Maggio.csv');
Y_cusc_x=Y(:,1);

Z=[X Y_cusc_x];
%Z=readmatrix('breastw_683.csv');
forest = iForest(Z, 100,  256, 8, 1); %0 non ext, 1 ext ("funziona" solo extended per ora)
Scores = anomaly_scores(Z,100,forest,256);

Scores=rescale(Scores); %rescale between 0 and 1

Z_out=Z(Scores>0.6,:); %soglia 0.6 esempio
figure
scatter(Z(:,1),Z(:,2));
hold on
scatter(Z_out(:,1),Z_out(:,2));
title('outliers in rosso')

