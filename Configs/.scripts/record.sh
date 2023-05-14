#!/bin/sh

active=$(pactl list short sinks | cut -f2)

filename=$(date +%F_%T.mkv)

echo active sink: $active 
echo $filename

if [ -z $(pgrep wf-recorder) ];
	then notify-send "Recording Started ($active)"
	if [ "$1" == "-s" ]
		then wf-recorder -f $HOME/Videos/Recordings/$filename -a "$active" -g "$(slurp -c "#FFFFFF")" >/dev/null 2>&1 &
			sleep 2 
			while [ ! -z $(pgrep -x slurp) ]; do wait; done
			pkill -RTMIN+8 waybar
	else if [ "$1" == "-w" ] 
		then wf-recorder -f $HOME/Videos/Recordings/$filename -a "$active" -g "$(hyprctl clients -j | jq -r ".[] | select(.workspace.id == "$(hyprctl activewindow -j | jq -r '.workspace.id')\)""| jq -r ".at,.size" | jq -s "add" | jq '_nwise(4)' | jq -r '"\(.[0]),\(.[1]) \(.[2])x\(.[3])"'| slurp -c "#FFFFFF" )" >/dev/null 2>&1 &
			 sleep 2
			 while [ ! -z $(pgrep -x slurp) ]; do wait; done
			 pkill -RTMIN+8 waybar
	else
		wf-recorder -f $HOME/Videos/Recordings/$filename -a "$active" >/dev/null 2>&1 &
		pkill -RTMIN+8 waybar
	fi
	fi
else
	killall -s SIGINT wf-recorder
	notify-send "Recording Complete"
	while [ ! -z $(pgrep -x wf-recorder) ]; do wait; done
	pkill -RTMIN+8 waybar
	name="$(zenity --entry --text "enter a filename")"
	perl-rename "s/\.(mkv|mp4)$/ $name $&/" $(ls -d $HOME/Videos/Recordings/* -t | head -n1)
fi
