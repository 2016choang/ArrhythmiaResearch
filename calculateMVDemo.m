figure
subplot(2,2,1);
hold on;
xlabel('Time (sec)');
ylabel('ECG (mV)');
title('Original Signal');
plot(time(1:1000), signal(1:1000));
M(1) = getframe;

subplot(2,2,2);
hold on;
xlabel('Time (sec)');
ylabel('ECG (mV)');
title('Median Filter 1');
plot(time(1:1000), fsignal(1:1000));
M(2) = getframe;

subplot(2,2,3);
hold on;
xlabel('Time (sec)');
ylabel('ECG (mV)');
title('Median Filter 2');
plot(time(1:1000), bsignal(1:1000));
M(3) = getframe;

subplot(2,2,4);
hold on;
xlabel('Time (sec)');
ylabel('ECG (mV)');
title('Final Signal');
plot(time(1:1000), rsignal(1:1000));
M(4) = getframe;

figure
subplot(2,2,1);
hold on;
xlabel('Time (sec)');
ylabel('Energy Difference (mV)');
title('Morphological Distance Time-Series');
plot(t, MD);
M(5) = getframe;

subplot(2,2,2);
hold on;
xlabel('Time (sec)');
ylabel('Energy Difference (mV)');
title('Filtered Morphological Distance Time-Series');
plot(t, realMD);
M(6) = getframe;

subplot(2,2,3);
hold on;
xlabel('Frequency (Hz)');
ylabel('Power/frequency (dBW/Hz)');
title('Lomb-Scargle Periodogram');
plot(f, pxx);
M(7) = getframe;