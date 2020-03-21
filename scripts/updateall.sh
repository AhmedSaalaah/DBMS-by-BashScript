
input=${sentence[@]}
new=${sentence[5]}

f=`awk -F "," 'NR==1{for(i=1;i<=NF;i++){if($i=="'${sentence[3]}'"&&i!=1){ print "true"}}}' ${sentence[1]}.csv`


flag=($f)
if [[ ${#flag[@]} -gt "0" ]]
then
ind=`awk -F ","  '{if(NR==1){for(i=1;i<=NF;i++){if($i=="'${sentence[3]}'"&&i!=1){set=i}}}else{print $set}}' ${sentence[1]}.csv`

val=($ind)
for ((j=0 ; j<${#val[@]} ; j++ ))
do
m=${val[$j]}
sed -i 's/'$m'/'$new'/g' ${sentence[1]}.csv
done
else 
echo "you cannot edit this column "${sentence[3]}" it's either unique or not existed"

fi

