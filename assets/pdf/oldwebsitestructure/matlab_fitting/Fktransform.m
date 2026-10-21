function [ E y ] = FKtransform( Z, momenta, counts )
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here

gamma = Z/137.036;
S = sqrt(1-gamma^2)-1;

%%delta = Z*sqrt(1+momenta.^2)./(137*momenta);

eta2 = momenta.^2;
epsilon2 = 1+eta2;
epsilon = sqrt(epsilon2);

%F = (Z^2*(1+momenta.^2)/(137^2) + momenta.^2/4).^S;
F = ((gamma^2)*epsilon2 + eta2/4).^S;

E = sqrt(momenta.^2 + 1)-1;

Y = 2*pi*gamma*epsilon./momenta;
fnr = Y./abs(1 - exp(-Y));

f = F.*fnr.*eta2;

y = sqrt(counts./((momenta.^2).*f));

end
