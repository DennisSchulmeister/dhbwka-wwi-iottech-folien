#! /usr/bin/gnuplot
set terminal pdfcairo enhanced color lw 2 size 6,4 font 'Arial'
set output 'strom-serial.pdf'

set multiplot layout 2,1 title "{/:Bold Serielle Daten}\nMit separatem Clock-Signal" font ",16"

set format y "%g"
set decimalsign ","
set xtics font ",8"
set ytics font ",8"
set samples 1000

set xtics 1
set ytics 3.3
set grid
unset key

#---Serielle Daten---
set ylabel "Datensignal"
unset xlabel
set format x ""
set tmargin 3
set bmargin 0

plot [1:9] [-0.3:3.6] "strom-serial-data.txt" with lines
#---Serielle Daten---

#---Clock-Signal---
unset title
set ylabel "Clock-Signal"
set xlabel "Bit"
set format x "%g"
set tmargin 0
set bmargin 3

plot [1:9] [-0.3:3.6] "strom-serial-clock.txt" with lines
#---Clock-Signal---

unset multiplot


#-------------------------------------------------------------------------------
set terminal png transparent enhanced lw 12 size 1600,1200 font 'Arial'
set output 'strom-serial-klein.png'

set title ""
set xlabel ""
set ylabel ""
set format x ""
set format y ""

set multiplot layout 2,1
set bmargin 0
plot [1:9] [-0.3:3.6] "strom-serial-data.txt" with lines
unset bmargin
set tmargin 0
plot [1:9] [-0.3:3.6] "strom-serial-clock.txt" with lines
unset multiplot

