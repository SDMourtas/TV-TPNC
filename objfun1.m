function f=objfun1(x,R,C,PR,xp,t)
f=-(R(t,:)*x)/(x'*C{t}*x)+sum((x>xp).*(1+4*(x-xp).*PR(t,:)')+(x<xp).*(1+2*(xp-x).*PR(t,:)'));