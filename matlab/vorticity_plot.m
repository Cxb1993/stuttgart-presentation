%% Plot Vorticity Field
close all;
clear all;
nfile=1;
X=cell(1, nfile);
Y=cell(1, nfile);
x=cell(1,nfile);
y=cell(1,nfile);
Ux=cell(1,nfile);
Uy=cell(1,nfile);
cav=cell(1,nfile);
np=512;
L=0.427;
for nid=1:nfile
    X{nid}=(L/np)/2:L/np:L-(L/np)/2;
    Y{nid}=(L/np)/2:L/np:L-(L/np)/2;
    x{nid}=zeros(np,np);
    y{nid}=zeros(np,np);
    Ux{nid}=zeros(np,np);
    Uy{nid}=zeros(np,np);  
    cav{nid}=zeros(np,np);
end
% Choose one of followed files to plot vorticity field
% vor_solvent.dat, vor_pol08.dat
% vor_pol1616-f3-eta1e-2.dat, vor_pol1616-f3-eta3e-3.dat 
% vor_pol1616-f1-eta3e-3-L.dat, vor_pol1616-f1-eta3e-3-R.dat
A = importdata('vor_solvent.dat');
j=0;
k=0;
for i=1:length(A)
    j=floor(A(i,1)/(L/np))+1;
    k=floor(A(i,2)/(L/np))+1;
    x{nid}(k,j)=A(i,1);
    y{nid}(k,j)=A(i,2);
    Ux{nid}(k,j)=A(i,3);
    Uy{nid}(k,j)=A(i,4);
end
for nid=1:nfile
cav{nid}=cav{nid}+curl(x{nid},y{nid},Ux{nid},Uy{nid});
end
pcolor(x{nid},y{nid},cav{nid}); shading interp;
 set(gca, 'XTick', []);
 set(gca, 'YTick', []);
colorbar;
hcb=colorbar;
set(hcb,'YTick',[-5:5:5]) 
caxis([-5,5]);