#!/bin/bash

input=${sentence[@]}

#	all=`awk  -F " " '{print $1}' ${sentence[3]}.metadata`
#	meta=($all)
	
#	in=`echo $input | awk -F "select" '{print $2}' | awk -F "from" '{print $1}'`
#	inp=($in)
#	k=$((${#meta[@]}-2))
#			for ((j=0 ; j<$k;++j))
#				do 
#				if [[ ${inp[0]} == ${meta[$j]}  ]]
#				then
#				m=$((1+$j))
#				inp[0]=$m
#				break ;
#				fi
#		             done
		
#var3=${sentence[-1]}
#var2=${sentence[5]}
#Nor=`awk    -F , '{if( $1 == "'$var3'"){print NR}}'  ${sentence[3]}.csv`
#NN=($Nor)
#for (( i=0; i<${#NN[@]} ; ++i ))
#do
#NRm=${NN[$i]}
#var3=`awk  -F , 'NR=='$NRm'  { print $'$m' '\t'     }' ${sentence[3]}.csv`
#printf $var3"\n"
#done
#pot = print only one time

if [[ ${sentence[1]} == "all" ]]
then
	awk -F "," 'BEGIN{pot=0;select=0}{if(pot==0){printf "\033[0;93m";for(i=1;i<=NF;i++){if($i!=","){printf "  ";printf $i;printf "\t";if($i=="'${sentence[5]}'"){select=i;}}};print "";pot++};printf "\033[0;29m";if($select=="'${sentence[7]}'"){for(i=1;i<=NF;i++){if($i!=","){printf "  ";printf $i;printf "\t"}};print "";}}' ${sentence[3]}.csv
elif [[ ${sentence[1]} != "all" ]]
then
	awk -F "," 'BEGIN{pot=0;select=0;check=0}{if(pot==0){printf "\033[0;93m";for(i=1;i<NF;i++){if($i!=","&&$i!=""&&$i=="'${sentence[1]}'"){select=i;printf "  ";printf $i;printf "\t"};if($i=="'${sentence[5]}'"){check=i;}};print "";pot++};printf "\033[0;29m";for(i=1;i<NF;i++){if($check=="'${sentence[7]}'"){printf "  ";print $select;}}}' ${sentence[3]}.csv
fi
