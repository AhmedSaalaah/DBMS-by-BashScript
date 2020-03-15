#!/bin/bash
awk -F , '{printf "|";for (i=1;i<=NF;i++) {if ($i != "," && $i != ""){printf " "$i" |"}else {printf ""}};print ""}'  ./${sentence[3]}.csv
