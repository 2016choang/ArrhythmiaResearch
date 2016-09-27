%Apnea Database 
dirName = 'apnea-ecg';
%apneaData = zeros(size(apneaRecords,1),2);
%size(apneaRecords,1)
for j=1: 1,
    %Find files 
    recordNum = char(apneaRecords(j));
    recordName = strcat(dirName, '/', recordNum); 
    [time, signal, Fs] = rdsamp(recordName, [], 268800);
    signal = signal(:,1);
    
    %Locate heartbeats
    %gqrs(recordName, 268800);
    samp = rdann(recordName, 'qrs', [], 268800); 
    
    %Filter file 
    [r,c] = size(samp);
    N = round(r-1);
    MD = zeros(N,1);
    t = zeros(N,1);
    fsignal = medfilt1(signal, round(100 * 0.2));
    bsignal = medfilt1(fsignal, round(100 * 0.6));
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
%     vfdbData(j,1) = lfhf;
% 
%     %Calculate HRV SDNN
%     [rr, tm] = ann2rr(recordName, 'qrs');
%     SDNN = std(rr);
%     vfdbData(j,2) = SDNN;

    %Find MD through DTW
    marker = 1;
    for i=1:N,
        sample = samp(i);
        if (sample > 268800)
            MD(N) = [];
            t(N) = [];
            break
        end
        sample2 = samp(i+1);
        if (sample2 > 268800)
            sample2 = 268800;
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
    apneaData(j,1) = mv;

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
    apneaData(j,2) = mvlfhf;
    
    
end