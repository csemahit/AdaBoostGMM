
%%% clusters the test data Patterns using the generated weak models %%

finalLabelTest = zeros(size(tstLabel));    % initializes a vector with elements 0 of length equal to tstLabel
for m = 1:length(alpha)                    % loops upto the number of total weak models. Here 'alpha' for each weak model
    finalLabelTest = finalLabelTest + alpha(m) * weakLearnerLevel(h{m}, tstPtrn);
    selectLevel = sign(finalLabelTest);    % determines the resultant cluster labels using sign() functio    
end

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

disp('Result of gmmAdaBoost:')

clusterPurity                               % calls the clusterPurity file to measure acurracy
f_measure=Evaluate(tstLabel,selectLevel)    % calls the Evaluate() function to determine f_measure
aucMeasure                                  % calls the aucMeasure file to measure AUC values
