%
% Copyright (c) 2015, Yarpiz (www.yarpiz.com)
% All rights reserved. Please read the "license.txt" for license terms.
%
% Project Code: YPEA107
% Project Title: Implementation of Differential Evolution (DE) in MATLAB
% Publisher: Yarpiz (www.yarpiz.com)
% 
% Developer: S. Mostapha Kalami Heris (Member of Yarpiz Team)
% 
% Contact Info: sm.kalami@gmail.com, info@yarpiz.com
%

function z=Sphere(u,R,C,PR,xp,t,K)

    u=u'; P=1e5;
f = P*sum((sum(u)-1~=0).*(sum(u)-1).^2+(u<0).*(u).^2 ...
    +(u-1>0).*(u-1).^2)+P^2*(sum(u>0)~=K);
z = objfun1(u,R,C,PR,xp,t)+f;

end