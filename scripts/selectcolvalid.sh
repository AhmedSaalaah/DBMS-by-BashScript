#!/bin/bash

input=${sentence[@]}

all=`awk -F " " '{if ($2 != ""){print $1}}' ${sentence[3]}.metadata`
Data=($all)

in=`echo "$input" | awk -F "select" '{print $2}' | awk -F "from" '{print $1}'`
inputData=($in)

flag="false"
if [[ "${sentence[-3]}" == "${Data[0]}"  ]] 
then
	for ((i=0; i<=${#Data[@]};i++))
	do

			if [[ "${inputData[0]}" == "${Data[i]}" ]]
			then
				flag="true"
			fi
		done
else
printf "there is no column with name  ${sentence[-3]} \n"
fi


if [[ $flag == "true" ]]
then
. ../../scripts/selectcol.sh 
else
        echo "no column with name ${inputData[0]} "
fi
