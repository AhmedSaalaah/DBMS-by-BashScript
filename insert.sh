read var
sentence=($var)
#echo ${sentence[0]} ${sentence[1]}
if [[ ${sentence[0]} = "insert" && ${sentence[1]} = "into" && ${sentence[3]} = "values" ]]
then
if [[ ${sentence[4]} = "(" && ${sentence[-1]} = ")" ]]
then
. ./insertcut.sh
else
printf "no"
fi
echo"ok its right sentence" 
else
printf "bad sentence"
fi

