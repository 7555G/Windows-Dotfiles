f(x) = sin(x)
set terminal epslatex size 11cm,7cm color colortext
set output 'sinx.tex'
set xlabel '$x$'
set ylabel '$y$'
set format '$%g$'
set xtics ('$-2\pi$' -2*pi,'$-\pi$' -pi,0,'$\pi$' pi,'$2\pi$' 2*pi)
plot f(x) notitle with lines linestyle 1
