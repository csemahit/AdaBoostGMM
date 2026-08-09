% returns labels 'idx' of each test patterns based on weak models
% INPUT:
%       obj: the weak model
%       Data: the data to be clustered
% OUTPUT: 
%       idx: resultant labels of the Data

function idx = weakLearnerLevel(obj,Data)

idx = cluster(obj,Data);     % returns the labels 'idx' by the cluster() function using obj

pos = idx==2;                % cluster() function returns labels 1 & 2. But our data has labels 
idx(pos) = -1;               % 1 & -1. For this 2 is replaced by -1 herewith 
