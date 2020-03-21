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
		else
			m=0
		fi
	done

if [[ $m != 0 ]]
then 

	awk -F , 'BEGIN{z=0}{if(z==0){printf "\033[0;93m";z++}else{printf "\033[0;29m"};printf "  " ;print $'$m'}' ${sentence[3]}.csv

else
	printf "\033[0;93m";
	printf "Column "
	printf "\033[0;31m";	
	printf "${sentence[1]}"
	printf "\033[0;93m";
	echo " doesn't exist "
	printf "\033[0;29m";
fi
