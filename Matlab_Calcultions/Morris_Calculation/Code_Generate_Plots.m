clear
load('Output_Morris_Metrics_Result.mat')

xEn=u_En(1,:); %mu* for annual energy of the 1st sample
yEn=sigma_En(1,:); %sigma for annual energy of the 1st sample

xP=u_Peak(1,:); %mu* for peak of the 1st sample
yP=sigma_Peak(1,:); %sigma for peak of the 1st sample

%Figure()

[x1P,xiP]=sort(xP,'descend');   %Rank of the Parameters with higher mean for Peak
[x1En,xiEn]=sort(xEn,'descend'); %Rank of the Parameters with higher mean for Annual Demand

figure %For Peak plot
scatter(xP,yP,20,'filled')
a=[1:16]'; b=num2str(a);c1=cellstr(b);
c=cell(16,1);
c{xiP(1),1}=strcat('P',c1{xiP(1),1});  %Label all the 7 main important from the ordered (concatenate WIth P)
c{xiP(2),1}=strcat('P',c1{xiP(2),1});
c{xiP(3),1}=strcat('P',c1{xiP(3),1});
c{xiP(4),1}=strcat('P',c1{xiP(4),1});
c{xiP(5),1}=strcat('P',c1{xiP(5),1});
c{xiP(6),1}=strcat('P',c1{xiP(6),1});
%c{xiP(7),1}=strcat('P',c1{xiP(7),1});

set(gca,'FontSize',14)
text(xP+1,yP,c,'Fontsize',14);

%Make the point labelling position different for 7th parameter
ce=strcat('P',c1{xiP(7),1});
text(xP(1,xiP(7))+1,yP(1,xiP(7))-3,ce,'Fontsize',14);

xlabel('\mu*','Fontsize',20)
ylabel('\sigma','Fontsize',20)
title('Peak')

cd Outputplots
saveas(gcf,'Peak_Morris.png')

figure %Energy
scatter(xEn,yEn,20,'filled')
a=[1:16]'; b=num2str(a);c1=cellstr(b);
c=cell(16,1);
c{xiEn(1),1}=strcat('P',c1{xiEn(1),1});  %Label all the 7 main important from the ordered
c{xiEn(2),1}=strcat('P',c1{xiEn(2),1});
c{xiEn(3),1}=strcat('P',c1{xiEn(3),1});
c{xiEn(4),1}=strcat('P',c1{xiEn(4),1});

%c{xiEn(6),1}=c1{xiEn(6),1};
%c{xiEn(7),1}=c1{xiEn(7),1};

set(gca,'FontSize',14)
text(xEn+3,yEn+5,c,'Fontsize',14);
%Make the point labelling position different for 5th parameter
ce=strcat('P',c1{xiEn(5),1});
text(xEn(1,xiEn(5))+3,yEn(1,xiEn(5))-8,ce,'Fontsize',14);

xlabel('\mu*','Fontsize',20)
ylabel('\sigma','Fontsize',20)
title('Annual')
saveas(gcf,'Annual_Morris.png')
clear

cd ..
load('Output_Morris_Metrics_Result.mat')

%Import Results Climate 1
xEn1=u_En(1,:); %mu* for annual energy of the 1st sample
yEn1=sigma_En(1,:); %sigma for annual energy of the 1st sample
xP1=u_Peak(1,:); %mu* for peak of the 1st sample
yP1=sigma_Peak(1,:); %sigma for peak of the 1st sample

%Import Results Climate 5
xEn5=u_En(5,:); %mu* for annual energy of the 1st sample
yEn5=sigma_En(5,:); %sigma for annual energy of the 1st sample
xP5=u_Peak(5,:); %mu* for peak of the 1st sample
yP5=sigma_Peak(5,:); %sigma for peak of the 1st sample

xEn1=[xEn1(xiEn(1,1:5))]
yEn1=[yEn1(xiEn(1,1:5))]
xP1=[xP1(xiP(1,1:5))]
yP1=[yP1(xiP(1,1:5))]

xEn5=[xEn5(xiEn(5,1:5))]
yEn5=[yEn5(xiEn(5,1:5))]
xP5=[xP5(xiP(5,1:5))]
yP5=[yP5(xiP(5,1:5))]


figure %

scatter(xP1,yP1,20,'filled') %Baseline Sensitivities
c=[xiP(1,2:3) xiP(1,5)]';c=num2str(c);c=cellstr(c); c=strcat('P',c);
text([xP1(2:3) xP1(5)]+2,[yP1(2:3) yP1(5)],c,'Fontsize',14);
c=xiP(1,1)';c=num2str(c);c=cellstr(c);c=strcat('P',c);
text(xP1(1)-10,yP1(1)+8,c,'Fontsize',14);
c=xiP(1,4)';c=num2str(c);c=cellstr(c);c=strcat('P',c);
text(xP1(4)+2,yP1(4)+3,c,'Fontsize',14);



hold('on')
scatter(xP5,yP5,30,'filled','d')   %Different Marker (Losangle)

c=[xiP(5,1:2) xiP(5,4)]';c=num2str(c);c=cellstr(c); c=strcat('P',c);
text([xP5(1:2) xP5(4)]+2,[yP5(1:2) yP5(4)],c,'Fontsize',14);

