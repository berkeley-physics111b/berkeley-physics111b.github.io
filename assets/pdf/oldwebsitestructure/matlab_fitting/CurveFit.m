%%Curve Fitting
% Performs a nonlinear weighted fit using Gauss-Newton iteration and
% calculates uncertainties on the fit parameters. For examples of this in
% practice, see ExponentialFit or GaussianFit. Several lines of this
% program need to be filled in for a specific functional fit to given data
% with guesses for the fit parameters; complete all lines with "errors".

%%Inputs

x =       %Independent Variable
y =       %Dependent Variable
sigma_y = %Uncertainties in y; if omitted, the code assumes an unweighted
          %and finds a sigma_y to make the reduced chi-squared equal to 1
tol =     %Relative tolerance for the numerical iteration

P =       %Initial guess of fit paramteters [a1;a2;...an]
f =       %Fit function f(x,a1,a2,...,an)
Df =      %Jacobian Df(x,a1,a2,...,an) = [df/da1,df/da2,...df/dan]

%%Preconditioning

if (~exist('sigma_y','var')) %No uncertainties given (unweighted fit)
    u = 1;
    sigma_y = ones(size(y)); %Temporarily sets all uncertainties to 1
                             %This is rescaled once sigma_y is estimated
else
    u = 0;
    sigma_y(sigma_y<=0) = min(sigma_y(sigma_y>0)); %Resets nonpositive
                                                   %uncertainties
end

W = diag(sigma_y.^-2); %Weight matrix

%%Gauss-Newton iteration

err = Inf;
while err > tol
    J = %Df(x,P(1),P(2),...P(n))
    dy = %y-f(x,P(1),P(2),...P(n))
    N = J'*W*J;
    c = J'*W*dy;
    dP = N\c;
    P = P+dP;
    err = sqrt((c'*dP)/(dy'*W*dy));
end

%%Calculation of uncertainties

df = length(x)-length(P); %Degrees of freedom
dy = %y-f(x,P(1),P(2),...P(n))
J = %Df(x,P(1),P(2),...P(n))
N = J'*W*J;

if u==1 %Unweighted fit; W (and hence N) is scaled to match uncertainties
    chi2red = 1;
    chi2 = df;
    s_y = sqrt((dy'*dy)/df); %Estimates the uncertainty in y
    V = N\eye(size(N))*s_y^2; %Matrix of variances and covariances
else %Weighted fit; W (and hence N) is unscaled here
    chi2 = dy'*W*dy;
    chi2red = chi2/df;
    V = N\eye(size(N)); %Matrix of variances and covariances
end
sigma_P = sqrt(diag(V));

%%Output Structure Array

outStruct = struct();
outStruct.P = P; %Fit parameters
outStruct.sigma_P = sigma_P; %Uncertainties in fit parameters
outStruct.corr = V./sqrt(sigma_P*sigma_P'); %Correlation coefficients of
                                            %fit parameters
outStruct.V = V;

outStruct.fit_x = x;
outStruct.fit_y = %f(x,P(1),P(2),...P(n))
outStruct.chi2 = chi2;
outStruct.chi2red = chi2red;
if u==1
    outStruct.sigma_y = s_y; %Estimate of sigma_y for an unweighted fit
end