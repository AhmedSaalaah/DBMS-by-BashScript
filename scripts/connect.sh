#!/bin/bash

printf "Enter name of database\n"
read name
if test -d ./database/$name
then
cd ./database/$name
printf "now you are in database $name \n"
PS3="$name:-> " ;
. ../../scripts/table.sh
else

printf "databese doesn't exist \n"
. ./main.sh
fi
