function Pen = penfun2(x,R,C,PR,xp,t,P)
% P * constraint function
f = P*sum((sum(x)-1~=0).*(sum(x)-1).^2+(x<0).*(x).^2+(x-1>0).*(x-1).^2);
% Objective function
Pen = objfun1(x,R,C,PR,xp,t)+f;  
end