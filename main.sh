#!/bin/bash

# First Selection That Selected the option From User
PS3="Team1-DataBase:-> "
while [ true ]
do
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
