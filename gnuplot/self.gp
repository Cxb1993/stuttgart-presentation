# time step
set size 0.70
dt=system("awk '/^timestep/{print $2; exit}' log.lammps")+0.0
com(i)=sprintf("com.int.%i", i)
dx=1.0/20.0
r(i)=system(sprintf("awk 'NR==%i{print $2**(1.0/3.0)}' rg.dat", i))-0.5*dx
ttime(i)=sprintf("time = %.2fx10^{%.0f}", i*dt/10**int(log10(i*dt)-1), int(log10(i*dt)-1))
set key left
set xlabel "r/R"
set ylabel "Temperature"

plot [:1.7][0:] \
     n=4000, com(n) u ($1/r(n)):2 w lp t ttime(n), \
     n=8000, com(n) u ($1/r(n)):2 w lp t ttime(n), \
     n=11000, com(n) u ($1/r(n)):2 w lp t ttime(n)

call "saver.gp" "self"