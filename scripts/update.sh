input=${sentence[@]}

	all=`awk  -F " " '{print $1}' ${sentence[1]}.metadata`
	meta=($all)
	
	in=`echo $input | awk -F "set" '{print $2}' | awk -F "where" '{print $1}' | awk -F "=" '{print $1}'`
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
		
var3=${sentence[-1]}
var2=${sentence[5]}
n=${inp[0]}
Nor=`awk   -F , '{if ($1=="'$var3'") {print 'NR'}}'  ${sentence[1]}.csv`
NN=($Nor)
for (( i=0; i<${#NN[@]} ; ++i ))
do
NRm=${NN[$i]}
var3=`awk  -F , '{if(NR=='$NRm') { print $'$m' }}' ${sentence[1]}.csv`
sed -i ''$NRm's/'$var3'/'$var2'/g' ${sentence[1]}.csv
done
