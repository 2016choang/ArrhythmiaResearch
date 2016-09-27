% for i=1:size(mimicRecords,1),
%     recordNum = num2str(mimicRecords(i));
%     recordName = strcat('mimic2db/a', recordNum, '/a', recordNum);
%     [ann, type, subtype, chan, num, comments] = rdann(recordName, 'alM');
%     mimicInfo(i, 1) = cellstr(recordNum);
%     if(~isempty(ann))
%         n = 1;
%         while 1
%             if(n > size(ann))
%                 n = 0;
%                 break
%             end
%             if(chan(n) == 2)
%                 if(ann(n) > 37500)
%                     break
%                 end
%             end
%             n = n + 1;
%         end
%         if(n == 0)
%             mimicInfo(i,2) = num2cell(0);
%             mimicInfo(i,3) = num2cell(0);
%         else 
%             mimicInfo(i, 2) = num2cell(ann(n));
%             mimicInfo(i, 3) = comments(n);
%         end
%     end
% end 


% count = 0;
% for i=1: 498,
%     if(isequal(mimicInfo(i,2), {0}))
%         count = count + 1;
%     end
% end

% for i=1: 498,
%     mimicInfo(i,4) = num2cell(cell2mat(mimicInfo(i,2)) - 37500);
% end 

% for i=1: 498,
%     if(~isequal(mimicInfo(i,2), {0}))
%         cleanMimic = vertcat(cleanMimic, mimicInfo(i,:));
%     end
% end

for i=1: 371,
    rNum = num2str(r(i));
    rName = strcat('mimic2db/a', rNum, '/a', rNum); 
    start = cell2mat(cleanMimic(i, 4));
    stop = cell2mat(cleanMimic(i, 2));
    gqrs(rName, stop, start);
end




        
    