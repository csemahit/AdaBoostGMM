%%% generates models obj of class gmdistribution %%%

function obj = weakLearner(X)

options = statset('Display','final','MaxIter',5000);
obj = gmdistribution.fit(X,2,'Options',options,'Regularize', 1e-10);

% % % % % % % % % % % % % % % % % % % % % % % % % %