#! /usr/bin/gnuplot
set terminal pdfcairo enhanced color lw 2 size 6,4 font 'Arial'
set output 'strom-wechselstrom.pdf'

set title "{/:Bold Wechselstrom}\n230 V, 50 Hz" font ",16"

set format x "%.2f"
set format y "%g"
set decimalsign ","
set xtics font ",8"
set ytics font ",8"
set samples 1000

set grid
unset key
set xlabel "Zeit in Sekunden"
set ylabel "Spannung in Volt"

set xtics 0.01
set ytics 115
plot [0:0.1] [-230:230] sin(x*2*pi*50)*230, 0

#-------------------------------------------------------------------------------
set terminal png transparent enhanced lw 12 size 1600,1200 font 'Arial'
set output 'strom-wechselstrom-klein.png'

set title ""
set xlabel ""
set ylabel ""
set format x ""
set format y ""
replot
