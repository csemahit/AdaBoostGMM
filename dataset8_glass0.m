%%% prepares the dataset8_glass0 dataset %%%

clc
clear all

fid = fopen('glass0_SMOTE_0_train.txt');
fid1 = fopen('glass0_SMOTE_0_test.txt');
selFeatures = [1 3 7 8 9];
% selFeatures = 1:9;

%%% training dataset preparation %%%
tmpData = textscan(fid, '%f,%f,%f,%f,%f,%f,%f,%f,%f,%s');
fclose(fid);

%%% data preparation
for i= 1:9
    trnPtrn(:,i) = tmpData{1,i};
end
trnPtrn = trnPtrn(:,selFeatures);
totPtrn = length(trnPtrn(:,1));
%%% data is ready

%%% class prepration
for ptrn = 1:totPtrn
  if strcmp(tmpData{1,10}(ptrn),'positive')
     trnLabel(ptrn,1) = 1;
  elseif strcmp(tmpData{1,10}(ptrn),'negative')
      trnLabel(ptrn,1) = -1;
  end
end
%%% class is ready


%%% test dataset preparation %%%
tmpData1 = textscan(fid1, '%f,%f,%f,%f,%f,%f,%f,%f,%f,%s');
fclose(fid1);

%%% data preparation 
for i= 1:9
    tstPtrn(:,i) = tmpData1{1,i};
end
tstPtrn = tstPtrn(:,selFeatures);
totPtrn1 = length(tstPtrn(:,1));
%%% data is ready

%%% class prepration 
for ptrn = 1:totPtrn1
  if strcmp(tmpData1{1,10}(ptrn),'positive')
     tstLabel(ptrn,1) = 1;
  elseif strcmp(tmpData1{1,10}(ptrn),'negative')
      tstLabel(ptrn,1) = -1;
  end
end
%%% class is ready

save tstPtrn.mat

% % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % 