#!/bin/bash

# First Selection That Selected the option From User
PS3="Team1-DataBase:-> "
current=$PWD

if [ -d ./database ]
then
	echo -n ""
else
	mkdir ./database
fi	

while [ true ]
do
`cd $current`
select varSelection in "Create New DataBase" "Connect to DataBase" "Delete DataBase" "List All Databases" "Exit"
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
			"List All Databases")
			. ./scripts/listdatabase.sh
				;;
			"Exit")
				exit
				;;
		esac
	done
done
