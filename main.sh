#!/bin/bash

# First Selection That Selected the option From User
PS3="Team1-DataBase:-> "
current=$PWD
while [ true ]
do
`cd $current`
	select varSelection in "Create New DataBase" "Connect to DataBase" "Delete DataBase" "Exit"
	do
		case $varSelection in
			"Create New DataBase")
				. ./scripts/create.sh
				;;
			"Connect to DataBase")
				. ./scripts/connect.sh
				;;
			"Delete DataBase")
				. ./scripts/delete.sh
				;;
			"Exit")
				varSelection="Exit"
				break;;
		esac
	done
	if [ $varSelection = "Exit" ]
	then
		break;
	fi
done
