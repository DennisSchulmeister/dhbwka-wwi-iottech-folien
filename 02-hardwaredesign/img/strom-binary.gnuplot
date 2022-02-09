#! /usr/bin/gnuplot
set terminal pdfcairo enhanced color lw 2 size 6,4 font 'Arial'
set output 'strom-binary.pdf'

set title "{/:Bold Binärsignal}\n±0 V = False, ±3.3 V = True" font ",16"

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

set xtics 0.05
#set border behind

plot [0:0.6] [-0.1:3.4] "strom-binary.txt" with lines

#-------------------------------------------------------------------------------
set terminal png transparent enhanced lw 12 size 1600,1200 font 'Arial'
set output 'strom-binary-klein.png'

set title ""
set xlabel ""
set ylabel ""
set format x ""
set format y ""
replot
