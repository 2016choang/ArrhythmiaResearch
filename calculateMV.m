%MV Arrthymias 

% vfdb Database 
% dirName = 'vfdb';
% %vfdbData = zeros(size(vfdbRecords,1),4);
% %size(vfdbRecords,1)
% for j=10:13,
%     %Find files 
%     recordNum = num2str(vfdbRecords(j));
%     recordName = strcat(dirName, '/', recordNum); 
%     wfdb2mat(recordName);
%     recordMat = strcat(recordNum, 'm');
%     [time, signal, Fs, labels] = rdmat(recordMat); 
%     time = time.';
%     signal(:,2) = [];
%     
%     %Locate heartbeats
%     gqrs(recordName);
%     samp = rdann(recordName, 'qrs'); 
%     
%     %Filter file 
%     [r,c] = size(samp);
%     N = round(r-1);
%     MD = zeros(N,1);
%     t = zeros(N,1);
%     fsignal = medfilt1(signal, round(Fs * 0.2));
%     bsignal = medfilt1(fsignal, round(Fs * 0.6));
%     rsignal = signal - bsignal;
% 
%     %Calculate HRV LF/HF
%     [tpxx, tf] = plomb(rsignal, time); 
%     lf = bandpower(tpxx,tf, [0.04 0.15], 'psd');
%     e2 = 0.40;
%     if(tf(end) < 0.40) 
%         e2 = tf(end);
%     end 
%     hf = bandpower(tpxx,tf, [0.15 e2], 'psd');
%     lfhf = lf / hf; 
%     vfdbData(j,1) = lfhf;
% 
%     %Calculate HRV SDNN
%     [rr, tm] = ann2rr(recordName, 'qrs');
%     SDNN = std(rr);
%     vfdbData(j,2) = SDNN;
% 
%     %Find MD through DTW
%     marker = 1;
%     for i=1:N,
%         sample = samp(i);
%         sample2 = samp(i+1);
%         sig1 = horzcat(time(marker:sample), rsignal(marker:sample));
%         s = sample + 1;
%         sig2 = horzcat(time(s:sample2), rsignal(s:sample2));
%         marker = sample;
%         window = sample2 - sample;
%         d = dtw(sig1,sig2,window);
%         t(i) = time(sample);
%         MD(i) = d;
%     end 
% 
%     %Calculate MV
%     realMD = medfilt1(MD,8);
%     [pxx,f] = plomb(realMD,t);
%     i2 = 0.55;
%     if(f(end) < 0.55) 
%         i2 = f(end);
%     end 
%     if(f(end) < 0.30)
%         mv = 0; 
%     else 
%         mv = bandpower(pxx,f,[0.30 i2], 'psd');
%     end 
%     vfdbData(j,3) = mv;
% 
%     %Calculate MV-LF/HF
%     if(f(end) < 0.15)
%         mvlfhf = 0;
%     else
%         mvlf = bandpower(pxx,f, [0.04 0.15], 'psd');
%         i3 = 0.40;
%         if (f(end) < 0.40) 
%             i3 = f(end);
%         end
%         mvhf = bandpower(pxx, f, [0.15 i3], 'psd');
%         mvlfhf = mvlf / mvhf; 
%     end 
%     vfdbData(j,4) = mvlfhf;
%     
%     
% end

