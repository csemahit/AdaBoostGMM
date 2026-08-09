% Executes the GMM
% Finds out Accuracy, f_measure and AUC values of GMM

load ('tstPtrn')

%%% generates the cluster-labels of data-patterns %%% 
options = statset('Display','final','MaxIter',5000);
obj = gmdistribution.fit(trnPtrn,2,'Options',options,'Regularize', 1e-10);
[selectLevel,nlogl,P,logpdf,M] = cluster(obj,tstPtrn); % returns the labels 'selectLevel' by 
                                                       % cluster() function using obj
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

pos = selectLevel==2;   % cluster() function returns labels 1 & 2. But our data 
selectLevel(pos) = -1;  % has labels 1 & -1. For this 2 is replaced by -1 herewith

disp('Result of GMM:')

clusterPurity                               % calls the clusterPurity file to measure acurracy
f_measure=Evaluate(tstLabel,selectLevel)    % calls the Evaluate() function to determine f_measure
aucMeasure                                  % calls the aucMeasure file to measure AUC values



