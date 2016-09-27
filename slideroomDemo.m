v = VideoWriter('demo.mp4', 'MPEG-4');
v.FrameRate = 0.25;
open(v);
fig = figure;
hold on;
xlabel('Time (sec)');
ylabel('ECG (mV)');
title('Apnea-ECG/a01: Original Signal');
plot(time(1:1000), signal(1:1000));
M(1) = getframe(fig);

fig = figure;
hold on;
xlabel('Time (sec)');
ylabel('ECG (mV)');
title('Apnea-ECG/a01: Median Filter 1');
plot(time(1:1000), fsignal(1:1000));
M(2) = getframe(fig);

fig = figure;
hold on;
xlabel('Time (sec)');
ylabel('ECG (mV)');
title('Apnea-ECG/a01: Median Filter 2');
plot(time(1:1000), bsignal(1:1000));
M(3) = getframe(fig);

fig = figure;
hold on;
xlabel('Time (sec)');
ylabel('ECG (mV)');
title('Apnea-ECG/a01: Final Signal');
plot(time(1:1000), rsignal(1:1000));
M(4) = getframe(fig);

fig = figure;
hold on;
xlabel('Time (sec)');
ylabel('Energy Difference (mV)');
title('Apnea-ECG/a01: Morphological Distance Time-Series');
plot(t, MD);
M(5) = getframe(fig);

fig = figure;
hold on;
xlabel('Time (sec)');
ylabel('Energy Difference (mV)');
title('Apnea-ECG/a01: Filtered Morphological Distance Time-Series');
plot(t, realMD);
M(6) = getframe(fig);

fig = figure;
hold on;
xlabel('Frequency (Hz)');
ylabel('Power/frequency (dBW/Hz)');
title('Apnea-ECG/a01: Lomb-Scargle Periodogram');
plot(f, pxx);
M(7) = getframe(fig);
writeVideo(v, M);
close(v);