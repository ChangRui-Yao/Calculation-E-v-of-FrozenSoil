%% Calculate Eis
% params Ei Es vi vs
Ei=CEi(-5); %E of ice at -10 degree (Gpa)
Es=50e-3; % GPa
vi=0.33;
vs=0.14;
% params fi fs pi pis
pi = 0.9; % density of ice(g/cm^3)
pis = 2.04 ;% density of frozen soil(g/cm^3)
Wi =CalIC(3,-10);  % Ice Contant
% fi fs the volumn contant ratio of ice\soil
fi=Wi*pis/pi;
fs=100-fi;
% 百分比化
fi=fi*0.01;
fs=fs*0.01;
% fi=0.01;fs=0.99;
% Calculation of Eis(GMa)
Eis = (fs*Es*(1-2*vi)+fi*Ei*(1-2*vs))*(fs*Es*(1+vi)+fi*Ei*(1+vs))/(fs*Es*(1-2*vi)*(1+vi)+fi*Ei*(1-2*vs)*(1+vs));
v= ( fs*Es*vs*(1-2*vi)*(1+vi) +fi*Ei*vi*(1-2*vs)*(1+vs) )/ ( fs*Es*(1-2*vi)*(1+vi)+ fi*Ei*(1-2*vs)*(1+vs) );
% a1=zeros(1,6);
% a1(1,1)=fs*Es*(1-2*vi);
% a1(1,2)=fi*Ei*(1-2*vs);
% a1(1,3)=fs*Es*(1+vi);
% a1(1,4)=fi*Ei*(1+vs);
% a1(1,5)=fs*Es*(1-2*vi)*(1+vi);
% a1(1,6)=fi*Ei*(1-2*vs)*(1+vs);
E2=(1-2*v)*(fs*Es/(1-2*vs) +(fi*Ei/(1-2*vi) )); % remove same item
E3=((fs*Es+fi*Ei)*vi)/(fs*Es+fi*Ei); % remove same item
%% calculate D damage factor
%  anchor -sf- strain corresponding to the maximum stress
% D damage factor
% n fitting param, the function of stress or T
s=0.1;
sf=0.1;
n=1;
D=1-exp(-(s/sf)^n/n);

%% 1-dimension contitutive relationship
EisC=Eis*(1-D)*s;