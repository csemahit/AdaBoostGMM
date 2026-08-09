%%% determines the Area Under the Curve (AUC) values %%%
% INPUT:
%       tstLabel: the original labels of the test data patterns
%       selectLevel: the resultant labels of the test patterns by the model
% OUTPUT: AUC values

scoreLabel = selectLevel;
[Xaxis,Yaxis,Threshold,A] = perfcurve(tstLabel,scoreLabel,1);  %perfcurve() determines the AUC value as A
AUC = A

% plot(Xaxis,Yaxis);
