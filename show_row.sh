#!/bin/bash

echo $@

FILE=$1

COLUMNS=$(head -n 1 ${FILE} | sed 's/\t/\n/g' | wc -l)

if [[ -z $2 ]]
then
    paste <(seq ${COLUMNS}) <(head -n 1 ${FILE} | sed 's/\t/\n/g') | column -nts$'\t'
elif [[ -z $3 ]]
then
    paste <(seq ${COLUMNS}) <(head -n 1 ${FILE} | sed 's/\t/\n/g') <(sed "$2q;d" ${FILE} | sed 's/\t/\n/g') | column -nts$'\t'
elif [[ -z $4 ]]
then
    paste <(seq ${COLUMNS}) <(head -n 1 ${FILE} | sed 's/\t/\n/g') <(sed "$2q;d" ${FILE} | sed 's/\t/\n/g') <(sed "$3q;d" ${FILE} | sed 's/\t/\n/g') | column -nts$'\t'
elif [[ -z $5 ]]
then
    paste <(seq ${COLUMNS}) <(head -n 1 ${FILE} | sed 's/\t/\n/g') <(sed "$2q;d" ${FILE} | sed 's/\t/\n/g') <(sed "$3q;d" ${FILE} | sed 's/\t/\n/g') <(sed "$4q;d" ${FILE} | sed 's/\t/\n/g') | column -nts$'\t'
fi
