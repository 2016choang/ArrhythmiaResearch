for i = 1: 1000,
    net = feedforwardnet(20, 'trainbr');
    net = train(net, trainingdata, trainingout);
    testout = net(testdata);
    label = testout';
    label = round(label);
    comparison = horzcat(class2, label);
    howMany = sum(comparison);
    e = abs(howMany(1) - howMany(2));
    a(i) = e / 270;
end

% x = zeros(100,1);
% for i = 1: 100,
%     net = feedforwardnet(i, 'trainbr');
%     net = train(net, trainingdata, trainingout);
%     testout = net(testdata);
%     label = testout';
%     comparison = horzcat(class2, label);
%     howMany = sum(comparison);
%     e = abs(howMany(1) - howMany(2));
%     x(i) = e / 270;
%        
% end



