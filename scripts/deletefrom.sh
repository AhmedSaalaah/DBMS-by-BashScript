#!/bin/bash

var3="${sentence[-1]}"

Nor=`awk   -F , '{if($1=="'$var3'") {print NR}}'  ${sentence[2]}.csv`
NN=($Nor)
	if [[ ${#NN[@]} -gt '0' ]]
		then
			for (( i=0; i<${#NN[@]} ; i++ ))
				do
					m=${NN[$i]}
					sed -i ''$m'd' ${sentence[2]}.csv

				done

		else
			printf "\033[0;93m"
			echo "There is no data to be deleted"
			printf "\033[0;29m"
	fi
