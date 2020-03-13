
 
printf "enter first words\n"
read var
sentence=($var) 
#echo ${sentence[0]} ${sentence[1]}
if [[ ${sentence[0]} = "create" && ${sentence[1]} = "table"  ]]
then
if [[ ${sentence[2]} = "(" && ${sentence[-1]} = ")" ]]
then 
 cut -d "(" -f 1  ${sentence[@]} |echo
else 
printf "no"
fi
echo "table will be created" 
else 
printf "bad option"
fi 
