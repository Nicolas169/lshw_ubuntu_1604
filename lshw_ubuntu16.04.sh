#!/bin/bash

function cpuinfo_short(){

	clear
        sudo lshw -c processor >& temp
	clear
	echo "CPU:"
	echo
	cpu=`awk 'NR==3 {print $0}' temp | cut -f 9- -d " "`
	echo "    "$cpu
	echo
        read -p "Press ENTER to return to menu."
}

function raminfo_short(){

	clear
	sudo lshw -c memory -short >& temp
	ram=`awk 'NR==7' temp | cut -f 35- -d " "` #Total RAM
	clear
	echo -n "Total memory RAM on system:

	    $ram
	"
	echo
	echo "    RAM slots"
	ram=`awk 'NR==8' temp | cut -f 33- -d " "`
	echo -n "

	    $ram
	"
	ram=`awk 'NR==9' temp | cut -f 33- -d " "`
        echo -n "

            $ram
        "
	ram=`awk 'NR==10' temp | cut -f 33- -d " "`
        echo -n "

            $ram
        "
	ram=`awk 'NR==11' temp | cut -f 33- -d " "`
        echo -n "

            $ram
        "
	echo
	read -p "Press ENTER to return to menu."
}

function diskinfo_short(){

	clear
	sudo lshw -c disk -short >& temp
	clear
	disk=`awk 'NR==3' temp | cut -f 21- -d  " "`
	echo -n "Disks on system:

	    $disk
	"
	disk=`awk 'NR==4' temp | cut -f 21- -d  " "`
	echo -n "

	    $disk
	"
	disk=`awk 'NR==5' temp | cut -f 21- -d  " "`
        echo -n "

            $disk
        "
	disk=`awk 'NR==6' temp | cut -f 21- -d  " "`
        echo -n "

            $disk
        "
	echo
	read -p "Press ENTER to return to menu."
}

function principalMenu(){

	while [ "$op" != 0 ]
	do

		clear
		echo -n "Choose an option:

			1. CPU info
			2. RAM info
			3. Disk info

			0. EXIT
		"
		read op

		case $op in

			1)
			cpuinfo_short
			principalMenu
			break
			;;

			2)
			raminfo_short
			principalMenu
			break
			;;

			3)
			diskinfo_short
			principalMenu
			break
			;;

			0)
			echo "Exit in just a second..."
			sleep 3
			clear
			break
			;;

			*)
			echo "Worng option, choose again."
			sleep 3
			;;
		esac
	done
}
principalMenu
