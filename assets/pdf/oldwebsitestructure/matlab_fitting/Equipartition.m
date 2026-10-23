function [Kx,Ky] = equipartition(xsens,ysens,varargin) 

% Function outputs the stiffness of the trap in the x and y directions

% varagin in the form data1,pwr1,data2,pwr2,...

% Equipartition uses sensitivity values at each power level (which you input 
% in vectors 'xsens' and 'ysens' in the code) to find stiffnesses
% by relying on the variance of PSD data on a free floating bead in
% Brownian motion, assuming the position of the bead at each reading is
% independent of the position of the bead at previous readings.

% 'xsens' and 'ysens' are the sensitivities (Vx/um, Vy/um), needed to be
% input from previous sensitivity measurements. For each i, the 
% the values xsens(i) and ysens(i) must correspond to the power of the 
% ith set of data (that you input in varargin).

% One may acquire the stiffness vectors Kx and Ky into the workspace by  
% typing '[Kx Ky] = equipartition(xsens,ysens,data1,pwr1,data2,pwr2,...)'

boltz=1.3806503e-23;
temp=293;

% This next loop concatonates all the power levels into a vector.
% NOTE: The loops throughout this function check EVERY OTHER input in
% varargin, due to the convenience of the order of the input 
% (data1, pwr1, data2, pwr2, ...)
for i = 2:2:length(varargin)
    pwr(i/2)=cell2mat(varargin(i));
end
xsens=10^6*pwr*xsens; 
ysens=10^6*pwr*ysens; % Creates vectors for sensitivities at 
					  % the given powers, converted from V/um to V/m

for i = 1:2:length(varargin) % A loop that concatonates all the variances 
                             % of the 30 Hz data into vectors (x and y)
    A = cell2mat(varargin(i));
    xvariance((i+1)/2) = [var(A(1:235,4)./xsens((i+1)/2))];
    yvariance((i+1)/2) = [var(A(1:235,5)./ysens((i+1)/2))]; 
end

% Calculate Stiffness
Kx=boltz*temp./xvariance;
Ky=boltz*temp./yvariance;

% Convert to pN/um
Kx=Kx*10^6
Ky=Ky*10^6
% Fitting
px=polyfit(pwr,Kx,1)
fx=polyval(px,pwr);
py=polyfit(pwr,Ky,1)
fy=polyval(py,pwr);

% Plotting in pN/um 
figure(1)
plot(pwr,Kx,'o')
hold on
plot(pwr,fx)
plot(pwr,Ky,'ro')
plot(pwr,fy,'-r')
xlabel 'Power(mW)'
ylabel 'Stiffness (pN/um)'
legend ('X Data',['fit = ' num2str(px(1)) 'x + ' num2str(px(2))],'Y Data',['fit = ' num2str(py(1)) 'x + ' num2str(py(2))])
hold off