% %svdb Database 
% dirName = 'svdb';
% %svdbData = zeros(size(svdbRecords,1),4);
% for j=16:78,
%     %Find files 
%     recordNum = num2str(svdbRecords(j));
%     recordName = strcat(dirName, '/', recordNum);
%     wfdb2mat(recordName);
%     recordMat = strcat(recordNum, 'm');
%     [time, signal, Fs, labels] = rdmat(recordMat); 
%     time = time.';
%     signal(:,2) = [];
%     
%     %Locate heartbeats
%     gqrs(recordName);
%     samp = rdann(recordName, 'qrs'); 
%     
%     %Filter file 
%     [r,c] = size(samp);
%     N = round(r-1);
%     MD = zeros(N,1);
%     t = zeros(N,1);
%     fsignal = medfilt1(signal, round(Fs * 0.2));
%     bsignal = medfilt1(fsignal, round(Fs * 0.6));
%     rsignal = signal - bsignal;
% 
%     %Calculate HRV LF/HF
%     [tpxx, tf] = plomb(rsignal, time); 
%     lf = bandpower(tpxx,tf, [0.04 0.15], 'psd');
%     e2 = 0.40;
%     if(tf(end) < 0.40) 
%         e2 = tf(end);
%     end 
%     hf = bandpower(tpxx,tf, [0.15 e2], 'psd');
%     lfhf = lf / hf; 
%     svdbData(j,1) = lfhf;
% 
%     %Calculate HRV SDNN
%     [rr, tm] = ann2rr(recordName, 'qrs');
%     SDNN = std(rr);
%     svdbData(j,2) = SDNN;
% 
%     %Find MD through DTW
%     marker = 1;
%     for i=1:N,
%         sample = samp(i);
%         sample2 = samp(i+1);
%         sig1 = horzcat(time(marker:sample), rsignal(marker:sample));
%         s = sample + 1;
%         sig2 = horzcat(time(s:sample2), rsignal(s:sample2));
%         marker = sample;
%         window = sample2 - sample;
%         d = dtw(sig1,sig2,window);
%         t(i) = time(sample);
%         MD(i) = d;
%     end 
% 
%     %Calculate MV
%     realMD = medfilt1(MD,8);
%     [pxx,f] = plomb(realMD,t);
%     i2 = 0.55;
%     if(f(end) < 0.55) 
%         i2 = f(end);
%     end 
%     if(f(end) < 0.30)
%         mv = 0; 
%     else 
%         mv = bandpower(pxx,f,[0.30 i2], 'psd');
%     end 
%     svdbData(j,3) = mv;
% 
%     %Calculate MV-LF/HF
%     if(f(end) < 0.15)
%         mvlfhf = 0;
%     else
%         mvlf = bandpower(pxx,f, [0.04 0.15], 'psd');
%         i3 = 0.40;
%         if (f(end) < 0.40) 
%             i3 = f(end);
%         end
%         mvhf = bandpower(pxx, f, [0.15 i3], 'psd');
%         mvlfhf = mvlf / mvhf; 
%     end 
%     svdbData(j,4) = mvlfhf;
%     
%     
% end

% %nsrdb Database 
% dir2Name = 'nsrdb';
% %nsrdbData2 = zeros(size(nsrdbRecords,1),4); 
% %size(nsrdbRecords,1) put as end in loop
% for k=1:6,
%     %Find files 
%     recordNum = num2str(nsrdbRecords(k));
%     recordName = strcat(dir2Name, '/', recordNum); 
%     wfdb2mat(recordName, [], 537601, 268801);
%     recordMat = strcat(recordNum, 'm');
%     [time, signal, Fs, labels] = rdmat(recordMat); 
%     time = time.';
%     signal(:,2) = [];
% 
%     %Locate heartbeats
%     gqrs(recordName, 537601, 268801);
%     samp = rdann(recordName, 'qrs'); 
% 
%     %Filter file 
%     [r,c] = size(samp);
%     N = round(r-1);
%     MD = zeros(N,1);
%     t = zeros(N,1);
%     fsignal = medfilt1(signal, round(Fs * 0.2));
%     bsignal = medfilt1(fsignal, round(Fs * 0.6));
%     rsignal = signal - bsignal;
% 
%     %Calculate HRV LF/HF
%     [tpxx, tf] = plomb(rsignal, time); 
%     lf = bandpower(tpxx,tf, [0.04 0.15], 'psd');
%     e2 = 0.40;
%     if(tf(end) < 0.40) 
%         e2 = tf(end);
%     end 
%     hf = bandpower(tpxx,tf, [0.15 e2], 'psd');
%     lfhf = lf / hf; 
%     nsrdbData2(k,1) = lfhf;
%     
%     %Calculate HRV SDNN
%     [rr, tm] = ann2rr(recordName, 'qrs');
%     SDNN = std(rr);
%     nsrdbData2(k,2) = SDNN;
% 
%     %Find MD through DTW
%     marker = 1;
%     for i=1:N,
%         sample = samp(i);
%         sample2 = samp(i+1);
%         if(sample2 > 537601) 
%             sample2 = 537601;
%         end 
%         sample = sample - 268800;
%         sample2 = sample2 - 268800;
%         if(sample < 0);
%             sample = 1; 
%         end 
%         sig1 = horzcat(time(marker:sample), rsignal(marker:sample));
%         s = sample + 1;
%         sig2 = horzcat(time(s:sample2), rsignal(s:sample2));
%         marker = sample;
%         window = sample2 - sample;
%         d = dtw(sig1,sig2,window);
%         t(i) = time(sample);
%         MD(i) = d;
%     end 
% 
%     %Calculate MV
%     realMD = medfilt1(MD,8);
%     [pxx,f] = plomb(realMD,t);
%     i2 = 0.55;
%     if(f(end) < 0.55) 
%         i2 = f(end);
%     end 
%     if(f(end) < 0.30)
%         mv = 0; 
%     else 
%         mv = bandpower(pxx,f,[0.30 i2], 'psd');
%     end 
%     nsrdbData2(k,3) = mv;
%     
%     %Calculate MV-LF/HF
%     if(f(end) < 0.15)
%         mvlfhf = 0;
%     else
%         mvlf = bandpower(pxx,f, [0.04 0.15], 'psd');
%         i3 = 0.40;
%         if (f(end) < 0.40) 
%             i3 = f(end);
%         end
%         mvhf = bandpower(pxx, f, [0.15 i3], 'psd');
%         mvlfhf = mvlf / mvhf; 
%     end 
%     nsrdbData2(k,4) = mvlfhf;
%     
% end

