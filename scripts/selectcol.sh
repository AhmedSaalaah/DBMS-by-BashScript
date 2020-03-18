input=${sentence[@]}

	all=`awk  -F " " '{print $1}' ${sentence[3]}.metadata`
	meta=($all)
	
	in=`echo $input | awk -F "select" '{print $2}' | awk -F "from" '{print $1}'`
	inp=($in)
	
			for ((j=0 ; j<${#meta[@]};++j))
				do 
				if [[ ${inp[$i]} == ${meta[$j]}  ]]
				then
				m=$((1+$j))
				inp[0]=$m
				break ;
				fi
		             done
		

var2=${sentence[5]}
n=${inp[0]}
Nor=`awk  -v var3=${sentence[-1]} -F , '$1==var3 {print NR}'  ${sentence[3]}.csv`
NN=($Nor)
for (( i=0; i<${#NN[@]} ; ++i ))
do
NRm=${NN[$i]}
var3=`awk  -v var1="$m"  -v NRM="$NRm" -F , 'NR==NRM  { print $var1 '\t'     }' ${sentence[3]}.csv`
printf $var3"\n"
done
