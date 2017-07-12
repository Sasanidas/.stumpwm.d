#!/usr/bin/bash
# /usr/bin/compton -b  --config ~/.config/compton/compton.conf --xrender-sync --xrender-sync-fence --vsync none
pushd ~/.stumpwm.d/ > /dev/null
/usr/bin/compton -b  --config ./compton.conf --xrender-sync --xrender-sync-fence --vsync none
/usr/bin/xrdb -merge ./.Xresources
/usr/bin/urxvtd --quiet --opendisplay --fork
# /usr/bin/bash ~/.config/lemonbar/config.sh | lemonbar -dp -f "FiraMono" -f 'WifiStatus2' & disown
/usr/bin/bash ./lemonbar.sh | lemonbar -dp -f "FiraMono" -f 'WifiStatus2' & disown
# This is a hack that assumes the first window is stumpwm's messages. Be careful!
# MESSAGE_WINDOW=$(xwininfo -root -children | grep -m 3 "(has no name)" | tail -n 1 | sed "s/(has no name).\+//" | sed "s/\s\+//")
# compton-trans -w $MESSAGE_WINDOW -o 90
~/.stumpwm.d/day-night-toggle.sh "INIT" & disown
