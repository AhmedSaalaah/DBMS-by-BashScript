#!/bin/bash

input=${sentence[@]}

all=`awk -F " " '{if ($2 != ""){print $1}}' ${sentence[3]}.metadata`
Data=($all)

in=`echo "$input" | awk -F "select" '{print $2}' | awk -F "from" '{print $1}'`

inputData=($in)

flag="false"
flagCheck=0
colError=""

if [[ ${sentence[1]} != "all" ]] 
then
	for ((i=0; i<${#Data[@]};i++))
	do

			if [[ "${inputData[0]}" == "${Data[i]}" ]]
			then
				flag="true"
				flagCheck=$flagCheck+1
			else
				colError="${inputData[0]}"
			fi
			if [[ "${sentence[5]}" == "${Data[i]}" ]]
			then
				flag="true"
				flagCheck=$flagCheck+1
			else
				colError="${sentence[5]}"
			fi
		done
elif [ ${sentence[1]} == "all" ]
then
	flag="true"
	flagCheck=2
fi


if [[ $flag == "true" && $flagCheck -eq 2 ]]
then
. ../../scripts/selectcol.sh 
else
	printf "\033[0;93m";
        echo -n "There is no column with name "
	printf "\033[0;31m";
	echo "$colError "
	printf "\033[0;29m";
fi
