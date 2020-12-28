function [Wi] =CalIC(P,T) 
    %% Calculate Ice contant
    %% for dealing with data from Liang Z
    %% just can do 1-D scalar calculation
    % params: P:Pressure(MKp); T:Temperature(°C）
    %     P = 8; T = -12;
    % params: a, b:fitting params for emperical eqation
    a = -3.35; b = 0.37;
    % Tr,Wr
    % Tr = -20; Wr = 

    r = 6.18/2*1e-2; h=3*1e-2;
    S0=2*pi*r*h+pi*r^2; % m^2
    m = 183.6; % g
    S = S0/m;
    Wnf=0.042*S+3; % emperical eqation of unfrozen water contant
    Tr = -20; Wr = Wnf;
    % Tf,Wf: Temperature and water content of soil sample when freezing
    % Tf = x; Wf = 20
    Tf = TfC(P); Wf = 20;

    %
    if T<=Tr
        Wl =Wr;
    elseif T>=Tf
        Wl =Wf;
    else
        Wl = Wr+(Wf-Wr)*exp(a*((Tf-T)/(T-Tr))^b);
    end

    %
    Wi = Wf - Wl;
end