clear
%N=12;%Trajectories
p=6;%Number of levels
r=35;%Trajectories

%NumFact=8; %(k) number of factors
%Envelope
%LE=[Thermal Absorvity;Solar Absortivity;Solar Glass Transmissitivy;CP Concrete;Glass conductivity;External Wall insulation;Roof insulation;External Absortance]
LBE=[0.5;0.3;0.15;200;0.005;0.01;0.01;0.5];
UBE=[0.96;0.96;0.38;4000;0.03;0.065;0.065;0.97];

%Operation
LBO=[10;0.0005;0.0001;18];
UBO=[80;0.005;0.001;26];

%Form
LBF=[0;0.05;0.4;0.08];
UBF=[180;0.75;9;25];

%Total
LBT=[LBE;LBO;LBF];
UBT=[UBE;UBO;UBF];

k=16; %Number of factors
[Outmatrix1, OutFact1] = Sampling_Function_2(p, k, r, UBT, LBT, []); %Output matrix
[Outmatrix2, OutFact2] = Sampling_Function_2(p, k, r, UBT, LBT, []); %Output matrix
[Outmatrix3, OutFact3] = Sampling_Function_2(p, k, r, UBT, LBT, []); %Output matrix
[Outmatrix4, OutFact4] = Sampling_Function_2(p, k, r, UBT, LBT, []); %Output matrix
[Outmatrix5, OutFact5] = Sampling_Function_2(p, k, r, UBT, LBT, []); %Output matrix

Outmatrix=[Outmatrix1;Outmatrix2;Outmatrix3;Outmatrix4;Outmatrix5];
OutFact=[OutFact1;OutFact2;OutFact3;OutFact4;OutFact5];

%Create a Matlab Matrix with Input info of the method
save('MorrisTest_Input_Parameter_Samples_Info.mat','OutFact','k','p','r')
%Create a csv with values
csvwrite('Joblist_.csv',Outmatrix)