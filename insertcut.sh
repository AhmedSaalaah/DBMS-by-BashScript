input=${sentence[@]}


echo "$input" | cut -d "(" -f 2 | cut -d ")" -f 1 | awk -F , '{for(i=1;i<=NF;i++){printf $i","}}END{printf "\n"}' >> ${sentence[2]}.csv 
