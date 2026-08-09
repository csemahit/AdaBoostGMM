function F_Measure = Evaluate(ACTUAL,PREDICTED)
% This fucntion determines the f_measure of a model by 
% calculating the common performance measures: Precision & Recall
% Input: 
%        ACTUAL = Column matrix with actual labels of the test data patterns
%        PREDICTED = Column matrix with predicted labels of the test data patterns by the model
% OUTPUT: f_measure

noClass = 2;
for f = 1:noClass

    if f == 1
        v = 1;
    elseif f == 2
        v = -1;
    end
    
idxx = (ACTUAL()==v);

p = length(ACTUAL(idxx));
n = length(ACTUAL(~idxx));
N = p+n;

tp = sum(ACTUAL(idxx)==PREDICTED(idxx));
tn = sum(ACTUAL(~idxx)==PREDICTED(~idxx));
fp = n-tn;
fn = p-tp;

tp_rate = tp/p;
tn_rate = tn/n;

accuracy = (tp+tn)/N;
sensitivity = tp_rate;
specificity = tn_rate;
precision(f) = tp/(tp+fp);
recall(f) = tp/(tp+fn);
end

pre = 0.0;
recc = 0.0;

for w = 1:noClass
    pre = pre + precision(w);
    recc = recc + recall(w);
end

pree = pre/noClass;
reccc = recc/noClass;
f_measure = 2*((pree*reccc)/(pree + reccc));

%gmean = sqrt(tp_rate*tn_rate);
%EVAL = [accuracy sensitivity specificity precision recall f_measure gmean];

F_Measure = f_measure;

% % % % % % % % % % % % % % % % % % % % % % % % % % % % % % 

