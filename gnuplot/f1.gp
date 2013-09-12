set macro
dx(nx)=1.0/nx
R(V,nx) = (3.0/(4.0*pi))**(0.33333)*V**(0.3333)*dx(nx)
st = '(0.001*$1):( R($6, nx)**2 )

set style data l
set key left
set term x11 1

set xlabel "t, time"
set ylabel "R^2" offset 2c
set xtics 0.001*0.5

set size 0.55
set key spacing 1.5
plot [:2*0.001][0:] \
     nx=20, "rg20.dat" u @st w l lw 3 t "n_x=20", \
     nx=40, "rg40.dat" u @st w l lw 3 t "n_x=40", \
     nx=80, "rg80.dat" u @st w l lw 3 t "n_x=80"
     
call "saver.gp" "f1"
