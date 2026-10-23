function [smoothed] = MovingAve(data, N)
%this function will smooth a set of data by averaging a single data point
%with the surrounding N data points

%Note: As a result of how this function works, the first and last N data
%points will not be returned.
n = length(data);

for i = 1:n
    if i <= N || i > n-N
        %ignore first and last N data points
    else
        smoothed(i-(N)) = sum(data(i-N:i+N))/(2*N+1);%averages data
    end
end 
end 