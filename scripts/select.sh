#!/bin/bash
cat ${sentence[3]}.csv | awk -F "," 'BEGIN{z=0}{if(z==0){printf "\033[0;93m";z++}else{printf "\033[0;29m"};printf "  ";for(i=1;i<=NF;i++){printf $i;printf "\t "};print ""}'
printf "\033[0;29m"
