function [n,K,s,X,xp]=example(x)
% K: cardinality number, X: market space
% s: number of delays for average and cov matrix
if  x==1                  % Example 1
    n=40; K=20;
    s=40;
    X=xlsread('data');    % stocks close prices (included delays)
elseif x==2               % Example 2
    n=80; K=40;
    s=40;
    X=xlsread('data');    % stocks close prices (included delays)
end
X=X(:,1:n);
xp=ones(n,1)/n;