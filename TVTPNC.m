% =========================================================% 
% The TV-TPNC problem setup and main procedure
%
% by V.N.Katsikis and S.D.Mourtas
% ======================================================== %
function [t,xsibas,xpso,xsma,xde]=TVTPNC(X,s,K,xp)

% R, C and PR construction
[R,C,PR]=dataprep(X,s);

[tot,n]=size(X); tot=tot-s; % remove delays
t=1:tot;

% SIBAS solutions
xsibas=zeros(n,tot);fisbas1=zeros(1,tot);fsibas2=zeros(1,tot);
tic
[xsibas(:,1),fisbas1(1)]=SIBAS(xp,R,C,PR,t(1),K,1e5,0.2,0.5,1e3);
fsibas2(1)=objfun2(xsibas(:,1),R,C,t(1));
for k=2:tot
    [xsibas(:,k),fisbas1(k)]=SIBAS(xsibas(:,k-1),R,C,PR,t(k),K,1e5,0.2,0.5,1e3);
    fsibas2(k)=objfun2(xsibas(:,k),R,C,t(k));
end
toc

% PSO solutions
xpso=zeros(n,tot);fpso1=zeros(1,tot);fpso2=zeros(1,tot);
x_minus=zeros(1,n);x_plus=ones(1,n);
tic
options2=optimoptions(@particleswarm,'display','off');
xpso(:,1)=particleswarm(@(x)Sphere(x,R,C,PR,xp,t(1),K),n,x_minus,x_plus,options2);
fpso1(1)=objfun1(xpso(:,1),R,C,PR,xp,t(1));
fpso2(1)=objfun2(xpso(:,1),R,C,t(1));
for k=2:tot
xpso(:,k)=particleswarm(@(x)Sphere(x,R,C,PR,xpso(:,k-1),t(k),K),n,x_minus,x_plus,options2);
fpso1(k)=objfun1(xpso(:,k),R,C,PR,xpso(:,k-1),t(k));
fpso2(k)=objfun2(xpso(:,k),R,C,t(k));
end
toc

% SMA solutions
xsma=zeros(n,tot);fsma1=zeros(1,tot);fsma2=zeros(1,tot);
tic
xsma(:,1)=SMA(30,1000,x_minus,x_plus,n,@(x)Sphere(x,R,C,PR,xp,t(1),K))';
fsma1(1)=objfun1(xsma(:,1),R,C,PR,xp,t(1));
fsma2(1)=objfun2(xsma(:,1),R,C,t(1));
for k=2:tot
xsma(:,k)=SMA(30,1000,x_minus,x_plus,n,@(x)Sphere(x,R,C,PR,xsma(:,k-1),t(k),K))';
fsma1(k)=objfun1(xsma(:,k),R,C,PR,xsma(:,k-1),t(k));
fsma2(k)=objfun2(xsma(:,k),R,C,t(k));
end
toc

% DE solutions
xde=zeros(n,tot);fde1=zeros(1,tot);fde2=zeros(1,tot);
tic
xde(:,1)=de(R,C,PR,xp,t(1),K,x_minus,x_plus)';
fde1(1)=objfun1(xde(:,1),R,C,PR,xp,t(1));
fde2(1)=objfun2(xde(:,1),R,C,t(1));
for k=2:tot
xde(:,k)=de(R,C,PR,xde(:,k-1),t(k),K,x_minus,x_plus)';
fde1(k)=objfun1(xde(:,k),R,C,PR,xde(:,k-1),t(k));
fde2(k)=objfun2(xde(:,k),R,C,t(k));
end
toc

% figures
sxsibas=zeros(1,tot);sxpso=zeros(1,tot);
sxsma=zeros(1,tot);sxde=zeros(1,tot);
sxsibas1=zeros(1,tot);sxpso1=zeros(1,tot);
sxsma1=zeros(1,tot);sxde1=zeros(1,tot);
for i=1:tot
    sxsibas(i)=sum(xsibas(:,i)~=0);
    sxpso(i)=sum(xpso(:,i)~=0);
    sxsma(i)=sum(xsma(:,i)~=0);
    sxde(i)=sum(xde(:,i)~=0);
    sxsibas1(i)=sum(xsibas(:,i));
    sxpso1(i)=sum(xpso(:,i));
    sxsma1(i)=sum(xsma(:,i));
    sxde1(i)=sum(xde(:,i));
end

figure
plot(t,fsibas2);hold on
plot(t,fpso2,':r')
plot(t,fsma2,'--g')
plot(t,fde2,'-.m')
ylabel('Sharpe Ratio')
xlabel('Time')
xticks([1 20 42 63 83])
xticklabels({'3/2','2/3','1/4','1/5','1/6'})
legend('SIBAS','PSO','SMA','DE')
hold off

figure
plot(t,abs(fisbas1+fsibas2));hold on
plot(t,abs(fpso1+fpso2),':r')
plot(t,abs(fsma1+fsma2),'--g')
plot(t,abs(fde1+fde2),'-.m')
ylabel('Transaction Costs')
xlabel('Time')
xticks([1 20 42 63 83])
xticklabels({'3/2','2/3','1/4','1/5','1/6'})
legend('SIBAS','PSO','SMA','DE')
hold off

figure
Y=[mean(fsibas2);mean(fpso2);mean(fsma2);mean(fde2)];
bar(Y);
text(1:length(Y),Y,num2str(Y),'vert','bottom','horiz','center'); 
box off
ylabel('Average SR of Time Period')
xlabel('Portfolio')
xticklabels({'SIBAS','PSO','SMA','DE'})
hold off

figure
Y=[mean(abs(fisbas1+fsibas2));mean(abs(fpso1+fpso2));...
    mean(abs(fsma1+fsma2));mean(abs(fde1+fde2))];
bar(Y);
text(1:length(Y),Y,num2str(Y),'vert','bottom','horiz','center'); 
box off
ylabel('Average TC of Time Period')
xlabel('Portfolio')
xticklabels({'SIBAS','PSO','SMA','DE'})
hold off

figure
plot(t,sxsibas);hold on
plot(t,sxpso,':r')
plot(t,sxsma,'--g')
plot(t,sxde,'-.m')
plot(t,K*ones(1,tot),':k')
ylabel('Total Assets Owned')
xlabel('Time')
xticks([1 20 42 63 83])
xticklabels({'3/2','2/3','1/4','1/5','1/6'})
legend('SIBAS','PSO','SMA','DE','K')
hold off

figure
plot(t,sxsibas1);hold on
plot(t,sxpso1,':r')
plot(t,sxsma1,'--g')
plot(t,sxde1,'-.m')
plot(t,ones(1,tot),':k')
ylabel('Sum of Portfolios Assets Weights')
xlabel('Time')
xticks([1 20 42 63 83])
xticklabels({'3/2','2/3','1/4','1/5','1/6'})
legend('SIBAS','PSO','SMA','DE','EC')
hold off