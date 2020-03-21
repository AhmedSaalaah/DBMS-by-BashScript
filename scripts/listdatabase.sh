#!/bin/bash 

if [[ "$(ls -A ./database/)" ]]
	then 
		ls ./database/
	else
		printf "\033[0;93m";
		echo "There no database available" 
		printf "\033[0;29m";
		. ./main.sh
	fi

. ./main.sh
