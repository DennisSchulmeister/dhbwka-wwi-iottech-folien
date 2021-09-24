#! /usr/bin/gnuplot
set terminal pdfcairo enhanced color lw 2 size 6,4 font 'Arial'
set output 'strom-gleichstrom.pdf'

set title "{/:Bold Gleichstrom}\n5 V, 3 A für Raspberry Pi 4" font ",16"

set format x "%g"
set format y "%g"
set decimalsign ","
set xtics font ",8"
set ytics font ",8"
set samples 1000

set grid
unset key
set xlabel "Zeit in Sekunden"
set ylabel "Spannung in Volt"

set xtics 1
plot [0:10] [0:7] 5

#-------------------------------------------------------------------------------
set terminal png transparent enhanced lw 12 size 1600,1200 font 'Arial'
set output 'strom-gleichstrom-klein.png'

set title ""
set xlabel ""
set ylabel ""
set format x ""
set format y ""
replot
