input=${sentence[@]}

	all=`awk  -F " " '{print $1}' ${sentence[1]}.metadata`
	meta=($all)
	printf ${#meta[@]}
	in=`echo $input | awk -F "set" '{print $2}' | awk -F "where" '{print $1}' | awk -F "=" '{print $1}'`
	inp=($in)
	printf ${#inp[@]}
	printf ${inp[0]}
	for(( i=0 ; i<${#inp[@]} ; ++i ))
		do 
			for ((j=0 ; j<${#meta[@]};++j))
				do 
				if [[ ${inp[$i]} == ${meta[$j]}  ]]
				then
				#printf ${inp[$i]}
				m=$((1+$j))
				inp[$i]=$m
				break ;
				printf ${inp[$i]}	
				fi
		             done
		done

var2=${sentence[5]}
n=${inp[0]}
Nor=`awk  -v var3=${sentence[-1]} -F , '$1==var3 {print NR}'  ${sentence[1]}.csv`
NN=($Nor)
for (( i=0; i<${#NN[@]} ; ++i ))
do
NRm=${NN[$i]}

var3=`awk  -v var1="$m"  -v NRM="$NRm" -F , 'NR==NRM { print $var1 }' ${sentence[1]}.csv`
printf $var3
sed -i ''$NRm's/'$var3'/'$var2'/g' ${sentence[1]}.csv
done
