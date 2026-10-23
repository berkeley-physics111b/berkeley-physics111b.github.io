function [a_x,fo_x] = fitlogcurvevarX( varargin )
% Input varargin in the form "data1,pwr1,data2,pwr2,..."
% This next loop concatonates all the power levels into a vector.
% NOTE: The loops throughout this function check EVERY OTHER input in
% varargin, due to the convenience of the order of the input (data,pwr,...)
for i = 2:2:length(varargin)
    pwr(i/2)=cell2mat(varargin(i)); 
end
col = 'rgbcmyk'; % The 'color' string: each letter specifies a unique color
                  % for the plot (i.e. col(5) = 'm' --> magenta)
a_x = []; fo_x = [];
for i = 1:2:length(varargin)
    data = cell2mat(varargin(i)); %Required statement to convert to matrix
    xdata = log(data(1:2113,1) * 0.75);
    ydata = log(data(1:2113,2));
    start_point = rand(1, 2); %Generates 2 points to start minimization
    model = @logfun1;
    opts1 = optimset ('MaxFunEvals',1e5);
    opts2 = optimset('maxiter',1e5);
    options = optimset(opts1,opts2);
    estimates1 = fminsearch(model, start_point,options);
    %The plotting assumes an offset of 1 so that each plot in the loop will
    %not overlap the previous plots. The term 'col(mod((i+1)/2,8)))' 
    %indicates the color used that is guaranteed to be different from each
    %of the 7 plots above or below.
    plot(log10(exp(xdata)), ((i-1)/2 + log10(exp(ydata))), ['.',col(mod((i-1)/2,7)+1)], 'MarkerSize',4)
    hold on
    [sse1, FittedCurve1] = model(estimates1);
    plot(log10(exp(xdata)), ((i-1)/2 + log10(exp(FittedCurve1))), col(mod((i-1)/2,7)+1));
    %The next four lines help generate the legend of the graph (my guess is
    %there is an easier way to do this, but this way works)
    str = ['Power ', num2str(pwr((i+1)/2),2)];
    str2 = ['fitted curve a =',num2str(Alpha1, 4),' fo =', num2str(rolloff1, 4)];
    leg(i,1:length(str)) = str;
    leg((i+1),1:length(str2)) = str2;
    %Finally, the next two lines concatonates the alpha and rolloff values
    %into two vectors, a_x and fo_x, respectively.
    a_x = [a_x Alpha1];
    fo_x = [fo_x rolloff1];
end
% logfun accepts curve parameters as inputs, and outputs sse,
% the sum of squares error for A + .5*log(B^2+xdata.^2) - ydata, 
% and the FittedCurve. 
    function [sse1, FittedCurve1] = logfun1(params1)
        Alpha1 = params1(1);
        rolloff1 = params1(2);
        FittedCurve1 = log(Alpha1) - log(rolloff1.^2+exp(xdata.*2)); %1.0? or 0.5
        ErrorVector1 = FittedCurve1 - ydata;
        sse1 = sum(ErrorVector1 .^ 2);
    end
legend(leg);
xlabel('Log Frequency (Hz)');
ylabel('PSD (V^2/Hz)');
title('Log Power Spectral Density (X)');
end


