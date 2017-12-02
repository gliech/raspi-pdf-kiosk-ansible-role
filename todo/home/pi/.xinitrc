#!/bin/bash

while not ping -c1 studierendenwerk-aachen.de; do
    sleep 2
done

wget -O ~/wochenplan.pdf 'http://www.studierendenwerk-aachen.de/files/content/Downloads/Gastronomie/Speiseplaene/speiseplan_mensa_vita_diese_woche.pdf'

xset -dpms
xset s off
xset s noblank
matchbox-window-manager &
unclutter -idle 0 &
xpdf -fullscreen ~/wochenplan.pdf
