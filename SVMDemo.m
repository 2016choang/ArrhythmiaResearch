subplot(2,2,1);
xlabel('Predicted class scores');
ylabel('MV-LF/HF');
hold on;
axis([-2.5 2.5 0 40 ]);
for k = 1:167,
    if (strcmp(rtrain(k, 1), 'unhealthy'))
        scatter(-1, cell2mat(rtrain(k,17)), 'r');
    else 
        scatter(1, cell2mat(rtrain(k,17)), 'g');
    end
    drawnow  
end

for k = 1:165,
    x = score19(k);
    if(x > 2) 
        x = 2;
    end
    if(x < -2)
        x = -2;
    end
    if(strcmp(rtest(k, 1), 'unhealthy'))
        if(x > 0)
            scatter(x, cell2mat(rtest(k, 17)), 'b');
        else
            scatter(x, cell2mat(rtest(k, 17)), 'r');
        end
    else
        if(x < 0)
            scatter(x, cell2mat(rtest(k, 17)), 'b');
        else
            scatter(x, cell2mat(rtest(k, 17)), 'g');
        end
    end
    drawnow
end

for k = 1:78,
    scatter(1, apneaData(k, 2), 'm');
    drawnow
end

subplot(2,2,2);
hold on;
xlabel('Predicted class scores');
ylabel('MV (dBW)');
axis([-2.5 2.5 0 3500]);
for k = 1:167,
    if (strcmp(rtrain(k, 1), 'unhealthy'))
        scatter(-1, cell2mat(rtrain(k,16)), 'r');
    else 
        scatter(1, cell2mat(rtrain(k,16)), 'g');
    end
    drawnow  
end

for k = 1:165,
    x = score19(k);
    if(x > 2) 
        x = 2;
    end
    if(x < -2)
        x = -2;
    end
    if(strcmp(rtest(k, 1), 'unhealthy'))
        if(x > 0)
            scatter(x, cell2mat(rtest(k, 16)), 'b');
        else
            scatter(x, cell2mat(rtest(k, 16)), 'r');
        end
    else
        if(x < 0)
            scatter(x, cell2mat(rtest(k, 16)), 'b');
        else
            scatter(x, cell2mat(rtest(k, 16)), 'g');
        end
    end
    drawnow
end

for k = 1:78,
    scatter(1, apneaData(k, 1), 'm');
    drawnow
end

subplot(2,2,3);
hold on;
xlabel('Predicted class scores');
ylabel('Average NN Interval (sec)');
axis([-2.5 2.5 0 11]);
for k = 1:167,
    if (strcmp(rtrain(k, 1), 'unhealthy'))
        scatter(-1, cell2mat(rtrain(k,4)), 'r');
    else 
        scatter(1, cell2mat(rtrain(k,4)), 'g');
    end
    drawnow  
end

for k = 1:165,
    x = score19(k);
    if(x > 2) 
        x = 2;
    end
    if(x < -2)
        x = -2;
    end
    if(strcmp(rtest(k, 1), 'unhealthy'))
        if(x > 0)
            scatter(x, cell2mat(rtest(k, 4)), 'b');
        else    
            scatter(x, cell2mat(rtest(k, 4)), 'r');
        end
    else
        if(x < 0)
            scatter(x, cell2mat(rtest(k, 4)), 'b'); 
        else
            scatter(x, cell2mat(rtest(k, 4)), 'g');
        end
    end
    drawnow
end

subplot(2,2,4);
hold on;
xlabel('Predicted class scores');
ylabel('rMSSD (sec)');
axis([-2.5 2.5 0 20]);
for k = 1:167,
    if (strcmp(rtrain(k, 1), 'unhealthy'))
        scatter(-1, cell2mat(rtrain(k,8)), 'r');
    else 
        scatter(1, cell2mat(rtrain(k,8)), 'g');
    end
    drawnow  
end

for k = 1:165,
    x = score19(k);
    if(x > 2) 
        x = 2;
    end
    if(x < -2)
        x = -2;
    end
    if(strcmp(rtest(k, 1), 'unhealthy'))
        if(x > 0)
            scatter(x, cell2mat(rtest(k, 8)), 'b');
        else
            scatter(x, cell2mat(rtest(k, 8)), 'r');
        end
    else
        if(x < 0)
            scatter(x, cell2mat(rtest(k, 8)), 'b');
        else
            scatter(x, cell2mat(rtest(k, 8)), 'g');
        end
    end
    drawnow
end

figure
subplot(2, 2, 1);
axis([0 1 0 1]);
xlabel('False positive rate');
ylabel('True positive rate');
title('SVM Model 8 ROC Curve');
h = animatedline;
for k = 1:218,
    addpoints(h, X8(k), Y8(k));
    drawnow
    pause(0.01);
end
str = ['Area under the curve = ', num2str(AUC8)];
text(0.5, 0.5, str, 'HorizontalAlignment', 'right');

subplot(2, 2, 2);
axis([0 1 0 1]);
xlabel('False positive rate');
ylabel('True positive rate');
title('SVM Model 13 ROC Curve');
h = animatedline;
for k = 1:218,
    addpoints(h, X13(k), Y13(k));
    drawnow
    pause(0.01);
end
str = ['Area under the curve = ', num2str(AUC13)];
text(0.5, 0.5, str, 'HorizontalAlignment', 'right');

subplot(2, 2, 3);
axis([0 1 0 1]);
xlabel('False positive rate');
ylabel('True positive rate');
title('SVM Model 18 ROC Curve');
h = animatedline;
for k = 1:166,
    addpoints(h, X18(k), Y18(k));
    drawnow
    pause(0.01);
end
str = ['Area under the curve = ', num2str(AUC18)];
text(0.5, 0.5, str, 'HorizontalAlignment', 'right');

subplot(2, 2, 4);
axis([0 1 0 1]);
xlabel('False positive rate');
ylabel('True positive rate');
title('SVM Model 19 ROC Curve');
h = animatedline;
for k = 1:166,
    addpoints(h, X19(k), Y19(k));
    drawnow
    pause(0.01);
end
str = ['Area under the curve = ', num2str(AUC19)];
text(0.5, 0.5, str, 'HorizontalAlignment', 'right');