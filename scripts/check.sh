#!/bin/bash

input=${sentence[@]}

all=`awk -F " " '{if ($2 != ""){print $2}}' ./${sentence[2]}.metadata`
metaData=($all)

in=`echo "$input" | cut -d "(" -f 2 | cut -d ")" -f 1 | tr -s ' ' | awk -F " " '{for (i=1;i<=NF;i++){printf $i}}' | tr ',' ' ' `
inputData=($in)

flag="true"

if [ ${#metaData[@]} -eq ${#inputData[@]} ]
then
	for ((i=0; i<=${#metaData[@]};i++))
	do
		if [[ ${metaData[$i]} == "text" && $flag == "true" ]]
		then

			if [[ "${inputData[$i]}" =~ ^[a-zA-Z0-9]+$ && "${inputData[$i]}" != '' ]]
			then
				echo -n
			else
				flag="false"
			fi
		elif [[ ${metaData[$i]} == "int"  && $flag == "true" && "${inputData[$i]}" != '' ]]
		then
			if [[ "${inputData[$i]}" =~ ^[0-9]+$ ]]
			then
				echo -n
			else
				flag="false"
			fi
		fi
	done
else
	flag="false"
fi

pkCheck=`awk -F "," 'BEGIN{pot=0}{if(pot==0){pot++;}else{if($1=="'${inputData[0]}'"){print "falsePK"}}}' ./${sentence[2]}.csv`

if [[ $flag == "true" && $pkCheck != "falsePK" ]]
then
	. ../../scripts/insertcut.sh
	echo "Data is Inserted"
elif [[ $flag == "false" ]]
then
        echo "Not the same number of coloumns"
fi

if [[ $pkCheck == "falsePK" ]]
then
	echo "Data in Column ${inputData[0]} must be Unique"
fi
