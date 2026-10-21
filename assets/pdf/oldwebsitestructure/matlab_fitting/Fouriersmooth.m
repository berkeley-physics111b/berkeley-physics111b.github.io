function [ output ] = FourierSmooth( Input, Cutoff )
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here

yfft = fft(Input);
output(length(yfft)) = 0;
for i = 1:length(yfft)
    if(i > Cutoff & i < (length(yfft)-Cutoff))
        output(i) = 0;
    else
        output(i) = yfft(i);
    end
end
output = ifft(output);
