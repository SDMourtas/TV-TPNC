function [x_minus,x_plus,A,b]=problem(X)
n=size(X,2);
A=ones(1,n); % expected return
b=1; % target price
x_plus=ones(n,1);   % upper limit
x_minus=zeros(n,1); % lower limit