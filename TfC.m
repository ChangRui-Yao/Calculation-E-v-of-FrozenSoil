function [Tf] =TfC(P) 
%% calibrate freezing temperature of wet clay under high pressure by interpolation
%% base on Cui GX 1997
%% W=20(%); P=3,5,8,10(kPa)
% WaterContant influence ratio
% Rw = (20-16.7)/(26.9-16.7);
% TfC=(P-0)/(12-0)*(-1.14+0.26);

%% 2D Interpolation: interp2()
%x - P ;y - W;
yy = [16.7,26.9]; xx = [0 4 8 12];
% [X,Y] = meshgrid(xx,yy);
Z = [-.26 -.49 -.83 -1.14;-.02 -.34 -.63 -1];
% surf(X,Y,Z); hold on;
% plot3(X,Y,Z+0.01,'ok',...
% 'MarkerFaceColor','r')

xx_i = 0:.1:12; yy_i = 16.7:.1:26.9;
[X_i,Y_i] = meshgrid(xx_i,yy_i);
Z_i = interp2(xx,yy,Z,X_i,Y_i);
% surf(X_i,Y_i,Z_i); hold on;
% plot3(X,Y,Z+0.01,'ok',...
% 'MarkerFaceColor','r')

Tf=Z_i(P,20); % W=20(%)
end
