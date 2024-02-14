% day 2

% load txt file
[~,dtaOg] = loadAOC('day2.txt','pat',',','asNum',true);
dtaOg = cell2mat(dtaOg);

% part 1
% note: matlab index starts from 1, but the indexing in the question starts
% from 0
dta = dtaOg;
dta(1+1) = 12;
dta(2+1) = 2;

ii = 1;
while dta(ii)~=99
    switch dta(ii)
        case 1
            dta(dta(ii+3)+1) = dta(dta(ii+1)+1) + dta(dta(ii+2)+1);
        case 2
            dta(dta(ii+3)+1) = dta(dta(ii+1)+1) * dta(dta(ii+2)+1);
    end
    ii = ii + 4;
end
disp(dta(1))

% part 2
for noun = 1:99
    for verb = 1:99
        dta = dtaOg;
        dta(1+1) = noun;
        dta(2+1) = verb;
        
        ii = 1;
        while dta(ii)~=99
            switch dta(ii)
                case 1
                    dta(dta(ii+3)+1) = dta(dta(ii+1)+1) + dta(dta(ii+2)+1);
                case 2
                    dta(dta(ii+3)+1) = dta(dta(ii+1)+1) * dta(dta(ii+2)+1);
            end
            ii = ii + 4;
        end
        if dta(1) == 19690720
            disp(noun*100+verb)
            break
        end
    end
end