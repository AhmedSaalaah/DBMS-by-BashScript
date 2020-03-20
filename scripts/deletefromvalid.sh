#!/bin/bash

input=${sentence[@]}

all=`awk -F " " '{if ($2 != ""){print $1}}' ${sentence[2]}.metadata`
Data=($all)

in=`echo "$input" | awk -F "where" '{print $2}' | awk -F "=" '{print $1}'`
inputData=($in)

flag="false"

if [[ "${sentence[-3]}" == "${Data[0]}"  ]] 
then
	. ../../scripts/deletefrom.sh 	
	
elif [[ ${sentence[3]} != "where" ]]
then
	sed -i '2,$d' ${sentence[2]}.csv
	printf "\033[0;93m"
	echo "All Data is Deleted"
	printf "\033[0;29m"
else
	printf "\033[0;93m"
	printf "There is no Column with name "
	printf "\033[0;31m"
	echo "${sentence[-3]}"
	printf "\033[0;29m"
fi
