function Pen = penfun1(x,R,C,PR,xp,t,K,P)
% P * constraint function
f = P^2*(sum(x>0)~=K);
% Objective function
Pen = objfun1(x,R,C,PR,xp,t)+f;  
end