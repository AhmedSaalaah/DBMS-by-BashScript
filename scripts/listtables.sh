#!/bin/bash

list=`ls`
l=($list)
for ((i=0;i<${#l[@]};i++))
do
if [[ ${l[$i]} == *.csv ]]
then

name=$(printf ${l[$i]} | sed 's/\.[^.]*$//')
printf $name 
printf "\n"
fi
done
