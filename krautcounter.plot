set term png truecolor size 820,400 font "Helvetica, 13pt" 
set title "Spendenanzahl Krautreporter, Stand: ". system("date +'%a, %H:%M:%S Uhr'") 
set grid xtics
set grid ytics
set output "krautcounter.png"

# set ad day-month
set xdata time
# parse timestamp
set timefmt "%s"
set format x "%d.%m, %H:%M"
# tic with 1 day
#set xtic '+str(60*60*24*1))
set xtic 60*60*6
#set xtic 1
set xlabel "Zeitpunkt (CEST)"
set autoscale x

# Freitag Abend
set xrange ["1402584745":"1402704000"]
# Donnerstag Abend
#set xrange ["1402584745":"1402617600"]

set ytic 1000
set ylabel "Anzahl"
set yrange [10000:15000]

set key left top inside horizontal

set style fill solid 1.0
set style data boxes

plot "krautcounter.data" using ($1+7200):2 title "Spenden"


set key center bottom outside horizontal

set output "krautcounter2.png"
set ytic 500
set xtic 60*60*3
set term png truecolor size 1600,800 font "Helvetica, 13pt" 
plot "krautcounter.data" using ($1+7200):2 title "Spenden"#, y(x) title "Vorhersage" axes x1y2

set output "krautcounter3.png"

set y2tic 1000
set y2range [-4.218215e+07:-4.217715e07]
set format y2 ""
set grid noy2tics

y(x) = 112*((x+1402584745)/(60*60))-100000000
#fit y(x) 'krautcounter2.data' using ($1+7200):2 via m
plot "krautcounter.data" using ($1+7200):2 title "Spenden", y(x) title "Vorhersage" axes x1y2
