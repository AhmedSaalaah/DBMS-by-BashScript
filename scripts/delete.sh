#!/bin/bash

echo -n "Enter name of database:-> "
read name
if test -d ./database/$name
then
        rm -rf ./database/$name
	printf "\033[0;93m"        
        echo "Database is Deleted Successfull "
	printf "\033[0;29m"   
else
	printf "\033[0;93m"	
	echo "Database doesn't exist"
	printf "\033[0;29m"	
fi
`cd $current`
