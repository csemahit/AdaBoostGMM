% Executes the boosTed Decision Tree (DT)
% Finds out Accuracy, f_measure and AUC values of boostedDT

load ('tstPtrn')

%fitensemble() and predict() have been used to classify
%the patterns using the boostedDT technique

boostingResult = fitensemble(trnPtrn,trnLabel,'AdaBoostM1',500,'Tree');
selectLevel = predict(boostingResult,tstPtrn);

%%%%%%%%%%%%%%%%%%%

disp('Result of dedaultAdaBoost:')

clusterPurity                               %calls the clusterPurity file to measure acurracy
f_measure=Evaluate(tstLabel,selectLevel)    %calls the Evaluate() function to determine f_measure
aucMeasure                                  %calls the aucMeasure file to measure AUC values
