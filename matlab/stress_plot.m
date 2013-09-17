%% Plot the elastic stress field
close all;
clear all;
np=512;
L=0.427;
nfile=1;
for nid=1:nfile
    X{nid}=(L/np)/2:L/np:L-(L/np)/2;
    Y{nid}=(L/np)/2:L/np:L-(L/np)/2;
    Sx{nid}=zeros(np,np);
    Sy{nid}=zeros(np,np);
    Sxy{nid}=zeros(np,np);
end
for nid=1:nfile
    A = importdata('stress_trace_08.dat');
j=0;
k=0;
%
for i=1:length(A)
    j=floor(A(i,1)/(L/np))+1;
    k=floor(A(i,2)/(L/np))+1;
    Sx{nid}(k,j)=A(i,3);
    Sy{nid}(k,j)=A(i,4);
end
end
pcolor(X{nid},Y{nid},Sx{nid}+Sy{nid}), shading interp,
caxis([0,7e-7]);
set(gca, 'XTick', []);
set(gca, 'YTick', []);
title('Polymer Stress tr(S) ');
colorbar;


