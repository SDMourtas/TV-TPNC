function f=objfun2(x,R,C,t)
f=(R(t,:)*x)/(x'*C{t}*x);