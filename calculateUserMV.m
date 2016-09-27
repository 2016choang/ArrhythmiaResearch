path(path, '/afs/csl.tjhsst.edu/students/2016/2016choang/web-docs/Research');
path(path, '/afs/csl.tjhsst.edu/students/2016/2016choang/web-docs/Research/wfdb/mcode');
path(path, '/afs/csl.tjhsst.edu/students/2016/2016choang/web-docs/Research/dtw');
 
load('datauserinput.mat');
 
A = importdata('samples.txt');
disp(A.data);
time = A.data(:,1);
signal = A.data(:,2);
B = importdata('annotations.txt');
samp = cell2fun(@str2num, B.textdata(2:80,2));

% fileID = fopen('test.txt','w');
% fprintf(fileID,'Hello world!');
% fclose(fileID);
% fprintf('Hello!');