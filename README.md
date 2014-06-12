krautcounter
============

Log the last few hours of the funding campaign of Krautreporter

Dependencies:
* Gnuplot
* Wget

Get data and generate plot:

    while true; do ./krautcounter.sh >> krautcounter.data; gnuplot krautcounter.plot; sleep 60; done
    
See http://wasmitnetzen.de/#krautcounter
