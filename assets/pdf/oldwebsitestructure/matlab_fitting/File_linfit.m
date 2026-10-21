function [ outStruct ] = linfit( x, y, dy )
%LINFIT Performs a Linear Fit on data and calculates
%       uncertainty in fits.  Fit is y = A + B*x
%
%   Part of the Physics 111 MATLAB Fitting Toolkit - 2009
%
%   INPUTS: x, y, (dy)
%       All inputs must be the same size and either Nx1 or 1xN in dimension.
%       If dy is not provided, the fit will assume an equal weights fitting
%       
%   RETURNS: A struct containing the following fields:
%       A: Y-intercept
%       B: Slope
%       siga/sigb: Uncertainties in A/B respectively
%       fitx/fity: The x/y coordinates for the fit.  X coordinates
%           are necessarily the same as the input.
%       chi2: A chi^2 estimate of goodness of fit.  NOT reduced.
%           For degrees of freedom for a reduced chi2, use the form
%           of the equation along with the size of the fitx/y arrays.

N = length(x);
x = x(:); y = y(:);
if (~exist('dy','var'))
    delta = (N*sum(x.^2)-((sum(x))^2));
    A = ((sum(x.^2)*sum(y))-(sum(x)*sum(x.*y)))/delta;
    B = (N*sum(x.*y)-sum(x)*sum(y))/delta;
    if N > 2
        sigy = sqrt((1/(N-2))*sum((y - A - B*x).^2));
    end
    siga = sigy*(sqrt(sum(x.^2)/delta));
    sigb = sigy*(sqrt(N/delta));
else
    dy = dy(:);
    weights = 1./(dy.^2);
    delta = (sum(weights)*sum(weights.*(x.^2))) - ...
        (sum(weights.*x))^2;
    A = ((sum(weights.*(x.^2))*sum(weights.*y)) - ...
        (sum(weights.*x)*sum(weights.*x.*y))) / delta;
    B = ((sum(weights)*sum(weights.*x.*y)) - ...
        (sum(weights.*x)*sum(weights.*y))) / delta;
    siga = sqrt(sum(weights.*(x.^2))/delta);
    sigb = sqrt(sum(weights)/delta);
end

e_y = (A + B*x);
chi2 = sum(((y - e_y).^2)./e_y);

outStruct = struct();
outStruct.A = A;
outStruct.B = B;
outStruct.siga = siga;
outStruct.sigb = sigb;
outStruct.fitx = x;
outStruct.fity = e_y;
outStruct.chi2 = chi2;
end
