function [Surf2D_H0] =Surf2D_H0(y0)
% y0=1; y0=[0:4.5];
x0=y0/sqrt(3);
n=ceil(61.8/(4*x0));
%
x=0:0.1:x0;
x=x';
% x2 add the x0;y2 add the corresponding value
x2=[x;x0];
y=sqrt(3)*x;
y2=[y;x0*sqrt(3)];
y=[y2;flipud(y)];
y=[y;-(y)];
Y=repmat(y,n,1);

x=[x2;x];
x=[x;-x];
X=repmat(x,n,1);

%
X=X.*(1e-3);
Y=Y.*(1e-3);
M=zeros(size(X,1),1);
N=M+0.04;
%
fid=fopen('F:\Program Files\MATLAB\MatDEM1.911\slope\2DLayerSurfH0=1.txt','w');
for k=1:size(X,1)
    % layer1
    fprintf(fid,'%g\t',X(k));
    fprintf(fid,'%g\t',M(k));
    fprintf(fid,'%g\t',M(k));
    % layer2
    fprintf(fid,'%g\t',X(k));
    fprintf(fid,'%g\t',M(k));
    fprintf(fid,'%g\t',Y(k));
    % layer3
    fprintf(fid,'%g\t',X(k));
    fprintf(fid,'%g\t',M(k));
    fprintf(fid,'%g\n',N(k));
end
fclose(fid);
Surf2D_H0=load('F:\Program Files\MATLAB\MatDEM1.911\slope\2DLayerSurfH0=1.txt');