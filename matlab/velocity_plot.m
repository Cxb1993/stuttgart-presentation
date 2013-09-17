%% Plot the velocity of one fixed point.
close all;
load velocity_fixedPoint.mat
L=0.427;
V0=0.66;
T=10000*2.08333325e-05;
T0=2*pi*(L/4)/V0;
f=1/T0;
T=T*f;
% Set the start time, 
%if Nstart=1, the plot begins from intial state.
Nstart=1;

figure;
N=length(vfix_solvent);
x=(Nstart:N).*T;
plot(x,vfix_solvent(Nstart:end,1)/V0,'*r--',x,vfix_solvent(Nstart:end,2)/V0,'ob--');
legend('Ux','Uy');
title('Solvent,Position [5/8L,5/8L]');
xlabel('t');grid on;

figure;
N=length(vfix_p1616_f1);
x=(Nstart:N).*T;
plot(x,vfix_p1616_f1(Nstart:end,1)/V0,'*r--',x,vfix_p1616_f1(Nstart:end,2)/V0,'ob--');
legend('Ux','Uy');
title('Wi~5,Position [5/8L,5/8L]');
xlabel('t');grid on;

figure;
N=length(vfix_1616_f3);
x=(Nstart:N).*T;
plot(x,vfix_1616_f3(Nstart:end,1)/V0,'*r--',x,vfix_1616_f3(Nstart:end,2)/V0,'ob--');
legend('Ux','Uy');
title('Wi~10,Position [5/8L,5/8L]');
xlabel('t');grid on;