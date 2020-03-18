#!/bin/bash
input=${sentence[@]}

	all=`awk  -F " " '{print $1}' ${sentence[3]}.metadata`
	meta=($all)

	in=`echo $input | awk -F "select" '{print $2}' | awk -F "from" '{print $1}'`
	inp=($in)

	for ((j=0 ; j<${#meta[@]};++j))
				do 
				if [[ ${inp[0]} == ${meta[$j]}  ]]
				then
				m=$((1+$j))
				inp[0]=$m
				break ;
				fi
		             done
if [[ $m != '' ]]
then 

awk -F , '{print $'$m' "\n" }' ${sentence[3]}.csv

else
printf "this column ${sentence[1]} doesnot exist "

fi
