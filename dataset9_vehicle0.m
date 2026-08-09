%%% prepares the dataset9_vehicle0 dataset %%%

clc
clear all

fid = fopen('vehicle0_SMOTE_0_train.txt');
fid1 = fopen('vehicle0_SMOTE_0_test.txt');
selFeatures = [7 8 9 12 15];
% selFeatures = 1:18;

%%% training dataset preparation %%%
tmpData = textscan(fid, '%f,%f,%f,%f,%f,%f,%f,%f,%f,%f,%f,%f,%f,%f,%f,%f,%f,%f,%s');
fclose(fid);

%%% data preparation
for i= 1:18
    trnPtrn(:,i) = tmpData{1,i};
end
trnPtrn = trnPtrn(:,selFeatures);
totPtrn = length(trnPtrn(:,1));
%%% data is ready

%%% class prepration
for ptrn = 1:totPtrn
  if strcmp(tmpData{1,19}(ptrn),'positive')
     trnLabel(ptrn,1) = 1;
  elseif strcmp(tmpData{1,19}(ptrn),'negative')
      trnLabel(ptrn,1) = -1;
  end
end
%%% class is ready


%%% test dataset preparation %%%
tmpData1 = textscan(fid1, '%f,%f,%f,%f,%f,%f,%f,%f,%f,%f,%f,%f,%f,%f,%f,%f,%f,%f,%s');
fclose(fid1);

%%% data preparation
for i= 1:18
    tstPtrn(:,i) = tmpData1{1,i};
end
tstPtrn = tstPtrn(:,selFeatures);
totPtrn1 = length(tstPtrn(:,1));
%%% data is ready

%%% class prepration 
for ptrn = 1:totPtrn1
  if strcmp(tmpData1{1,19}(ptrn),'positive')
     tstLabel(ptrn,1) = 1;
  elseif strcmp(tmpData1{1,19}(ptrn),'negative')
      tstLabel(ptrn,1) = -1;
  end
end
%%% class is ready

save tstPtrn.mat

% % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % 