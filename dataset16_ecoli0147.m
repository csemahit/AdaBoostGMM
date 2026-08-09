%%% prepares the dataset16_ecoli0147 dataset %%%

clc
clear all

fid = fopen('ecoli-0-1-4-7_vs_5-6_SMOTE_0_train.txt');
fid1 = fopen('ecoli-0-1-4-7_vs_5-6_SMOTE_0_test.txt');
selFeatures = [4 6];
% selFeatures = 1:6;

%%% training dataset preparation %%%
tmpData = textscan(fid, '%f,%f,%f,%f,%f,%f,%s');
fclose(fid);

%%% data preparation
for i= 1:6
    trnPtrn(:,i) = tmpData{1,i};
end
trnPtrn = trnPtrn(:,selFeatures);
% trnPtrn(:, 3) = [];
totPtrn = length(trnPtrn(:,1));
%%% data is ready

%%% class prepration
for ptrn = 1:totPtrn
  if strcmp(tmpData{1,7}(ptrn),'positive')
     trnLabel(ptrn,1) = 1;
  elseif strcmp(tmpData{1,7}(ptrn),'negative')
      trnLabel(ptrn,1) = -1;
  end
end
%%% class is ready

%%% test dataset preparation %%%
tmpData1 = textscan(fid1, '%f,%f,%f,%f,%f,%f,%s');
fclose(fid1);

%%% data preparation
for i= 1:6
    tstPtrn(:,i) = tmpData1{1,i};
end
tstPtrn = tstPtrn(:,selFeatures);
% tstPtrn(:, 3) = [];
totPtrn1 = length(tstPtrn(:,1));
%%% data is ready

%%% class prepration
for ptrn = 1:totPtrn1
  if strcmp(tmpData1{1,7}(ptrn),'positive')
     tstLabel(ptrn,1) = 1;
  elseif strcmp(tmpData1{1,7}(ptrn),'negative')
      tstLabel(ptrn,1) = -1;
  end
end
%%% class is ready

save tstPtrn.mat

% % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % 