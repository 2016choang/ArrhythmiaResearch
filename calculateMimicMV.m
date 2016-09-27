%Mimic Database 
for j=142: 225,
    %Find files 
    %recordNum = num2str(fantasiaRecords(j));
    wfdb2mat(char(recordNames(j)), [], recordStop(j), recordStart(j));
    recordMat = strcat('a',char(recordMats(j)), 'm');
    [time, signal, Fs, labels] = rdmat(recordMat); 
    time = time.';
    signal = signal(:,1);
    
    %Locate heartbeats
    cd mimic2db;
    cd(strcat('a', char(recordMats(j))));
    samp = rdann(strcat('a', char(recordMats(j))), 'qrs');
    cd ..;
    cd ..;
    
    %Filter file 
    [r,c] = size(samp);
    N = round(r-1);
    MD = zeros(N,1);
    t = zeros(N,1);
    fsignal = medfilt1(signal, round(Fs * 0.2));
    bsignal = medfilt1(fsignal, round(Fs * 0.6));
    rsignal = signal - bsignal;

%     %Calculate HRV LF/HF
%     [tpxx, tf] = plomb(rsignal, time); 
%     lf = bandpower(tpxx,tf, [0.04 0.15], 'psd');
%     e2 = 0.40;
%     if(tf(end) < 0.40) 
%         e2 = tf(end);
%     end 
%     hf = bandpower(tpxx,tf, [0.15 e2], 'psd');
%     lfhf = lf / hf; 
%     fantasiaData(j,1) = lfhf;
% 
%     %Calculate HRV SDNN
%     [rr, tm] = ann2rr(recordName, 'ecg');
%     SDNN = std(rr);
%     fantasiaData(j,2) = SDNN;

    %Find MD through DTW
    marker = 1;
    for i=1:N,
        sample = samp(i);
        sample2 = samp(i+1);
        sample = sample - recordStart(j);
        sample2 = sample2 - recordStart(j);
        if (sample > (recordStop(j)-recordStart(j)))
            MD(N) = [];
            t(N) = [];
            break
        end
        if (sample2 > (recordStop(j) - recordStart(j)))
            sample2 = recordStop(j) - recordStart(j);
        end 
        if (sample < 1)
            sample = 1;
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
    mimicData(j,1) = mv;

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
    mimicData(j,2) = mvlfhf;
    
    
end