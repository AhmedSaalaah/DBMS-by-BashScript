
newval=${sentence[5]}

allin=`awk -F "," '{if(NR==1){for(i=1;i<=NF;i++){if($i=="'${sentence[-3]}'"){set=i}}}else{if($set=="'${sentence[-1]}'") print NR }}' ${sentence[1]}.csv`
val=($allin)


if [[ ${#val[@]} -gt "0" ]]
then 

for ((j=0; j<${#val[@]};j++))
do 
m=${val[$j]}
old=`awk -F "," '{if(NR==1){for(i=1;i<=NF;i++){if($i=="'${sentence[3]}'"){upd=i}}}else if(NR=='$m'){ print $upd }}' ${sentence[1]}.csv`
val2=($old)
oldval=${val2[0]}

sed -i ''$m's/'$oldval'/'$newval'/g' ${sentence[1]}.csv

done
else
printf "no elements exists with ${sentence[-3]} "

fi
