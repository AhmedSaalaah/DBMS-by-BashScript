printf "enter the word "

read var 

awk -F " " '{for(i=1;i<=NF;i+=2){printf $i","}}'

