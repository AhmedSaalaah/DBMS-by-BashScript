#!/bin/bash
input=${sentence[@]}

echo "$input" | cut -d "(" -f 2 | cut -d ")" -f 1 | tr -s ' ' | awk -F " " '{for(i=1;i<=NF;i++){printf $i;if(i != NF && $i != " " && $i != ","){printf ","}}}END{printf "\n"}' >> ${sentence[2]}.csv 
