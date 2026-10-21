function [xout, yout] = BetaAddUpDwnCurves(upx,upy,downx,downy)
%
%
%



if (nargin < 4 || nargin > 4)
    error('Must have 4 input vectors: upx, upy, downx, downy');
else
    upx = upx(:); upy = upy(:); downx = downx(:); downy = downy(:);
    if(length(upx) ~= length(upy) || length(upy) ~= length(downx) ...
            || length(downx) ~= length(downy))
        error ('Input vectors must all have the same length');
    end
end

maxup = peakdet(upy,max(upy)/2,upx); maxup = maxup(2,:);
maxdwn = peakdet(downy,max(downy)/2,downx); maxdwn = maxdwn(2,:);

maxup(3) = find(upx == maxup(1));
maxdwn(3) = find(downx == maxdwn(1));
% At this pt the vectors maxup/maxdwn represent the location of the k-peak
% where max___ = [ Bin_loc, Counts, Bin_# ]

shiftamt = (maxup(1) - maxdwn(1))./2;
goald = maxdwn(1) + shiftamt;
shiftu = goald - maxup(1);
downx = downx + shiftamt;
upx = upx + shiftu;

b = 1;
k = 1;
finalx(1) = 0; finaly(1) = 0;
if(upx(1) < downx(1))
    for i = 1:length(upx)
        index = find(downx == upx(i));
        if (isempty(index))
            finalx(b,1) = upx(i);
            finaly(b,1) = upy(i);
            b = b+1;
        elseif (length(index) == 1)
            finalx(b,1) = upx(i);
            finaly(b,1) = (upy(i)+downy(index));
            b = b+1; k = k+1;
        else
            error( 'The x vectors did not line up, are these up/down from the same data set?')
        end
    end
    finalx = [finalx ; downx(k:length(downx))];
    finaly = [finaly ; downy(k:length(downy))];
else
    for i = 1:length(downx)
        index = find(upx == downx(i));
        if (isempty(index))
            finalx(b,1) = downx(i);
            finaly(b,1) = downy(i);
            b = b+1;
        elseif (length(index) == 1)
            finalx(b,1) = downx(i);
            finaly(b,1) = (upy(i)+downy(index));
            b = b+1; k = k+1;
        else
            error( 'The x vectors did not line up, are these up/down from the same data set?')
        end
    end
    finalx = [finalx ; upx(k:length(upx))];
    finaly = [finaly ; upy(k:length(upy))];
end
xout = finalx;
yout = finaly;