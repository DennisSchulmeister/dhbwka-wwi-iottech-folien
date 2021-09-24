#! /usr/bin/gnuplot
set terminal pdfcairo enhanced color lw 2 size 2,2 font 'Arial'
set output 'kennlinie-widerstand.pdf'

set format x "%.2f"
set format y "%.2f"
set decimalsign ","
set xtics font ",8"
set ytics font ",8"
set samples 1000

set grid
unset key
#set xlabel "Spannung in Volt"
#set ylabel "Stromstärke in Ampere"

set xtics 0.5
set xrange [-1.5:1.5]
set yrange [-1.5:1.5]

set arrow from -1.5,0    to 1.5,0   nohead lc rgb '#777777' lw 0.25
set arrow from    0,-1.5 to   0,1.5 nohead lc rgb '#777777' lw 0.25

plot 1.2*x

#-------------------------------------------------------------------------------
set terminal png transparent enhanced lw 12 size 1600,1200 font 'Arial'
set output 'kennlinie-widerstand-klein.png'

set title ""
set xlabel ""
set ylabel ""
set format x ""
set format y ""
replot
