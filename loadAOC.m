function [header,dta] = loadAOC(fname,varargin)
    % load the text file as cell array. Save each line in separate rows
    % Options:
    % 'hLines' - number of lines for the header
    % 'pat' - pattern for splitting text in each line
    % 'asNum' - convert text in each cell to number

    % parse arguments...
    p = inputParser();
    p.addRequired('fname',@(x) validateattributes(x,{'char'},{'nonempty'}));
    p.addParameter('hLines',0,@(x) validateattributes(x,{'numeric'},{'scalar'}));
    p.addParameter('pat','');
    p.addParameter('asNum',false,@(x) validateattributes(x,{'logical'},{'scalar','nonempty'})); 

    p.parse(fname,varargin{:});
    args = p.Results;


    fid = fopen(fname);
    cnt = 1;
    while ~feof(fid)
        ll = fgetl(fid);
        dta{cnt,1} = ll;
        cnt = cnt + 1;
    end
    
    fclose(fid);
    
    if args.hLines >0
        header = dta{1:hLines};
        dta = dta{hLines+1:end};
    else
        header = '';
    end

    if ~isempty(args.pat)
        for ii = 1:numel(dta)
            tmp = regexp(dta{ii,1},' ','split');
            for jj = 1:numel(tmp)
                dta{ii,jj} = tmp{jj};
            end
        end
    end

    if args.asNum
        dta = cellfun(@str2num,dta,'UniformOutput',false);
    end
end