% %cudb Database 
% dirName = 'cudb';
% %cudbData = zeros(size(cudbRecords,1),4);
% %size(vfdbRecords,1)
% for j=1: 2,
%     %Find files 
%     recordNum = num2str(cudbRecords(j));
%     recordName = strcat(dirName, '/', 'cu', recordNum); 
%     if ( j < 10) 
%         recordName = strcat(dirName, '/', 'cu', '0', recordNum);
%     end 
%     wfdb2mat(recordName, [], 45000);
%     recordMat = strcat('cu',recordNum, 'm');
%     if (j < 10) 
%         recordMat = strcat('cu', '0', recordNum, 'm');
%     end 
%     [time, signal, Fs, labels] = rdmat(recordMat); 
%     time = time.';
%     
%     %Locate heartbeats
%     gqrs(recordName, 45000);
%     samp = rdann(recordName, 'qrs'); 
%     
%     %Filter file 
%     [r,c] = size(samp);
%     N = round(r-1);
%     MD = zeros(N,1);
%     t = zeros(N,1);
%     fsignal = medfilt1(signal, round(Fs * 0.2));
%     bsignal = medfilt1(fsignal, round(Fs * 0.6));
%     rsignal = signal - bsignal;
% 
%     %Calculate HRV LF/HF
%     [tpxx, tf] = plomb(rsignal, time); 
%     lf = bandpower(tpxx,tf, [0.04 0.15], 'psd');
%     e2 = 0.40;
%     if(tf(end) < 0.40) 
%         e2 = tf(end);
%     end 
%     hf = bandpower(tpxx,tf, [0.15 e2], 'psd');
%     lfhf = lf / hf; 
%     cudbData(j,1) = lfhf;
% 
%     %Calculate HRV SDNN
%     [rr, tm] = ann2rr(recordName, 'qrs');
%     SDNN = std(rr);
%     cudbData(j,2) = SDNN;
% 
%     %Find MD through DTW
%     marker = 1;
%     for i=1:N,
%         sample = samp(i);
%         sample2 = samp(i+1);
%         if (sample > 45000)
%             MD(N) = [];
%             t(N) = [];
%             break
%         end 
%         if (sample2 > 45000)
%             sample2 = 45000;
%         end 
%         sig1 = horzcat(time(marker:sample), rsignal(marker:sample));
%         s = sample + 1;
%         sig2 = horzcat(time(s:sample2), rsignal(s:sample2));
%         marker = sample;
%         window = sample2 - sample;
%         d = dtw(sig1,sig2,window);
%         t(i) = time(sample);
%         MD(i) = d;
%     end 
% 
%     %Calculate MV
%     realMD = medfilt1(MD,8);
%     [pxx,f] = plomb(realMD,t);
%     i2 = 0.55;
%     if(f(end) < 0.55) 
%         i2 = f(end);
%     end 
%     if(f(end) < 0.30)
%         mv = 0; 
%     else 
%         mv = bandpower(pxx,f,[0.30 i2], 'psd');
%     end 
%     cudbData(j,3) = mv;
% 
%     %Calculate MV-LF/HF
%     if(f(end) < 0.15)
%         mvlfhf = 0;
%     else
%         mvlf = bandpower(pxx,f, [0.04 0.15], 'psd');
%         i3 = 0.40;
%         if (f(end) < 0.40) 
%             i3 = f(end);
%         end
%         mvhf = bandpower(pxx, f, [0.15 i3], 'psd');
%         mvlfhf = mvlf / mvhf; 
%     end 
%     cudbData(j,4) = mvlfhf;
%     
%     
% end


