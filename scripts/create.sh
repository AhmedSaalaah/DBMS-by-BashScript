#!/bin/bash

printf "Enter name of database \n"
read name
if test -d ./database/$name
then
	printf "Database is already existed \n"
	. ./main.sh
else
	mkdir ./database/$name
	cd ./database/$name
	PS3="$name:-> "
	printf "Now you are in database $name \n"
	. ../../scripts/table.sh	
fi
