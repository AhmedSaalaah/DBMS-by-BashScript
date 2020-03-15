#!/bin/bash

printf "Enter name of database \n"
read name
if test -d ./database/$name
then
        rm -rf ./database/$name
        printf "Database is Deleted Successfull \n"
        . ./main.sh
else
	printf "Database doesn't exist"
	. ./main.sh
fi

