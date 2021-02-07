#!/bin/bash


declare -a options=("bashtop
glances
gtop
htop
iftop
iotop
iptraf-ng
nmon
s-tui
quit")

choice=$(echo -e "${options[@]}" | dmenu -l -i -p 'System monitors: ')

case $choice in
	quit)
		echo "Program terminated." && exit 1
	;;
	bashtop| \
	glances| \
	gtop| \
	htop| \
	nmon| \
	s-tui)
        exec st -e $choice
	;;
	iftop| \
	iotop| \
	iptraf-ng)
        exec st -e gksu $choice
	;;
	*)
		exit 1
	;;
esac

