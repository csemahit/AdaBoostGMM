% Executes the K-means
% Finds out Accuracy, f_measure and AUC values of K-means

clc
clear all

load ('tstPtrn');
X = tstPtrn;

%%% clustering the patterns using kmeans() %%
opts = statset('Display','final');
[selectLevel,Centroid,sumd,Distances] = kmeans(X,2,'Distance','sqEuclidean',...
    'Replicates',10,'Options',opts);
% % % % % % % % % % % % % % % % % % % % % % % 

pos = selectLevel==2;       % kmeans() returns labels 1 & 2. But our data
selectLevel(pos) = -1;      % has labels 1 & -1. For this 2 is replaced by -1 herewith

disp('Result of k-means:')

clusterPurity                               % calls the clusterPurity file to measure acurracy
f_measure=Evaluate(tstLabel,selectLevel)    % calls the Evaluate() function to determine f_measure
aucMeasure                                  % calls the aucMeasure file to measure AUC values

% % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % 