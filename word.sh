input=${sentence[@]}

echo "$input" | cut -d "(" -f 2 | cut -d ")" -f 1 | awk -F , '{for(i=1;i<=NF;i++){print$i}}END{printf "\n"NF}' > ${sentence[2]}.metadata


echo "$input" | cut -d "(" -f 2 | cut -d ")" -f 1 | awk -F , '{for(i=1;i<=NF;i++){print $i}}' | awk -F " " '{for(i=1;i<=NF;i+=2){printf $i","}}END{printf "\n"}' > ${sentence[2]}.csv

