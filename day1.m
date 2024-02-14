% day 1

% load txt file
[~,dta] = loadAOC('day1.txt','asNum',true);
dta = cell2mat(dta);

% part 1
fuel = floor(dta./3)-2;
sum(fuel)
clear fuel

% part 2
for ii = 1:numel(dta)
    tmp = dta(ii);
    tmpArray = [];
    cnt = 1;
    while tmp>0
        tmp = floor(tmp/3)-2;
        tmpArray(cnt) = tmp;
        cnt = cnt+1;
    end
    fuel(ii) = sum(tmpArray(1:end-1));
end
sum(fuel)