% =========================================================% 
% SIBAS by V,N. Katsikis, S.D. Mourtas
%
% "Semi-Integer Beetle Antennae Search algorithm for Time-Varying 
% Tangency Portfolio Diversification", (submitted) 
%
% appropriately modified for the TVTP problem.
% ======================================================== %
function [xbest,fbest] = SIBAS(xp,R,C,PR,t,K,P,d,delta,tmax)

eta_delta=0.991;eta_d=0.991;k=length(xp);x0=xp;x1=x0;x1(x1>0)=1;

% BBAS: binary beetle antenna searching for global minimum 
% iteration
i=0;
while i<tmax
    c=round(rands(k,1));
    xr=x1+c; xr(xr>1)=1; xr(xr<0)=0;
    xl=x1-c; xl(xl>1)=1; xl(xl<0)=0;
    if penfun1(xr,R,C,PR,xp,t,K,P)<penfun1(xl,R,C,PR,xp,t,K,P)
        x=xr;
    else
        x=xl;
    end
    if penfun1(x,R,C,PR,xp,t,K,P)<penfun1(x1,R,C,PR,xp,t,K,P)
        x1=x; 
    end
    i=i+1;
end

% BAS: beetle antenna searching for global minimum 
% iteration
i=0;
while i<tmax
    c=rands(k,1);
    c=c/(eps+norm(c));
    xr=x0-d*c;
    xl=x0+d*c;
    x=abs(x0+delta*c*sign(penfun2(xr,R,C,PR,xp,t,P)-penfun2(xl,R,C,PR,xp,t,P))).*x1;
    if penfun2(x,R,C,PR,xp,t,P)<penfun2(x0,R,C,PR,xp,t,P)
        x0=x; 
    end
    delta=eta_delta*delta;
    d=eta_d*d+0.001;
    i=i+1;
end
xbest=x0;
fbest=objfun1(xbest,R,C,PR,xp,t);