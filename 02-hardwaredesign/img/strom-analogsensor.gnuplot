#! /usr/bin/gnuplot
set terminal pdfcairo enhanced color lw 2 size 6,4 font 'Arial'
set output 'strom-analogsensor.pdf'

set title "{/:Bold Mischstrom}\nFür ein analoges Sensorsignal, unipolar von 0 bis 5 Volt" font ",16"

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

set xtics 1

# Variante ohne Rauschen
plot [0:20] [0:5] ((x+3)**0.4) + (sin(0.5*x) / 4)

# Variante mit Rauschen
#plot [0:20] [0:5] ((x+3)**0.4) + (sin(0.5*x) / 4) + (sin(5*x) / 100) + (sin(20*x) / 200)

#-------------------------------------------------------------------------------
set terminal png transparent enhanced lw 12 size 1600,1200 font 'Arial'
set output 'strom-analogsensor-klein.png'

set title ""
set xlabel ""
set ylabel ""
set format x ""
set format y ""
replot
