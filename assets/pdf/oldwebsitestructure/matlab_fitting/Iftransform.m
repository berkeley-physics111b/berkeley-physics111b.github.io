function [ momenta counts ] = iFKtransform( Z, E, y )
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here

gamma = Z/137.036;

S = sqrt(1-Z^2/137^2)-1;
%delta = Z*sqrt(1+E.^2)./(137*E);


momenta = sqrt(((E+1).^2)-1);

eta2 = momenta.^2;
epsilon2 = 1+eta2;
epsilon = sqrt(epsilon2);

F = (Z^2*(1+momenta.^2)/(137^2) + momenta.^2/4).^S;

Y = 2*pi*gamma*epsilon./momenta;
fnr = Y./abs(1 - exp(-Y));

f = F.*fnr.*eta2;

counts = (y.^2).*(((E+1).^2)-1).*f;

end