%fantasia Database 
dirName = 'fantasia';
%fantasiaData = zeros(size(fantasiaRecords,1),4);
for j=1: size(fantasiaRecords,1),
    %Find files 
    %recordNum = num2str(fantasiaRecords(j));
    recordName = strcat(dirName, '/', fantasiaRecords(j));
    recordName = char(recordName);
    wfdb2mat(recordName, [], 525000);
    recordMat = strcat(fantasiaRecords(j), 'm');
    recordMat = char(recordMat);
    [time, signal, Fs, labels] = rdmat(recordMat); 
    time = time.';
    signal = signal(:,2);
    
    %Locate heartbeats
    %gqrs(recordName, 525000);
    samp = rdann(recordName, 'ecg', [], 525000); 
    
    %Filter file 
    [r,c] = size(samp);
    N = round(r-1);
    MD = zeros(N,1);
    t = zeros(N,1);
    fsignal = medfilt1(signal, round(Fs * 0.2));
    bsignal = medfilt1(fsignal, round(Fs * 0.6));
    rsignal = signal - bsignal;

    %Calculate HRV LF/HF
    [tpxx, tf] = plomb(rsignal, time); 
    lf = bandpower(tpxx,tf, [0.04 0.15], 'psd');
    e2 = 0.40;
    if(tf(end) < 0.40) 
        e2 = tf(end);
    end 
    hf = bandpower(tpxx,tf, [0.15 e2], 'psd');
    lfhf = lf / hf; 
    fantasiaData(j,1) = lfhf;

    %Calculate HRV SDNN
    [rr, tm] = ann2rr(recordName, 'ecg');
    SDNN = std(rr);
    fantasiaData(j,2) = SDNN;

    %Find MD using dynamic time warping function (dtw)
    marker = 1;
    for i=1:N,
        sample = samp(i);
        sample2 = samp(i+1);
        if (sample > 525000)
            MD(N) = [];
            t(N) = [];
            break
        end
        if (sample2 > 525000)
            sample2 = 525000;
        end 
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
    [pxx,f] = plomb(realMD,t);
    i2 = 0.55;
    if(f(end) < 0.55) 
        i2 = f(end);
    end 
    if(f(end) < 0.30)
        mv = 0; 
    else 
        mv = bandpower(pxx,f,[0.30 i2], 'psd');
    end 
    fantasiaData(j,3) = mv;

    %Calculate MV-LF/HF
    if(f(end) < 0.15)
        mvlfhf = 0;
    else
        mvlf = bandpower(pxx,f, [0.04 0.15], 'psd');
        i3 = 0.40;
        if (f(end) < 0.40) 
            i3 = f(end);
        end
        mvhf = bandpower(pxx, f, [0.15 i3], 'psd');
        mvlfhf = mvlf / mvhf; 
    end 
    fantasiaData(j,4) = mvlfhf;
    
    
end