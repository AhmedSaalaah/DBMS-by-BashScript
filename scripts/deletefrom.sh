
Nor=`awk  -v var3="${sentence[-1]}" -F , '$1==var3 {print NR}'  ${sentence[2]}.csv`
NN=($Nor)
if [[ ${#NN[@]} -gt "0" ]]
then
for ((i=0 ; i<${#NN[@]} ;i++))
do
m=${NN[$i]}

sed -i ''$m'd' ${sentence[2]}.csv
done

else 
printf "no data with this value\n"

fi

