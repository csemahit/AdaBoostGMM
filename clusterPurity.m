%%%%%%%%% ACCURACY MEASUREMENT %%%%%%%%%
% Each cluster is assigned to the class which is most frequent in the cluster, 
% and then the accuracy of this assignment is measured by counting the number of 
% correctly assigned patterns and dividing the total number of patterns in that cluster. 
% OUTPUT: 
%       Accuracy

totalPaternClass1 = 0;       totalPaternClass2 = 0;       
cluster1Class1 = 0;          cluster2Class1 = 0;        
cluster1Class2 = 0;          cluster2Class2 = 0;    


for ptrnn = 1:length(tstLabel)
    
    if selectLevel(ptrnn) == 1
        if tstLabel(ptrnn) == 1
            cluster1Class1 = cluster1Class1 + 1;
        elseif tstLabel(ptrnn) == -1
            cluster1Class2 = cluster1Class2 + 1;
        end
        totalPaternClass1 = totalPaternClass1 + 1;
        
    elseif selectLevel(ptrnn) == -1
        if tstLabel(ptrnn) == 1
            cluster2Class1 = cluster2Class1 + 1;
        elseif tstLabel(ptrnn) == -1
            cluster2Class2 = cluster2Class2 + 1;
        end
        totalPaternClass2 = totalPaternClass2 + 1;
    end
    
end
a = [cluster1Class1 cluster1Class2];
b = [cluster2Class1 cluster2Class2];

aa = [cluster1Class1; cluster1Class2; ];
bb = [cluster2Class1; cluster2Class2; ];


result = [aa bb];

r1 = max(a);
r2 = max(b);

maxm = [r1 r2];

accuracy = ((r1 + r2) / length(tstLabel)) .* 100

% % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % %
