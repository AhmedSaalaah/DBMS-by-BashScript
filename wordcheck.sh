re='[a-zA-Z0-9]'
printf "enter values"
read input
#input=$i

if [[ "$input" =~ ^[0-9]+$ ]]
then 
echo "int"
var="int"
elif [[ "$input" =~ $re ]]
then 
echo "text"
var="text"
else 

echo "error"
var="bad"

fi

awk -F " " 'if(NR==i){if($2!=var){v=0}}' ${sentence[2]}.metadata
if [[ $v=0 ]]
then 
echo "bad parameter entered"
break ;
else 
awk -F , 'for(){if(i==NF){sed }}' ${sentence[2]}.metadata

fi