c=xiP(5,3)';c=num2str(c);c=cellstr(c); c=strcat('P',c)
text(xP5(3)+2,yP5(3)+3,c,'Fontsize',14);

c=xiP(5,5)';c=num2str(c);c=cellstr(c); c=strcat('P',c)
text(xP5(5)+2,yP5(5)-4,c,'Fontsize',14);

%text(xP5,yP5,c,'Fontsize',14);
% 
% RCP=[(xP5./xP1-1)*100]';
% RCP=round(RCP,1);
% RCP=num2str(RCP);RCP=cellstr(RCP)
% RCP{1,1}= strcat(RCP{1,1},' %')
% RCP{2,1}= strcat(RCP{2,1},' %')
% RCP{3,1}= []
% RCP{4,1}= strcat(RCP{4,1},' %')
% RCP{5,1}= []

%text(xP5,yP5-30,RCP,'Fontsize',10);

set(gca,'FontSize',14)
xlabel('\mu*','Fontsize',20)
ylabel('\sigma','Fontsize',20)
title('Peak')
legend({'Baseline (C5)','Scenario 2080 a1f1 90% (C1)'},'Location','southeast')

cd Outputplots
saveas(gcf,'Climate_Sen_Peak_Morris.png')

figure
scatter(xEn1,yEn1,20,'filled')
c=xiEn(1,1:5)';c=num2str(c);c=cellstr(c);
c=strcat('P',c)
%c{5,1}=[];
%c{3,1}=[];
text(xEn1(1:2)+7,yEn1(1:2),c(1:2),'Fontsize',14);
text(xEn1(3)-15,yEn1(3)+30,c(3),'Fontsize',14);
text(xEn1(4)-25,yEn1(4)+50,c(4),'Fontsize',14);
text(xEn1(5)-45,yEn1(5),c(5),'Fontsize',14);

hold('on')
scatter(xEn5,yEn5,30,'filled','d')   %Different Marker (Losangle)
c=xiEn(5,1:5)';c=num2str(c);c=cellstr(c);
c=strcat('P',c)
%text(xP5,yP5,c,'Fontsize',14);

RCE=[(xEn5./xEn1-1)*100]';
RCE=round(RCE,1);
% RCE=num2str(RCE);RCE=cellstr(RCE)
% RCE{1,1}= strcat(RCE{1,1},' %')
% RCE{2,1}= strcat(RCE{2,1},' %')
% RCE{3,1}= strcat(RCE{3,1},' %')
% RCE{4,1}= strcat(RCE{4,1},' %')
% RCE{5,1}= strcat(RCE{5,1},' %')
text(xEn5(1:3)+7,yEn5(1:3),c(1:3),'Fontsize',14);
text(xEn5(4:5)+10,yEn5(4:5),c(4:5),'Fontsize',14);

%text(xEn5(4:5)+25,yEn5(4:5),c(4:5),'Fontsize',14);
%text(xEn5+20,yEn5,RCE,'Fontsize',10);

set(gca,'FontSize',14)
xlabel('\mu*','Fontsize',20)
ylabel('\sigma','Fontsize',20)
title('Annual')
legend({'Baseline (C5)','Scenario 2080 a1f1 90% (C1)'},'Location','southeast')


saveas(gcf,'Climate_Sen_Annual_Morris.png')

cd ..
load('Output_Simulation_Result.mat')


figure %Baseline Annual vs Peak
scatter(Annual(:,1),Peak(:,1))
set(gca,'FontSize',14)
xlabel('Annual[kWh.m^-^2.yr^-^1]','Fontsize',12)
ylabel('Peak [W.m^-^2.yr^-^1]','Fontsize',12)
title('Annual vs Peak') %Standard year



cd Outputplots
saveas(gcf,'Peak_vs_Annual_Clim_1.png')




figure
hold on
scatter(Annual(:,1),Peak(:,1))
scatter(Annual(:,2),Peak(:,2))
scatter(Annual(:,3),Peak(:,3))
scatter(Annual(:,4),Peak(:,4))
scatter(Annual(:,5),Peak(:,5))

legend('Control','2080a1f10','2080a1f50','2080a1b90','2080a1f90')
xlim([0 700])
ylim([0 350])
xlabel('Annual[kWh.m^-^2.yr^-^1]','Fontsize',10)
ylabel('Peak [W.m^-^2.yr^-^1]','Fontsize',10)
title('All 5 Climate Samples')

saveas(gcf,'Peak_vs_Annual_AllCliData.png')

hold off

An_Mean=mean(Annual)
Peak_Mean=mean(Peak)

figure
hold on
scatter(An_Mean(1),Peak_Mean(1))
scatter(An_Mean(2),Peak_Mean(2))
scatter(An_Mean(3),Peak_Mean(3))
scatter(An_Mean(4),Peak_Mean(4))
scatter(An_Mean(5),Peak_Mean(5))
legend('Control','2080a1f10','2080a1f50','2080a1b90','2080a1f90')
xlim([0 700])
ylim([0 350])
xlabel('Annual[kWh.m^-^2.yr^-^1]','Fontsize',10)
ylabel('Peak [W.m^-^2.yr^-^1]','Fontsize',10)
title('Mean Values of Samples')

saveas(gcf,'Peak_vs_Annual_Averages.png')