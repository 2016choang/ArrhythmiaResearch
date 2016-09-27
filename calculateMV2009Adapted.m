%dirName = 'vfdb';

%Find files 
%recordNum = num2str(vfdbRecords(j));
%recordName = strcat(dirName, '/', recordNwium); 
%wfdb2mat(recordName);
%recordMat = strcat(recordNum, 'm');
[time, signal, Fs, labels] = rdmat(recordMat); %replace with import statement 
time = time.';
signal(:,2) = [];

%Locate heartbeats
%gqrs(recordName); %WFDB NEEDED
%samp = rdann(recordName, 'qrs'); %WFDB NEEDED 
%Require user to upload both heartbeat annotations and full ECG signal


%Filter file 
[r,c] = size(samp);
N = round(r-1);
MD = zeros(N,1);
t = zeros(N,1);
fsignal = medfilt1(signal, round(Fs * 0.2));
bsignal = medfilt1(fsignal, round(Fs * 0.6));
rsignal = signal - bsignal;

%Calculate HRV LF/HF
[tpxx, tf] = plomb(rsignal, time); %2009, WFDB --> "LOMB"
lf = bandpower(tpxx,tf, [0.04 0.15], 'psd'); % 2009
e2 = 0.40;
if(tf(end) < 0.40) 
    e2 = tf(end);
end 
hf = bandpower(tpxx,tf, [0.15 e2], 'psd'); % 2009
lfhf = lf / hf; 
vfdbData(j,1) = lfhf;

%Calculate HRV SDNN
[rr, tm] = ann2rr(recordName, 'qrs'); %WFDB
SDNN = std(rr); 
vfdbData(j,2) = SDNN;

%Find MD through DTW
marker = 1;
for i=1:N,
    sample = samp(i);
    sample2 = samp(i+1);
    sig1 = horzcat(time(marker:sample), rsignal(marker:sample));
    s = sample + 1;
    sig2 = horzcat(time(s:sample2), rsignal(s:sample2));
    marker = sample;
    window = sample2 - sample;
    d = dtw(sig1,sig2,window);
    t(i) = time(sample);
    MD(i) = d;
end 

%Calculate MV
realMD = medfilt1(MD,8);
[pxx,f] = plomb(realMD,t); %2009, WFDB --> "LOMB"
i2 = 0.55;
if(f(end) < 0.55) 
    i2 = f(end);
end 
if(f(end) < 0.30)
    mv = 0; 
else 
    mv = bandpower(pxx,f,[0.30 i2], 'psd'); % 2009
end 
vfdbData(j,3) = mv;

%Calculate MV-LF/HF
if(f(end) < 0.15)
    mvlfhf = 0;
else
    mvlf = bandpower(pxx,f, [0.04 0.15], 'psd'); % 2009
    i3 = 0.40;
    if (f(end) < 0.40) 
        i3 = f(end);
    end
    mvhf = bandpower(pxx, f, [0.15 i3], 'psd'); % 2009
    mvlfhf = mvlf / mvhf; 
end 
vfdbData(j,4) = mvlfhf;