while [ true ]
do 
printf "enter first words\n"
read var
sentence=($var) 
echo ${sentence[0]} ${sentence[1]}
if [[ ${sentence[0]} = "create" && ${sentence[1]} = "table" ]]
then
if [[ ${sentence[3]} = "(" && ${sentence[-1]} = ")" ]]
then
if [[ -f  ${sentence[2]}.csv ]]
then
printf "table already existing"
else
touch ${sentence[2]}.csv
touch ${sentence[2]}.metadata
. ./word.sh
fi
else 
printf "you write sentence wrong"
fi
echo "table will be created" 
elif [[ ${sentence[0]} = "insert" && ${sentence[1]} = "into" && ${sentence[3]} = "values" ]]
then
if [[ ${sentence[4]} = "(" && ${sentence[-1]} = ")" ]]
then
if [[ -f  ${sentence[2]}.csv ]]
then
. ./insertcut.sh
else
printf "no such tables"
fi
else
printf "you write sentence wrong"
fi
echo "ok its right sentence" 
elif [[ ${sentence[0]} = "select" && ${sentence[1]} = "from" ]]
then
if [[ -f  ${sentence[2]}.csv ]]
then
. ./select.sh
else
printf "no such tables"
fi
echo "ok its right sentence" 

elif [[ ${sentence[0]} = "drop" && ${sentence[1]} = "table" ]]
then
if [[ -f  ${sentence[2]}.csv ]]
then
rm ${sentence[2]}.csv
rm ${sentence[2]}.metadata
else
printf "no such tables"
fi
echo "ok its right sentence" 
else
printf "bad sentence"
fi
done 
