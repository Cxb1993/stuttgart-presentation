set fit errorvariables
dx=1.0/30.0
R(V) = (3.0/(4.0*pi))**(0.33333)*V**(0.3333)*dx - dx

A = 1
m = 1
f(x) = A*x**m
fit f(x) "vgy.3d.dat" u ($1/1e5):(R($2)) via m, A

set size 0.55
set key spacing 1.5
set xlabel "g, gravity"
set ylabel "R, departure radius" offset 2c
plot "vgy.3d.dat" u ($1/1e5):(R($2)) w p pt 7 ps 1 t "SPH", \
     f(x) w l lw 2 t sprintf("C/g^{%.2f +/- %.3f}", m, m_err)
     
call "saver.gp" "dep"
