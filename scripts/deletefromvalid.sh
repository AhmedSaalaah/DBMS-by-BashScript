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
else
printf "there is no column with name  ${sentence[-3]} \n"
fi



