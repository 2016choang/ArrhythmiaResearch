v = VideoWriter('demo2.mp4', 'MPEG-4');
v.FrameRate = 25;
open(v);
fig = figure;
hold on;
h = scatter(0,0, 'r');
f = scatter(0,0, 'g');
g = scatter(0,0, 'b');
i = scatter(0,0, 'm');
legend([h,f,g,i],'Unhealthy', 'Healthy', 'Misclassified', 'New Apnea-ECG Data', 'Location', 'northwest');
h.Visible = 'off';
g.Visible = 'off';
f.Visible = 'off';
i.Visible = 'off';
xlabel('Predicted Class Scores');
ylabel('MV-LF/HF');
title('SVM Classifier 7: Predictions vs. MV-LF/HF');
axis([-2.5 2.5 0 40 ]);
for k = 1:167,
    if (strcmp(rtrain(k, 1), 'unhealthy'))
        scatter(-1, cell2mat(rtrain(k,17)), 'r');
    else 
        scatter(1, cell2mat(rtrain(k,17)), 'g');
    end
    frame = getframe(fig);
    writeVideo(v, frame);
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
    frame = getframe(fig);
    writeVideo(v, frame);
    drawnow
end

for k = 1:78,
    scatter(1, apneaData(k, 2), 'm');
    frame = getframe(fig);
    writeVideo(v, frame);
    drawnow
end

fig = figure;
hold on;
h = scatter(0,0, 'r');
f = scatter(0,0, 'g');
g = scatter(0,0, 'b');
i = scatter(0,0, 'm');
legend([h,f,g,i],'Unhealthy', 'Healthy', 'Misclassified', 'New Apnea-ECG Data', 'Location', 'east');
h.Visible = 'off';
g.Visible = 'off';
f.Visible = 'off';
i.Visible = 'off';
xlabel('Predicted Class Scores');
ylabel('MV (dBW)');
title('SVM Classifier 7: Predictions vs. MV');
axis([-2.5 2.5 0 3500]);
for k = 1:167,
    if (strcmp(rtrain(k, 1), 'unhealthy'))
        scatter(-1, cell2mat(rtrain(k,16)), 'r');
    else 
        scatter(1, cell2mat(rtrain(k,16)), 'g');
    end
    frame = getframe(fig);
    writeVideo(v, frame);
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
    frame = getframe(fig);
    writeVideo(v, frame);
    drawnow
end

for k = 1:78,
    scatter(1, apneaData(k, 1), 'm');
    frame = getframe(fig);
    writeVideo(v, frame);
    drawnow
end

fig = figure;
hold on;
h = scatter(0,0, 'r');
f = scatter(0,0, 'g');
g = scatter(0,0, 'b');
legend([h,f,g],'Unhealthy', 'Healthy', 'Misclassified', 'Location', 'best');
h.Visible = 'off';
g.Visible = 'off';
f.Visible = 'off';
xlabel('Predicted Class Scores');
ylabel('Average NN Interval (sec)');
title('SVM Classifier 7: Predictions vs. Average NN Interval');
axis([-2.5 2.5 0 11]);
for k = 1:167,
    if (strcmp(rtrain(k, 1), 'unhealthy'))
        scatter(-1, cell2mat(rtrain(k,4)), 'r');
    else 
        scatter(1, cell2mat(rtrain(k,4)), 'g');
    end
    frame = getframe(fig);
    writeVideo(v, frame);
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
    frame = getframe(fig);
    writeVideo(v, frame);
    drawnow
end

fig = figure;
hold on;
h = scatter(0,0, 'r');
f = scatter(0,0, 'g');
g = scatter(0,0, 'b');
legend([h,f,g],'Unhealthy', 'Healthy', 'Misclassified', 'Location', 'best');
h.Visible = 'off';
g.Visible = 'off';
f.Visible = 'off';
xlabel('Predicted Class Scores');
ylabel('rMSSD (sec)');
title('SVM Classifier 7: Predictions vs. rMSSD');
axis([-2.5 2.5 0 20]);
for k = 1:167,
    if (strcmp(rtrain(k, 1), 'unhealthy'))
        scatter(-1, cell2mat(rtrain(k,8)), 'r');
    else 
        scatter(1, cell2mat(rtrain(k,8)), 'g');
    end
    frame = getframe(fig);
    writeVideo(v, frame);
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
    frame = getframe(fig);
    writeVideo(v, frame);
    drawnow
end

fig = figure;
hold on;
axis([0 1 0 1]);
xlabel('False positive rate');
ylabel('True positive rate');
title('SVM Classifier 1 ROC Curve');
h = animatedline;
str = ['Area under the curve = ', num2str(AUC8)];
text(0.5, 0.5, str, 'HorizontalAlignment', 'right');
for k = 1:218,
    addpoints(h, X8(k), Y8(k));
    frame = getframe(fig);
    writeVideo(v, frame);
    drawnow
    pause(0.01);
end

fig = figure;
hold on;
axis([0 1 0 1]);
xlabel('False positive rate');
ylabel('True positive rate');
title('SVM Classifier 2 ROC Curve');
h = animatedline;
str = ['Area under the curve = ', num2str(AUC13)];
text(0.5, 0.5, str, 'HorizontalAlignment', 'right');
for k = 1:218,
    addpoints(h, X13(k), Y13(k));
    frame = getframe(fig);
    writeVideo(v, frame);
    drawnow
    pause(0.01);
end


fig = figure;
hold on;
axis([0 1 0 1]);
xlabel('False positive rate');
ylabel('True positive rate');
title('SVM Classifier 6 ROC Curve');
h = animatedline;
str = ['Area under the curve = ', num2str(AUC18)];
text(0.5, 0.5, str, 'HorizontalAlignment', 'right');
for k = 1:166,
    addpoints(h, X18(k), Y18(k));
    frame = getframe(fig);
    writeVideo(v, frame);
    drawnow
    pause(0.01);
end

fig = figure;
hold on;
axis([0 1 0 1]);
xlabel('False positive rate');
ylabel('True positive rate');
title('SVM Classifier 7 ROC Curve');
h = animatedline;
str = ['Area under the curve = ', num2str(AUC19)];
text(0.5, 0.5, str, 'HorizontalAlignment', 'right');
for k = 1:166,
    addpoints(h, X19(k), Y19(k));
    frame = getframe(fig);
    writeVideo(v, frame);
    drawnow
    pause(0.01);
end

close(v);