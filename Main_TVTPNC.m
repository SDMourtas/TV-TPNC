%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%  SIBAS source codes for the TV-TPNC problem (version 1.0)         %
%                                                                   %
%  Developed in MATLAB R2018b                                       %
%                                                                   %
%  Author and programmer: V.N.Katsikis, S.D.Mourtas                 %
%                                                                   %
%   e-Mail: vaskatsikis@econ.uoa.gr                                 %
%           spirosmourtas@gmail.com                                 %
%                                                                   %
%   Main paper: V.N.Katsikis, S.D.Mourtas,                          %
%               "Diversification of Time-Varying Tangency Portfolio %
%               under Nonlinear Constraints through Semi-Integer    %
%               Beetle Antennae Search Algorithm", AppliedMath,     %
%               1(1), 63-73 (2021)                                  %              
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

clear 
close all
clc

% K: cardinality number

x=1;  % Examples number: 1 to 2
[n,K,s,X,xp]=example(x); 

[t,xsibas,xpso,xsma,xde]=TVTPNC(X,s,K,xp);
