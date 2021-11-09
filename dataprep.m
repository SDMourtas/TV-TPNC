function [R,C,PR]=dataprep(X,s)
% function for the construction of the market, expected return and covariance

[tot1,tot2]=size(X);
R=zeros(tot1-s,tot2);
PR=zeros(tot1-s,tot2);
C{tot1-s,1}={};
for i=1:tot1-s
    r=X(i:s+i-1,:);
    rr=r./max(r);
    C{i,1}=cov(rr);
    R(i,:)=mean(rr)-(var(rr)<1e-3).*mean(rr);
    PR(i,:)=rr(end,:);
end
