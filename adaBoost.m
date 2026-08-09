%%% Weak models generation through adaBoost %%%
load ('tstPtrn');

%%% adaBoost %%%
T = 20;                       % T determines the limit of weak models to generate. It is kept large enough.    
D = ones(size(trnLabel))/length(trnLabel);   % Gives equal weight to each of the training data patterns.  
                                                                               
h = {};                       % h to hold generated weak models
alpha = [];                   % alpha to hold weight for each 'weak model'.

YY = trnPtrn(:,1);            % YY to keep track how many train patterns
numOfTrnPtrn = numel(YY);     % numOfTrnPtrn counts the total number of training data patterns

rawData = 1:numOfTrnPtrn;     % rawData to extract the randomly selected traning data patterns 
indexOfPatterns = rawData';   % indexOfPatterns to extract the indices of randomly selected training data patterns                   

q=0;                          % q to indicate whether any model has been generated or not                                   

%%%%% generation of weak models starts here %%%%%%%%%%

for t = 1:T
    
    err(t) = inf;                                          % Initially error is kept infinite 
    
                y = randsample(indexOfPatterns,166,true,D);% returns a weighted sample taken with replacement, 
                                                           % using a vector of positive weights D, whose length is equal to indexOfPatterns.
              
                Y = sort(y);                               % sorts the indices of randomly selected training data patterns                            
                    
                    % Extract the random training data paterrn using indexOfPatterns and assigns to XX
                    for u = 1:length(Y)
                       XX(u,:) = trnPtrn(Y(u),:);                                  
                    end                    
                    %%%%%%%%%%%%%%%%%%%%%%%%%%%%
                    
                obj = weakLearner(XX);                      % Creates model using randomly selected data patterns XX
                idx = weakLearnerLevel(obj,trnPtrn(:,:));   % Clusters traing data patterns based on obj                                
                
                returnLevel = idx ~= trnLabel;              % compares the returned training data label idx with original label trnLabel
                tmpe = sum(D.*returnLevel);                 % Computes error
                XX(:,:) = [];                               % empties XX for storing the next randomly selected training data patterns
                
                err(t) = tmpe;
                q = q+1;                                    % if a model is generated then q is incremented by 1
    
    %%% Condition checking to hault model generation %%%
    if(err(t) >= 1/2 || err(t) == 0)       
        disp('Stop: err>1/2 or err=0')
        break;
    end
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    
    h{t} = obj;                                     % Holds weak model t
    alpha(t) = 1/2 * log((1-err(t))/err(t));        % Claculates weight alpha for weak model t
    D = D.* exp(-alpha(t) .* trnLabel .*  idx);     % Updates weights for selected training data patterns based on alpha     
    D = D./sum(D);
end
%%%%%%generation of weak model stops here%%%%



%%% if q>1 then models generated and jumps to the file 'testPattern' to cluster the 'tstPtrn' using the generated models %%%%%
%%% otherwise displays the msg 'No model generated' %%%%%
if q>1
    testPattern;
else
    disp('No model generated')
end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%



